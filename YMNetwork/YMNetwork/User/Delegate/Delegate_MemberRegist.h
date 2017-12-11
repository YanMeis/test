//
//  Delegate_MemberRegist.h
//  YMNetwork
//
//  Created by 刘艳梅 on 2017/12/11.
//  Copyright © 2017年 刘艳梅. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Response_MemberRegist.h"

@protocol Delegate_MemberRegist <NSObject>
- (void)memberRegistResult:(YMNetResult *)result response:(Response_MemberRegist *)response;
@end
