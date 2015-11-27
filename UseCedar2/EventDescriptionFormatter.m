//
//  EventDescriptionFormatter.m
//  UseCedar2
//
//  Created by 刘延峰 on 15/11/27.
//  Copyright © 2015年 刘大帅. All rights reserved.
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
