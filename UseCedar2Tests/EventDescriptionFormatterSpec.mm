//
//  EventDescriptionFormatterSpec.mm
//  UseCedar2Tests
//
//  Created by FrankLiu on 15/11/25.
//  Copyright © 2015年 刘大帅. All rights reserved.
//
//  https://github.com/yafoolaw
//  http://www.jianshu.com/users/09e77d340dcf/latest_articles
//

#import <Cedar/Cedar.h>
#import "EventDescriptionFormatter.h"
#import "NSDate+StringFormatter.h"
#import "Event.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(EventDescriptionFormatterSpec)

describe(@"EventDescriptionFormatter", ^{
    
    __block EventDescriptionFormatter * desFormatter;
    __block NSString                  * description;
    __block id<CedarDouble,Event>       fakeEvent;


    beforeEach(^{

        NSDate * startDate = [NSDate dateFromString:@"2015-11-27 09:52:00"];
        NSDate * endDate   = [NSDate dateFromString:@"2015-11-27 10:52:00"];
        
        fakeEvent = nice_fake_for(@protocol(Event));
        fakeEvent stub_method("name").and_return(@"Fixture Time");
        fakeEvent stub_method("startDate").and_return(startDate);
        fakeEvent stub_method("endDate").and_return(endDate);
        
        desFormatter = [EventDescriptionFormatter new];
        description  = [desFormatter eventDescriptionFromEvent:fakeEvent];
    });
    
    it(@"should return formatted description", ^{
       
        expect(description).to(equal(@"Fixture Time:开始于2015-11-27 09:52:00,结束于2015-11-27 10:52:"));
    });
});

SPEC_END
