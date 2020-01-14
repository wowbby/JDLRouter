//
//  JDLRouter.m
//  Pods-JDLRouter_Example
//
//  Created by 郑振兴 on 2020/1/14.
//

#import "JDLRouter.h"
#import "JDLDns.h"
#import "JDLLauncher.h"
#import "JDLLauncherPad.h"
#import "JDLPage.h"
#import "JDLPatcher.h"
#import "JDLRouterException.h"
#import "NSString+JDLRouter.h"
@interface JDLRouter ()
@property (nonatomic, strong) id<JDLDns> dns;
@property (nonatomic, strong) id<JDLPatcher> patcher;
@property (nonatomic, strong) id<JDLLauncherPad> launcher;
@end

@implementation JDLRouter
- (instancetype)initWithDns:(id<JDLDns>)dns launcherPad:(id<JDLLauncherPad>)launcherPad patcher:(id<JDLPatcher>)patcher {
    if (self = [super init]) {
        self.dns = dns;
        self.launcher = launcherPad;
        self.patcher = patcher;
    }
    return self;
}
- (id<JDLDns>)dns {
    if (!_dns) {
        _dns = [[JDLDns alloc] init];
    }
    return _dns;
}
- (id<JDLPatcher>)patcher {
    if (!_patcher) {
        _patcher = [[JDLPatcher alloc] init];
    }
    return _patcher;
}
- (id<JDLLauncherPad>)launcher {
    if (!_launcher) {
        _launcher = [[JDLLauncherPad alloc] init];
    }
    return _launcher;
}
- (void)gotoPage:(NSString *)url failure:(failureBlock)failure sucess:(successBlock)success callback:(dataBlock)callback {

    // url 为空
    if (url.isEmpty) {
        if (failure) {
            NSError *error = [NSError errorWithDomain:kJDLRouterErrorDomain code:JDLRouterErrorCodeOriginURLNull userInfo:nil];
            failure(error);
        }
        return;
    }
    // url 不合法
    if (!url.isURL) {
        if (failure) {
            NSError *error = [NSError errorWithDomain:kJDLRouterErrorDomain code:JDLRouterErrorCodeOriginURLInvalid userInfo:nil];
            failure(error);
        }
        return;
    }
    id<JDLPage> page = [[JDLPage alloc] initWithOriginURL:url];

    if (!page) {
        if (failure) {
            NSError *error = [NSError errorWithDomain:kJDLRouterErrorDomain code:JDLRouterErrorCodePageInitFailure userInfo:nil];
            failure(error);
        }
        return;
    }

    [self.dns preparePage:page];
    [self patchPage:page];
    [self.launcher launchPage:page failure:failure sucess:success callback:callback];
}
- (void)patchPage:(id<JDLPage>)page {

    while (page.stage == JDLPageStagePatch) {
        [self.patcher patchPage:page];
    }
}
@end
