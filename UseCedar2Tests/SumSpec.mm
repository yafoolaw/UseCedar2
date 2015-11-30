//
//  SumSpec.mm
//  UseCedar2Tests
//
//  Created by FrankLiu on 15/11/25.
//  Copyright © 2015年 刘大帅. All rights reserved.
//
//  https://github.com/yafoolaw
//  http://www.jianshu.com/users/09e77d340dcf/latest_articles
//

#import <Cedar/Cedar.h>
#import "Sum.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(SumSpec)

describe(@"Sum", ^{
    
    __block Sum<CedarDouble> *fakeSum;
    __block int               sum;

    beforeEach(^{
        
        fakeSum = nice_fake_for([Sum class]);
        fakeSum stub_method("sumOfThreeNumbers:number2:number3:").and_return(10);
        sum = [fakeSum sumOfThreeNumbers:1 number2:2 number3:3];
        
        // 如果解开注释,调用会清零重置,所以下面的 "messages.count should equal(1);" 会报错 "Expected <0> to equal <1>"
//        [fakeSum reset_sent_messages];
    });
    
    it(@"send messages", ^{
        
        NSArray *messages = [fakeSum sent_messages];
        messages.count should equal(1);
        
        NSInvocation *firstInvocation = messages.firstObject;
        firstInvocation.selector should equal(@selector(sumOfThreeNumbers:number2:number3:));
        
        int firstParameter  = 0;
        int secondParameter = 0;
        int thirdParameter  = 0;
        
        // 参数捕获
        // Indices 0 and 1 indicate the hidden arguments self and _cmd, respectively; these values can be retrieved directly with the target and selector methods. Use indices 2 and greater for the arguments normally passed in a message.
        [firstInvocation getArgument:&firstParameter atIndex:2];
        firstParameter should equal(1);
        
        [firstInvocation getArgument:&secondParameter atIndex:3];
        secondParameter should equal(2);
        
        [firstInvocation getArgument:&thirdParameter atIndex:4];
        thirdParameter should equal(3);
        
    });
    
});

SPEC_END
