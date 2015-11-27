//
//  ViewControllerSpec.mm
//  UseCedar2Tests
//
//  Created by FrankLiu on 15/11/25.
//  Copyright © 2015年 刘大帅. All rights reserved.
//
//  https://github.com/yafoolaw
//  http://www.jianshu.com/users/09e77d340dcf/latest_articles
//

#import <Cedar/Cedar.h>
#import "ViewController.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(ViewControllerSpec)

describe(@"ViewController", ^{
    __block ViewController *viewController;

    beforeEach(^{

        viewController = [ViewController new];
    });
    
    describe(@"its tableView", ^{
        
        beforeEach(^{
            
            viewController.view should_not be_nil;
        });
        
        it(@"should have a dataSource", ^{
            
            viewController.tableView.dataSource should be_same_instance_as(viewController);
        });
        
        it(@"should have a delegate", ^{
            
            viewController.tableView.dataSource should be_same_instance_as(viewController);
        });
    });
    
    describe(@"its tableView cells", ^{
        
        __block UITableView<CedarDouble> * tableView;
        __block UITableViewCell * cell;
        
        beforeEach(^{
            
            viewController.view should_not be_nil;
            tableView =(id) viewController.tableView;
            tableView should_not be_nil;
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CellIdentifier"];
//            cell = fake_for([UITableViewCell class]);
//            cell stub_method(@selector(initWithStyle:reuseIdentifier:))

            spy_on(tableView);
            tableView stub_method(@selector(dequeueReusableCellWithIdentifier:)).and_return(cell);
            [tableView layoutSubviews];
        });
        
        it(@"should get the cell from its tableView", ^{
        
            [viewController tableView:tableView cellForRowAtIndexPath:nil] should be_same_instance_as(cell);
        });

        
        it(@"should have a lot of cells", ^{

            [tableView numberOfRowsInSection:0] should equal(20);
            tableView.visibleCells.count should be_greater_than_or_equal_to(100);
        });
    });
    
});

SPEC_END
