//
//  Request_Oauth.h
//  YMNetwork
//
//  Created by 刘艳梅 on 2017/12/11.
//  Copyright © 2017年 刘艳梅. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Request_Oauth : NSObject

@property (nonatomic, copy) NSString *client_id;
@property (nonatomic, copy) NSString *response_type;    //@"code"
@property (nonatomic, copy) NSString *redirect_uri;     //@"http://none"

@end
