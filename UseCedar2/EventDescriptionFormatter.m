//
//  EventDescriptionFormatter.m
//  UseCedar2
//
//  Created by FrankLiu on 15/11/27.
//  Copyright © 2015年 刘大帅. All rights reserved.
//
//  https://github.com/yafoolaw
//  http://www.jianshu.com/users/09e77d340dcf/latest_articles
//

#import "EventDescriptionFormatter.h"
#import "NSDate+StringFormatter.h"

@implementation EventDescriptionFormatter

- (NSString*)eventDescriptionFromEvent:(id <Event>)event {

    NSString * eventDescription =
    [NSString stringWithFormat:@"%@:开始于%@,结束于%@",[event name],[[event startDate] descriptionString],[[event endDate] descriptionString]];
    
    return eventDescription;
}

@end
