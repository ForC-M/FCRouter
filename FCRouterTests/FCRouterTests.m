//
//  FCRouterTests.m
//  FCRouterTests
//
//  Created by heqiao on 2019/3/18.
//  Copyright © 2019年 ForC. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FCRouter.h"
#import "ViewController.h"

#define FCRouterBase(str) [NSString stringWithFormat:@"ForC://%@", str]

@interface FCRouterTests : XCTestCase

@end

@implementation FCRouterTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
}

- (void)testClassAPINotQuery {
    [FCRouter.share regsiterUrl:FCRouterBase(@"mine/setting/replacePassword") mapViewControllerClass:[ViewController class]];
    [FCRouter.share regsiterUrl:FCRouterBase(@"mine/setting") mapViewControllerClass:[UIViewController class]];
     userInfo:@{@"old":@"123456", @"iphone":@"18840851362"}];
    
    NSDictionary *paramters = @{@"old":@"123456", @"iphone":@"18840851362",@"id":@"1002",@"author":@"ForC"};
    XCTAssertEqualObjects(NSStringFromClass(vc.class), @"ViewController");
    XCTAssertEqualObjects(vc.routerParamters[@"id"], paramters[@"id"]);
    XCTAssertEqualObjects(vc.routerParamters[@"iphone"], paramters[@"iphone"]);
    XCTAssertEqualObjects(vc.routerParamters[@"old"], paramters[@"old"]);
    XCTAssertEqualObjects(vc.routerParamters[@"author"], paramters[@"author"]);
}

- (void)testClassAPIContainQuery {
    [FCRouter.share regsiterUrl:FCRouterBase(@"authorCycle/:friendID/detail") mapViewControllerClass:[ViewController class]];
    UIViewController *vc = [FCRouter.share matchViewControllerWithUrl:FCRouterBase(@"authorCycle/1002/detail?id=1000&author=ForC") userInfo:@{@"sex":@"1", @"iphone":@"18840851362"}];
    
    NSDictionary *paramters = @{@"sex":@"1", @"iphone":@"18840851362",@"id":@"1000",@"author":@"ForC",@"friendID":@"1002"};
    XCTAssertEqualObjects(NSStringFromClass(vc.class), @"ViewController");
    XCTAssertEqualObjects(vc.routerParamters[@"id"], paramters[@"id"]);
    XCTAssertEqualObjects(vc.routerParamters[@"iphone"], paramters[@"iphone"]);
    XCTAssertEqualObjects(vc.routerParamters[@"sex"], paramters[@"sex"]);
    XCTAssertEqualObjects(vc.routerParamters[@"author"], paramters[@"author"]);
    XCTAssertEqualObjects(vc.routerParamters[@"friendID"], paramters[@"friendID"]);
}


- (void)testClassPlistAPI {
    [FCRouter.share regsiterPlistPathForSource:@"Test" bundle:[NSBundle mainBundle]];

    UIViewController *vc = [FCRouter.share matchViewControllerWithUrl:FCRouterBase(@"home/scan/album1")];
    UIViewController *vc1 = [FCRouter.share matchViewControllerWithUrl:FCRouterBase(@"home/scan/album7")];
    UIViewController *vc2 = [FCRouter.share matchViewControllerWithUrl:FCRouterBase(@"home/scan/album6")];
    UIViewController *vc3 = [FCRouter.share matchViewControllerWithUrl:FCRouterBase(@"home/scan/album4")];
    XCTAssertEqualObjects(NSStringFromClass(vc.class), @"UIViewController");
    XCTAssertEqualObjects(NSStringFromClass(vc1.class), @"UIViewController");
    XCTAssertEqualObjects(NSStringFromClass(vc2.class), @"ViewController");
    XCTAssertEqualObjects(NSStringFromClass(vc3.class), @"ViewController");
}

- (void)testHandleAPINotQuery {
    [FCRouter.share regsiterUrl:FCRouterBase(@"order/finish/orderID") mapHandle:^id(NSDictionary *paramters) {
        if ([paramters[@"orderID"] isEqualToString:@"10086"] && [paramters[@"userID"] isEqualToString:@"1000"]) {
            return @(YES);
        }
        return @(NO);
    }];
    id value1 = [FCRouter.share matchHandleWithUrl:FCRouterBase(@"order/finish/orderID?orderID=10086&userID=1000")];
    id value2 = [FCRouter.share matchHandleWithUrl:FCRouterBase(@"order/finish/orderID?orderID=10086&userID=1001")];
    XCTAssertEqual(value1, @(YES));
    XCTAssertEqual(value2, @(NO));
}

- (void)testHandleAPIContainQuery {
    [FCRouter.share regsiterUrl:FCRouterBase(@"order/:status/orderID") mapHandle:^id(NSDictionary *paramters) {
        if ([paramters[@"status"] isEqualToString:@"finish"]) {
            return @(YES);
        }
        return @(NO);
    }];
    id value1 = [FCRouter.share matchHandleWithUrl:FCRouterBase(@"order/fail/orderID?orderID=10086&userID=1000")];
    id value2 = [FCRouter.share matchHandleWithUrl:FCRouterBase(@"order/finish/orderID?orderID=10086&userID=1001")];
    XCTAssertEqual(value1, @(NO));
    XCTAssertEqual(value2, @(YES));
}

@end
