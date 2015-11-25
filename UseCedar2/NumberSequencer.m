//
//  NumberSequencer.m
//  UseCedar
//
//  Created by 刘延峰 on 15/11/25.
//  Copyright © 2015年 刘大帅. All rights reserved.
//

#import "NumberSequencer.h"

@interface NumberSequencer ()

@property (nonatomic) int interval;

@end

@implementation NumberSequencer

- (instancetype)init {

    if (self = [super init]) {
        
        self.interval = 1;
    }
    
    return self;
}

- (instancetype)initWithInterval:(int)number {

    if (self = [super init]) {
        
        self.interval = number;
    }
    
    return self;
    
}

- (int)nextAfter:(int)number {

    return number + self.interval;
}

- (int)previousBefore: (int)number {

    return number - self.interval;
}

@end
