//  The MIT License (MIT)
//
//  Copyright (c) 2019 ForC heqiao.china@gmail.com
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the “Software”), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

#import <Foundation/Foundation.h>
#import <UIKit/UIViewController.h>

typedef id(^FCRouterHandle)(NSDictionary *paramters);
FOUNDATION_EXPORT NSString *FCRouterKey;

@interface UIViewController (FCRouter)

@property (nonatomic, strong) NSDictionary *routerParamters;

@end

@interface FCRouter : NSObject

+ (instancetype)share;

/**
 通过plist注册模块或页面间映射关系

 @param source 路径
 @param bundle bundle
 */
- (void)regsiterPlistPathForSource:(NSString *)source bundle:(NSBundle *)bundle;

/**
 注册一条模块映射关系

 @param url         url-router
 @param VCClass     class
 */
- (void)regsiterUrl:(NSString *)url mapViewControllerClass:(Class)VCClass;

/**
 注册一条业务处理映射关系
 
 @param url         url-router
 @param handle      handle
 */
- (void)regsiterUrl:(NSString *)url mapHandle:(FCRouterHandle)handle;

/**
 匹配一条映射关系
 
 @param url         url-router
 */
- (UIViewController *)matchViewControllerWithUrl:(NSString *)url;

/**
 匹配一条映射关系
 
 @param url         url-router
 @param userInfo    传递非常规对象
 */
- (UIViewController *)matchViewControllerWithUrl:(NSString *)url userInfo:(NSDictionary *)userInfo;

- (UIViewController *)openUrl:(NSString *)url;

/**
 匹配一条业务处理
 
 @param url         url-router
 */
- (id)matchHandleWithUrl:(NSString *)url;

/**
 匹配一条业务处理
 
 @param url         url-router
 @param userInfo    传递非常规对象
 */
- (id)matchHandleWithUrl:(NSString *)url userInfo:(NSDictionary *)userInfo;

/**
 删除一条业务处理
 
 @param url         url-router
 */
- (void)removeHandleWithUrl:(NSString *)url;

/**
 判断是否可打开
 */
+ (BOOL)canOpenUrl:(NSString *)url;

@end
