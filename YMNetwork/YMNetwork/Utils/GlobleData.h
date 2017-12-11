//
//  GlobleData.h
//  YMNetwork
//
//  Created by 刘艳梅 on 2017/12/11.
//  Copyright © 2017年 刘艳梅. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GlobleData : NSObject

@property(strong, nonatomic) NSString *clientId;
@property(strong, nonatomic) NSString *clientSecret;
@property(strong, nonatomic) NSString *userId;
//@property(strong, nonatomic) DfthUser *dfthUser;
//@property(strong, nonatomic) Response_MemberInfo *memberInfo;
//@property(strong, nonatomic) DfthDevice *device;

+ (instancetype)sharedInstance;

@end
