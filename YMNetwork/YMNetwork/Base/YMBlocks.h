//
//  YMBlocks.h
//  YMNetwork
//
//  Created by 刘艳梅 on 2017/12/11.
//  Copyright © 2017年 刘艳梅. All rights reserved.
//

#ifndef YMBlocks_h
#define YMBlocks_h

#import "YMResult.h"
#import "User.h"

typedef void(^SimpleBlock)(YMResult * _Nonnull result);
typedef void(^LoginBlock)(YMResult * _Nonnull result, NSString  * _Nonnull userId);
typedef void(^RegistMemberBlock)(YMResult * _Nonnull result, User  * _Nonnull user);


#endif /* YMBlocks_h */
