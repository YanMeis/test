//
//  Delegate_Oauth.h
//  YMNetwork
//
//  Created by 刘艳梅 on 2017/12/11.
//  Copyright © 2017年 刘艳梅. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Response_Oauth.h"

@protocol Delegate_Oauth <NSObject>
- (void)oauthResult:(YMNetResult *)result response:(Response_Oauth *)response;
@end
