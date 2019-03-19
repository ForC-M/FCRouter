//  Created by ForC on 2019/3/10.
//  Copyright © 2019年 ForC. All rights reserved.

#import <Foundation/Foundation.h>
#import <UIKit/UIViewController.h>

typedef id(^FCRouterHandle)(NSDictionary *paramters);
FOUNDATION_EXPORT NSString *FCRouterKey;

@interface UIViewController (FCRouter)

@property (nonatomic, strong) NSDictionary *routerParamters;

@end

@interface FCRouter : NSObject

+ (instancetype)share;

- (void)regsiterPlistPathForSource:(NSString *)source bundle:(NSBundle *)bundle;

- (void)regsiterUrl:(NSString *)url mapViewControllerClass:(Class)VCClass;

- (void)regsiterUrl:(NSString *)url mapHandle:(FCRouterHandle)handle;

- (UIViewController *)matchViewControllerWithUrl:(NSString *)url;

- (UIViewController *)matchViewControllerWithUrl:(NSString *)url userInfo:(NSDictionary *)userInfo;

- (UIViewController *)openUrl:(NSString *)url;

- (id)matchHandleWithUrl:(NSString *)url;

- (id)matchHandleWithUrl:(NSString *)url userInfo:(NSDictionary *)userInfo;

+ (BOOL)canOpenUrl:(NSString *)url;

@end
