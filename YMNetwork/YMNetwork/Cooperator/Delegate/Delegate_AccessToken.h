//
//  Delegate_AccessToken.h
//  YMNetwork
//
//  Created by 刘艳梅 on 2017/12/11.
//  Copyright © 2017年 刘艳梅. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Response_AccessToken.h"

@protocol Delegate_AccessToken <NSObject>
- (void)accessTokenResult:(YMNetResult *)result response:(Response_AccessToken *)response;
@end
