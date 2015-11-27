//
//  NumberSequencer.h
//  UseCedar
//
//  Created by FrankLiu on 15/11/25.
//  Copyright © 2015年 刘大帅. All rights reserved.
//
//  https://github.com/yafoolaw
//  http://www.jianshu.com/users/09e77d340dcf/latest_articles
//

#import <Foundation/Foundation.h>

@interface NumberSequencer : NSObject


- (instancetype)initWithInterval:(int)number;
- (int)nextAfter:(int)number;
- (int)previousBefore: (int)number;

@end
