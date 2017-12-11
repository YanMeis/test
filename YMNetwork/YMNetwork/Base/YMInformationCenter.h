//
//  YMInformationCenter.h
//  YMNetwork
//
//  Created by 刘艳梅 on 2017/12/11.
//  Copyright © 2017年 刘艳梅. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YMCooperator.h"

@interface YMInformationCenter : NSObject <YMNetStateDelegate>

//@property (atomic, strong) DfthSDKConfig *config;
@property (atomic, strong) YMCooperator *cooperator;
//@property (atomic, copy) NSString *userId;
//@property (atomic, strong) NSMutableDictionary *ecgCentres;
//@property (nonatomic, strong) NSMutableDictionary *ecgMeasurePlans;
//@property (nonatomic, strong) NSMutableDictionary *ecgExceptions;

//@property (nonatomic, strong) NSArray<NSNumber*> *symptoms;
//@property (nonatomic, assign) int64_t symptomsLastTime; //单位毫秒
//@property (nonatomic, assign) BOOL isSelectBody;
//@property (nonatomic, assign) int64_t selectBodyTime;


+ (YMInformationCenter *)getInstance;
//+ (BOOL)canTransportFiles;

@end
