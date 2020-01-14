//
//  JDLRouterInjection.m
//  JDLRouter
//
//  Created by 郑振兴 on 2020/1/14.
//

#import "JDLRouterInjection.h"
#import "JDLDns.h"
#import "JDLDnsProvider.h"
#import "JDLLauncherPad.h"
#import "JDLPatcher.h"
@implementation JDLRouterInjection
+ (instancetype)instance {
    static JDLRouterInjection *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[[self class] alloc] init];
    });
    return instance;
}
- (instancetype)init {
    if (self = [super init]) {
    }
    return self;
}
- (id<JDLRouter>)router {
    if (!_router) {
        id<JDLDnsProvider> provider = [[JDLDnsProvider alloc] init];
        id<JDLDns> dns = [[JDLDns alloc] initWithProvider:provider];
        id<JDLPatcher> patcher = [[JDLPatcher alloc] init];
        id<JDLLauncherPad> launcher = [[JDLLauncherPad alloc] init];
        _router = [[JDLRouter alloc] initWithDns:dns launcherPad:launcher patcher:patcher];
    }
    return _router;
}
@end
