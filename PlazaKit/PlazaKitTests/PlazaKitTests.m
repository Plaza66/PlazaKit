//
//  PlazaKitTests.m
//  PlazaKitTests
//
//  Created by liyan on 10/22/14.
//  Copyright (c) 2014 Plaza66. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "PKTestDataModel.h"
@interface PlazaKitTests : XCTestCase

@end

@implementation PlazaKitTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    NSDictionary *dic = @{@"key1":@"value1",@"key4":@[@"1",@"2"],@"key3":@"value3"};
    PKTestDataModel *model = [[PKTestDataModel alloc]initWithDict:dic];;
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
