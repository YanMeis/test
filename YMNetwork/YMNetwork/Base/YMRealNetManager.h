//
//  YMRealNetManager.h
//  YMNetwork
//
//  Created by 刘艳梅 on 2017/12/11.
//  Copyright © 2017年 刘艳梅. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>
#import "YMNetConfig.h"
#import "YMNetStateDelegate.h"

typedef NS_ENUM(NSUInteger,HTTPRequestType)
{
    HTTP_GET = 0,
    HTTP_POST,
    HTTP_UPLOAD,
    HTTP_StreamUpload,
    HTTP_Download,
};

typedef void(^NetDownloadBlock)(NSURLResponse * _Nonnull response, NSURL * _Nonnull filePath, NSError * _Nullable error);
typedef void(^NetCompleteBlock)(NSDictionary * _Nullable response, NSError * _Nullable error);
typedef void(^NetProgressBlock)(NSProgress * _Nonnull progress);

@interface YMRealNetManager : AFHTTPSessionManager

@property (nonatomic, strong) NSMutableArray<id<YMNetStateDelegate>> * _Nonnull delegates;

+ (void)appendNetStateDelegate:(id<YMNetStateDelegate> _Nonnull)delegate;
+ (void)removeNetStateDelegate:(id<YMNetStateDelegate> _Nonnull)delegate;

+ (void)initWithNetworking;
+ (void)setAccessToken:(NSString * _Nonnull)token;
+ (BOOL)isDebugMode;
+ (int)defaultTimeout;
+ (NSString * _Nonnull)getBaseUrl;

+ (BOOL)isReachable;

+ (NetworkStatus)getNetworkStatus;

+ (nullable NSURLSessionDataTask *)GET:(nonnull NSString *)urlString
                             paraments:(nullable id)paraments
                         completeBlock:(nullable NetCompleteBlock)completeBlock;

+ (nullable NSURLSessionDataTask *)POST:(nonnull NSString *)urlString
                              paraments:(nullable id)paraments
                          completeBlock:(nullable NetCompleteBlock)completeBlock;

+ (nullable NSURLSessionDataTask *)Upload:(nonnull NSString *)urlString
                                     data:(nonnull NSData *)data
                                 progress:(nullable NetProgressBlock)uploadProgressBlock
                            completeBlock:(nullable NetCompleteBlock)completeBlock;

+ (nullable NSURLSessionDataTask *)streamUpload:(nonnull NSURLRequest *)request
                                       progress:(nullable NetProgressBlock)progressBlock
                              completionHandler:(nullable NetCompleteBlock)completionHandler;

+ (nullable NSURLSessionDownloadTask *)streamDownload:(NSString *_Nonnull)urlString
                                             filePath:(NSString *_Nonnull)filePath
                                             progress:(NetProgressBlock _Nullable )downloadProgressBlock
                                    completionHandler:(NetDownloadBlock _Nonnull )completionHandler;
+ (nonnull NSString *)insertBaseUrl:(nonnull NSString *)url;
+ (nonnull NSString *)appendAccessToken:(nonnull NSString *)url;

@end
