//
//  User.h
//  YMNetwork
//
//  Created by 刘艳梅 on 2017/12/11.
//  Copyright © 2017年 刘艳梅. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (nonatomic, copy) NSString *userId;

@property (nonatomic, assign) NSTimeInterval birthday;
@property (nonatomic, assign) NSTimeInterval createTime;
@property (nonatomic, assign) int gender;
@property (nonatomic, assign) int height;
@property (nonatomic, assign) int weight;
@property (nonatomic, assign) long currentPlanCreateTime;
@property (nonatomic, copy) NSString *timeZone;

@property (nonatomic, copy) NSString *blood;
@property (nonatomic, assign) int credentialsType;
@property (nonatomic, copy) NSString *credentialsNumber;
@property (nonatomic, copy) NSString *email;
@property (nonatomic, copy) NSString *kindredName;
@property (nonatomic, copy) NSString *kindredNumber;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *nation;
@property (nonatomic, copy) NSString *nfcCardNo;
@property (nonatomic, copy) NSString *telNumber;
@property (nonatomic, copy) NSString *account;
@property (nonatomic, copy) NSString *password;

@property(nonatomic, strong) NSString *habits;
@property(nonatomic, strong) NSString *diseases;
@property(nonatomic, copy) NSString *consRecord;
@property(nonatomic, copy) NSString *serviceInfo;


- (instancetype)initWithName:(NSString *)name telephone:(NSString *)telephone birthday:(NSTimeInterval)birthday gender:(int)gender;
- (instancetype)initWithAccount:(NSString *)account password:(NSString *)password;

@end
