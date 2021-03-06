//
//  NSDate+StringFormatter.m
//  UseCedar2
//
//  Created by FrankLiu on 15/11/27.
//  Copyright © 2015年 刘大帅. All rights reserved.
//
//  https://github.com/yafoolaw
//  http://www.jianshu.com/users/09e77d340dcf/latest_articles
//

#import "NSDate+StringFormatter.h"

@implementation NSDate (StringFormatter)

+ (NSDate *)dateFromString:(NSString *)dateString {
    
    NSDateFormatter * dateFormatter = [NSDateFormatter new];
    
    //zzz表示时区，zzz可以删除，这样返回的日期字符将不包含时区信息。
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSDate *destDate= [dateFormatter dateFromString:dateString];
    
    return destDate;
}

- (NSString *)descriptionString {
    
    NSDateFormatter * dateFormatter = [NSDateFormatter new];
    
    //zzz表示时区，zzz可以删除，这样返回的日期字符将不包含时区信息。
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSString *destDateString = [dateFormatter stringFromDate:self];
    
    return destDateString;
}

@end
