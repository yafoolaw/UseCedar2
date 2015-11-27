//
//  EventDescriptionFormatter.h
//  UseCedar2
//
//  Created by 刘延峰 on 15/11/27.
//  Copyright © 2015年 刘大帅. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Event.h"

@interface EventDescriptionFormatter : NSObject

- (NSString*)eventDescriptionFromEvent:(id <Event>)event;

@end
