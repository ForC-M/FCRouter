# FCRouter


URL Router for iOS(object-c/swift). Async Register Mapping Relation

Inspired : 

[HHRouter](https://github.com/lightory/HHRouter)

[ABRouter](https://github.com/aaronbrethorst/ABRouter)

[Routable iOS](https://github.com/usepropeller/routable-ios)


## Installation


### [cocoapods](https://cocoapods.org/)

```ruby
pod 'FCRouter', '~> 0.1.2'
```

```objective-c
#import <FCRouter/FCRouter.h>
```


### [gitsubmodule](http://schacon.github.io/git/user-manual.html#submodules)

```git
$ git submodule add https://github.com/Heqiao1025/FCRouter
```


## Usage


### Launching

```objective-c
- (void)regsiterUrl:(NSString *)url mapViewControllerClass:(Class)VCClass;
```

```objective-c
- (UIViewController *)matchViewControllerWithUrl:(NSString *)url;
```

## Feature

### URL Query Params

```objective-c
UIViewController *vc = [FCRouter.share matchViewControllerWithUrl:@"ForC://mine/setting/replacePassword?id=1002&author=ForC"]
```

### URL variable path

```objective-c
UIViewController *vc = [FCRouter.share matchViewControllerWithUrl:@"ForC://mine/:userID/replacePassword"]
```

### Register Handle

```objective-c
- (void)regsiterUrl:(NSString *)url mapHandle:(FCRouterHandle)handle
```

### Register Plist Map

```objective-c
- (void)regsiterPlistPathForSource:(NSString *)source bundle:(NSBundle *)bundle;
```

## Test
[Detail in FCRouterTests.m](https://github.com/Heqiao1025/FCRouter/blob/master/FCRouterTests/FCRouterTests.m)


## contact 
- [heqiao.china@gmail.com](mailto:heqiao.china@gmail.com)


[LICENSE](https://github.com/Heqiao1025/FCRouter/blob/master/LICENSE)
