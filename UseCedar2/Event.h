//
//  Event.h
//  UseCedar2
//
//  Created by 刘延峰 on 15/11/27.
//  Copyright © 2015年 刘大帅. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Event <NSObject>

//@property (nonatomic, readonly) NSString * name;
//@property (nonatomic, readonly) NSDate   * startDate;
//@property (nonatomic, readonly) NSDate   * endDate;

- (NSString*)name;
- (NSDate*)startDate;
- (NSDate*)endDate;

@end
