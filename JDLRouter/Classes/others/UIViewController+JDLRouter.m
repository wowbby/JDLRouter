//
//  UIViewController+JDLRouter.m
//  JDLRouter
//
//  Created by 郑振兴 on 2020/1/14.
//

#import "UIViewController+JDLRouter.h"

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
@end
