//
//  StringUtils.m
//  YMNetwork
//
//  Created by 刘艳梅 on 2017/12/11.
//  Copyright © 2017年 刘艳梅. All rights reserved.
//

#import "StringUtils.h"

@implementation StringUtils

+(BOOL)isPhone:(NSString*)name
{
    NSString *rex = @"^[1]\\d{10}$";
    NSPredicate *p = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",rex];
    return [p evaluateWithObject:name];
}

+(BOOL)isPhoneAreaCode:(NSString *)areaCode phoneName:(NSString*)name
{
    NSString *rex = @"^[1]\\d{10}$";
    NSPredicate *p = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",rex];
    if([areaCode compare:@"+86"] == NSOrderedSame)
        return [p evaluateWithObject:name];
    else if([name length] > 0)
        return YES;
    return NO;
}
+(BOOL)isName:(NSString*)name
{
    NSString *rex = @"[a-zA-Z0-9_\u4e00-\u9fa5]+";
    NSPredicate *p = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rex];
    return ([p evaluateWithObject:name] || [self isEqual:name]);
}

+(BOOL)isEmail:(NSString*)name
{
    NSString *rex = @"^[a-zA-Z0-9][\\w\\.-]*[a-zA-Z0-9]@[a-zA-Z0-9][\\w\\.-]*[a-zA-Z0-9]\\.[a-zA-Z\\.]*[a-zA-Z]$";
    NSPredicate *p = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",rex];
    return [p evaluateWithObject:name];
}

//+(std::string)NSStringToString:(NSString*)string1
//{
//    const char* dest = [string1 UTF8String];
//    std::string str(dest);
//    return str;
//}

+(BOOL)isNull:(NSString*)string
{
    if(!string)
    {
        return YES;
    }
    if([@"" compare:string] == NSOrderedSame)
    {
        return YES;
    }
    return NO;
}



+ (NSData *)convertHexStrToData:(NSString *)str {
    if (!str || [str length] == 0) {
        return nil;
    }
    
    NSMutableData *hexData = [[NSMutableData alloc] initWithCapacity:8];
    NSRange range;
    if ([str length] % 2 == 0) {
        range = NSMakeRange(0, 2);
    } else {
        range = NSMakeRange(0, 1);
    }
    for (NSInteger i = range.location; i < [str length]; i += 2) {
        unsigned int anInt;
        NSString *hexCharStr = [str substringWithRange:range];
        NSScanner *scanner = [[NSScanner alloc] initWithString:hexCharStr];
        
        [scanner scanHexInt:&anInt];
        NSData *entity = [[NSData alloc] initWithBytes:&anInt length:1];
        [hexData appendData:entity];
        
        range.location += range.length;
        range.length = 2;
    }
    
    return hexData;
}

+ (NSString *)convertDataToHexStr:(NSData *)data from:(int)start to:(NSUInteger)end{
    if (!data || [data length] == 0) {
        return @"";
    }
    NSMutableString *string = [[NSMutableString alloc] initWithCapacity:[data length]];
    
    [data enumerateByteRangesUsingBlock:^(const void *bytes, NSRange byteRange, BOOL *stop) {
        unsigned char *dataBytes = (unsigned char*)bytes;
        NSUInteger count = end < byteRange.length? end: byteRange.length;
        for (NSInteger i = start; i < count; i++) {
            NSString *hexStr = [NSString stringWithFormat:@"0x%02X", (dataBytes[i]) & 0xff];
            [string appendString:hexStr];
            [string appendString:@", "];
        }
    }];
    
    return string;
}

@end
