//
//  NumberSequencer.h
//  UseCedar
//
//  Created by 刘延峰 on 15/11/25.
//  Copyright © 2015年 刘大帅. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NumberSequencer : NSObject


- (instancetype)initWithInterval:(int)number;
- (int)nextAfter:(int)number;
- (int)previousBefore: (int)number;

@end
