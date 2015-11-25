#import <Cedar/Cedar.h>
#import "NumberSequencer.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(NumberSequencerSpec)

/* beforeEach 相当于 setup */
describe(@"NumberSequencer", ^{
    __block NumberSequencer *myNumberSequencer;
    
    beforeEach(^{
        myNumberSequencer = [NumberSequencer new];
    });
    
    it(@"nextAfter: returns the next integer greater than the argument", ^{
        
        [myNumberSequencer nextAfter:2] should equal(3);
    });
});


/* subjectAction 用于描述一个 top-level 的方法或事件,它和beforeEach的区别在于,在一个作用域里,它只能有一个,而且,它在所有beforeEach之后执行 */
describe(@"thing", ^{
    __block BOOL parameter;
    
//    subjectAction(^{ [object doThingWithParameter:parameter]; });
    
    describe(@"when something is true", ^{
        beforeEach(^{
            parameter = YES;
        });
        
        it(@"should ...", ^{
            // ...
        });
    });
});

/* context 是 describe 的别名,用于描述不同状态或环境 */
describe(@"NumberSequencer", ^{
   
    __block NumberSequencer *myNumberSequencer;
    
    context(@"when created with the default constructor", ^{
        
        beforeEach(^{
            
            myNumberSequencer = [NumberSequencer new];
        });
        
        it(@"nextAfter: returns the next integer greater than the argument", ^{
            
            [myNumberSequencer nextAfter:2] should equal(3);
        });
        
        it(@"previousBefore:returns the largest number less than the argument", ^{
            
            [myNumberSequencer previousBefore:2] should equal(0);
        });
       
    context(@"when constructed with an interval", ^{
            
            beforeEach(^{
                
                myNumberSequencer = [[NumberSequencer alloc] initWithInterval:2];
            });
            
            it(@"nextAfter: returns the sum of the argument and the interval", ^{
                
                [myNumberSequencer nextAfter:2] should equal(4);
            });
            
            it(@"previousBefore: returns the difference between the argument and the interval", ^{
                
                [myNumberSequencer previousBefore:2] should equal(-1);
            });
        });
    });
});

/* +beforeEach 和 +afterEach 相当于全局 beforeEach 和 afterEach, 它们先于所有spec前执行 */

/* Cedar 支持 shared example groups */
sharedExamplesFor(@"a similarly-behaving thing", ^(NSDictionary *sharedContext) {
    it(@"should do something common", ^{
        //...
    });
});

describe(@"Something that shares behavior", ^{
    itShouldBehaveLike(@"a similarly-behaving thing");
});

describe(@"Something else that shares behavior", ^{
    itShouldBehaveLike(@"a similarly-behaving thing");
});

sharedExamplesFor(@"a red thing", ^(NSDictionary *sharedContext) {
    it(@"should be red", ^{
//        Thing *thing = [sharedContext objectForKey:@"thing"];
//        expect(thing.color).to(equal(red));
    });
});

describe(@"A fire truck", ^{
    beforeEach(^{
//        [[SpecHelper specHelper].sharedExampleContext setObject:[FireTruck fireTruck] forKey:@"thing"];
    });
    itShouldBehaveLike(@"a red thing");
});

describe(@"An apple", ^{
    beforeEach(^{
//        [[SpecHelper specHelper].sharedExampleContext setObject:[Apple apple] forKey:@"thing"];
    });
    itShouldBehaveLike(@"a red thing");
});

SPEC_END
