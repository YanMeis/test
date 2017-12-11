//
//  YMNetConfig.h
//  YMNetwork
//
//  Created by 刘艳梅 on 2017/12/11.
//  Copyright © 2017年 刘艳梅. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YMNetConfig : NSObject

@property(nonatomic, strong) NSString *baseUrl;
@property(nonatomic, strong) NSString *accessToken;
@property (nonatomic, assign) int timeout;
@property(nonatomic, assign, getter=isDebug) BOOL debug;

@end
