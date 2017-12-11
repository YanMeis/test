//
//  YMNetStateDelegate.h
//  YMNetwork
//
//  Created by 刘艳梅 on 2017/12/11.
//  Copyright © 2017年 刘艳梅. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger,NetworkStatus)
{
    NRS_Unknown = 0,
    NRS_NotReachable,
    NRS_WWAN,
    NRS_WiFi,
};

@protocol YMNetStateDelegate <NSObject>
- (void)netStateChangeFrom:(NetworkStatus)oldState to:(NetworkStatus)newState;
@end
