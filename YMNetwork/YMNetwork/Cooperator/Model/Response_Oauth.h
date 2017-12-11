//
//  Response_Oauth.h
//  YMNetwork
//
//  Created by 刘艳梅 on 2017/12/11.
//  Copyright © 2017年 刘艳梅. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Response_Oauth : NSObject

@property (nonatomic, copy) NSString *code;
@property (nonatomic, copy) NSString *orgId;
@property (nonatomic, assign) int64_t exprie_time;

@end
