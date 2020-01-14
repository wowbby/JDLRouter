//
//  UIViewController+JDLRouter.m
//  JDLRouter
//
//  Created by 郑振兴 on 2020/1/14.
//

#import "UIViewController+JDLRouter.h"
#import <objc/runtime.h>

static NSString *const kcallback = @"kcallback";
static NSString *const kqueryItems = @"kqueryItems";
@implementation UIViewController (JDLRouter)
+ (UIViewController *)currentViewController {
    UIWindow *window = [[UIApplication sharedApplication].delegate window];
    UIViewController *topViewController = [window rootViewController];

    while (true) {

        if (topViewController.presentedViewController) {

            topViewController = topViewController.presentedViewController;

        } else if ([topViewController isKindOfClass:[UINavigationController class]] && [(UINavigationController *) topViewController topViewController]) {

            topViewController = [(UINavigationController *) topViewController topViewController];

        } else if ([topViewController isKindOfClass:[UITabBarController class]]) {

            UITabBarController *tab = (UITabBarController *) topViewController;
            topViewController = tab.selectedViewController;

        } else {
            break;
        }
    }
    return topViewController;
}

- (void)setCallback:(void (^)(id _Nonnull))callback {
    objc_setAssociatedObject(self, &kcallback, callback, OBJC_ASSOCIATION_COPY);
}
- (void (^)(id _Nonnull))callback {
    return objc_getAssociatedObject(self, &kcallback);
}
- (void)setQueryItems:(NSArray<NSURLQueryItem *> *)queryItems {
    objc_setAssociatedObject(self, &kqueryItems, queryItems, OBJC_ASSOCIATION_RETAIN);
}
- (NSArray<NSURLQueryItem *> *)queryItems {
    return objc_getAssociatedObject(self, &kqueryItems);
}
@end
