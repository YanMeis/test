//
//  Response_AccessToken.h
//  YMNetwork
//
//  Created by 刘艳梅 on 2017/12/11.
//  Copyright © 2017年 刘艳梅. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Response_AccessToken : NSObject

@property (nonatomic, copy) NSString *access_token;
@property (nonatomic, assign) int64_t expires_in;

@end
