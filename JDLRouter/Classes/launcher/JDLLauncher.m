//
//  JDLLauncher.m
//  Pods-JDLRouter_Example
//
//  Created by 郑振兴 on 2020/1/14.
//

#import "JDLLauncher.h"
#import "JDLRouterException.h"
#import "UIViewController+JDLRouter.h"

@implementation JDLLauncher
@synthesize indentifire;
- (NSString *)indentifire {
    return @"default";
}
- (NSMutableDictionary<NSString *, NSMutableArray<NSString *> *> *)paths {

    return [@{
        @"native" : @[],
    } mutableCopy];
}
- (void)launchPage:(id<JDLPage>)page failure:(void (^)(NSError *_Nonnull))failure sucess:(void (^)(void))success callback:(void (^)(id _Nonnull))callback {

    NSLog(@"默认launcher 匹配到");
    Class class = NSClassFromString([self classStringFromPage:page]);
    if (!class || [class isKindOfClass:UICollectionView.class]) {
        if (failure) {
            NSError *error = [NSError errorWithDomain:kJDLRouterErrorDomain code:JDLRouterErrorCodePageNativeClassNotFound userInfo:nil];
            failure(error);
        }
        return;
    }
    //    要跳转的目标页面初始化
    UIViewController *targetVC = [[class alloc] init];
    //    请求参数
    targetVC.queryItems = page.queryItems;
    //    参数回传回调
    targetVC.callback = callback;
    if (page.flag == JDLPageTransformFlagPushWithAnimation) {
        [[UIViewController currentViewController].navigationController pushViewController:targetVC animated:YES];
        if (success) {
            success();
        }
        return;
    }
    if (page.flag == JDLPageTransformFlagPresentWithAnimation) {
        [[UIViewController currentViewController] presentViewController:targetVC animated:YES completion:nil];
        if (success) {
            success();
        }
        return;
    }
    if (page.flag == JDLPageTransformFlagPushWithoutAnimation) {
        [[UIViewController currentViewController].navigationController pushViewController:targetVC animated:NO];
        if (success) {
            success();
        }
        return;
    }
    if (page.flag == JDLPageTransformFlagPresentWithoutAnimation) {
        [[UIViewController currentViewController] presentViewController:targetVC animated:NO completion:nil];
        if (success) {
            success();
        }
        return;
    }
}
- (NSString *)classStringFromPage:(id<JDLPage>)page {
    NSString *path = page.path;
    NSArray *pathComponents = [path componentsSeparatedByString:@"/"];
    return pathComponents.lastObject;
}
@end
