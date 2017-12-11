//
//  YMRealNetManager.m
//  YMNetwork
//
//  Created by 刘艳梅 on 2017/12/11.
//  Copyright © 2017年 刘艳梅. All rights reserved.
//

#import "YMRealNetManager.h"
#import "YMNetResult.h"

static YMNetConfig *_config = nil;
static YMRealNetManager *_instance = nil;

@interface YMRealNetManager ()
@property (nonatomic, assign) NetworkStatus status;
@end

@implementation YMRealNetManager

+ (void)appendNetStateDelegate:(id<YMNetStateDelegate>)delegate{
    [_instance.delegates addObject:delegate];
}

+ (void)removeNetStateDelegate:(id<YMNetStateDelegate>)delegate{
    [_instance.delegates removeObject:delegate];
}

+ (void)initWithNetworking{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _config = [[YMNetConfig alloc] init];
        _instance = [[YMRealNetManager alloc] init];
    });
}

+ (void)setAccessToken:(NSString *)token{
    NSAssert(_config != nil, @"there is no config to set...");
    _config.accessToken = token;
}

+ (BOOL)isDebugMode{
    return [_config isDebug];
}

+ (int)defaultTimeout{
    return [_config timeout];
}

+ (NSString *)getBaseUrl{
    return _config.baseUrl;
}

+ (NetworkStatus)getNetworkStatus{
    return _instance.status;
}

- (instancetype)init{
    self = [super initWithBaseURL:[NSURL URLWithString:_config.baseUrl]];
    if (self) {
        _status = NRS_WiFi;
        _delegates = [[NSMutableArray alloc] init];
        
        NSURLCache *sharedCache = [[NSURLCache alloc] initWithMemoryCapacity:2*1024*1024
                                                                diskCapacity:100*1024*1024
                                                                    diskPath:nil];
        [NSURLCache setSharedURLCache:sharedCache];
        
        /**分别设置请求以及相应的序列化器*/
        self.requestSerializer = [AFJSONRequestSerializer serializer];
        /**设置请求超时时间*/
        self.requestSerializer.timeoutInterval = 3;
        /**设置相应的缓存策略*/
        self.requestSerializer.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;//NSURLRequestReloadIgnoringLocalCacheData;
        
        AFJSONResponseSerializer * response = [AFJSONResponseSerializer serializer];
        //        response.removesKeysWithNullValues = YES;
        self.responseSerializer = response;
        
        __block YMRealNetManager *blockSelf = self;
        [self.reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
            NetworkStatus old = blockSelf.status;
            switch (status) {
                case AFNetworkReachabilityStatusUnknown:
                    NSLog(@"未知网络状态");
                    blockSelf.status = NRS_Unknown;
                    break;
                case AFNetworkReachabilityStatusNotReachable:
                    NSLog(@"无网络");
                    blockSelf.status = NRS_NotReachable;
                    break;
                    
                case AFNetworkReachabilityStatusReachableViaWWAN:
                    NSLog(@"蜂窝数据网");
                    blockSelf.status = NRS_WWAN;
                    break;
                    
                case AFNetworkReachabilityStatusReachableViaWiFi:
                    NSLog(@"WiFi网络");
                    blockSelf.status = NRS_WiFi;
                    break;
                    
                default:
                    break;
            }
            
            if (old != _status){
                for (id<YMNetStateDelegate> d in blockSelf.delegates) {
                    [d netStateChangeFrom:old to:blockSelf.status];
                }
            }
        }] ;
    }
    [self.reachabilityManager startMonitoring];
    
    return self;
}

+ (BOOL)isReachable{
    return _instance.status == NRS_WiFi || _instance.status == NRS_WWAN;
}

+ (NSURLSessionDataTask *)GET:(NSString *)urlString
                    paraments:(id)paraments
                completeBlock:(NetCompleteBlock)completeBlock{
    
    return [_instance GET:[self appendAccessToken:urlString]
               parameters:paraments
                 progress:nil
                  success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary *  _Nullable responseObject) {
                      completeBlock(responseObject,nil);
                  }
                  failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                      if (error.code != NSURLErrorCancelled) {//请求取消
                          completeBlock(nil,error);
                      }
                  }];
}

+ (nullable NSURLSessionDataTask *)POST:(nonnull NSString *)urlString
                              paraments:(nullable id)paraments
                          completeBlock:(nullable NetCompleteBlock)completeBlock
{
    if ([urlString containsString:@"oauth/accessToken"]) {
        _instance.requestSerializer = [AFHTTPRequestSerializer serializer];
    }else{
        _instance.requestSerializer = [AFJSONRequestSerializer serializer];
    }
    
    return [_instance POST:[self appendAccessToken:urlString]
                parameters:paraments
                  progress:nil
                   success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                       completeBlock(responseObject,nil);
                   }
                   failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                       if (error.code != NSURLErrorCancelled) {//请求取消
                           // 请求失败
                           completeBlock(nil,error);
                       }
                   }];
}

+ (NSURLSessionDataTask *)Upload:(NSString *)urlString
                            data:(NSData *)data
                        progress:(NetProgressBlock)uploadProgressBlock
                   completeBlock:(NetCompleteBlock)completeBlock{
    
    urlString = [self insertBaseUrl:urlString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:[self appendAccessToken:urlString]]];
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/octet-stream" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:data];
    
    return [_instance uploadTaskWithRequest:request
                                   fromData:request.HTTPBody
                                   progress:^(NSProgress * _Nonnull uploadProgress) {
                                       if (uploadProgressBlock != NULL) {
                                           uploadProgressBlock(uploadProgress);
                                       }
                                   }
                          completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
                              if (error.code != NSURLErrorCancelled) {//请求取消
                                  completeBlock(responseObject,error);
                              }
                          }];
}

+ (NSURLSessionDataTask *)streamUpload:(NSURLRequest *)request
                              progress:(NetProgressBlock)uploadProgressBlock
                     completionHandler:(NetCompleteBlock)completionHandler{
    
    return [_instance uploadTaskWithStreamedRequest:request
                                           progress:^(NSProgress * _Nonnull uploadProgress) {
                                               if (_config.debug) {
                                                   NSLog(@"uploadProgress = %f", uploadProgress.fractionCompleted);
                                               }
                                               if (uploadProgressBlock != NULL) {
                                                   uploadProgressBlock(uploadProgress);
                                               }
                                           }
                                  completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
                                      if (error.code != NSURLErrorCancelled) {//请求取消
                                          completionHandler(responseObject,error);
                                      }
                                  }];
}

+ (NSURLSessionDownloadTask *)streamDownload:(NSString *)urlString filePath:(NSString *)filePath progress:(NetProgressBlock)downloadProgressBlock completionHandler:(NetDownloadBlock)completionHandler{
    urlString = [self insertBaseUrl:urlString];
    urlString = [self appendAccessToken:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    
    return [_instance downloadTaskWithRequest:request progress:downloadProgressBlock destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
        return [NSURL fileURLWithPath:filePath];
    } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
        NSLog(@"File downloaded to: %@", filePath);
        if (error.code != NSURLErrorCancelled) {//请求取消
            completionHandler(response, filePath,error);
        }
    }];
}

+(void)cancelAllRequest
{
    [_instance.operationQueue cancelAllOperations];
}

#pragma mark -   取消指定的url请求/
/**
 *  取消指定的url请求
 *
 *  @param requestType 该请求的请求类型
 *  @param string      该请求的完整url
 */
+(void)cancelHttpRequestWithRequestType:(NSString *)requestType
                       requestUrlString:(NSString *)string
{
    NSError * error;
    /**根据请求的类型 以及 请求的url创建一个NSMutableURLRequest---通过该url去匹配请求队列中是否有该url,如果有的话 那么就取消该请求*/
    NSString * urlToPeCanced = [[[_instance.requestSerializer
                                  requestWithMethod:requestType URLString:[self appendAccessToken:string] parameters:nil error:&error] URL] path];
    
    for (NSOperation * operation in _instance.operationQueue.operations) {
        //如果是请求队列
        if ([operation isKindOfClass:[NSURLSessionTask class]]) {
            //请求的类型匹配
            BOOL hasMatchRequestType = [requestType isEqualToString:[[(NSURLSessionTask *)operation currentRequest] HTTPMethod]];
            //请求的url匹配
            BOOL hasMatchRequestUrlString = [urlToPeCanced isEqualToString:[[[(NSURLSessionTask *)operation currentRequest] URL] path]];
            //两项都匹配的话  取消该请求
            if (hasMatchRequestType&&hasMatchRequestUrlString) {
                [operation cancel];
            }
        }
    }
}

+ (NSString *)appendAccessToken:(NSString *)url{
    if ([url containsString:@"oauth/authorize"] || [url containsString:@"oauth/accessToken"] ) {
        return url;
    }
    
    return [NSString stringWithFormat:@"%@?access_token=%@", url, _config.accessToken];
}

+ (NSString *)insertBaseUrl:(NSString *)url{
    return [NSString stringWithFormat:@"%@/%@", _config.baseUrl, url];
}

@end
