//
//  Request_AccessToken.h
//  YMNetwork
//
//  Created by 刘艳梅 on 2017/12/11.
//  Copyright © 2017年 刘艳梅. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YMCooperator.h"

@interface Request_AccessToken : NSObject

@property (nonatomic, copy) NSString *client_id;
@property (nonatomic, copy) NSString *client_secret;
@property (nonatomic, copy) NSString *code;
@property (nonatomic, copy) NSString *grant_type;       //@"authorization_code"
@property (nonatomic, copy) NSString *redirect_uri;     //@"http://none"

@end
