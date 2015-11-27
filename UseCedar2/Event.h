//
//  Event.h
//  UseCedar2
//
//  Created by FrankLiu on 15/11/27.
//  Copyright © 2015年 刘大帅. All rights reserved.
//
//  https://github.com/yafoolaw
//  http://www.jianshu.com/users/09e77d340dcf/latest_articles
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
