//
//  JDLLauncherPad.m
//  JDLRouter
//
//  Created by 郑振兴 on 2020/1/14.
//

#import "JDLLauncherPad.h"
#import "JDLRouterException.h"
@interface JDLLauncherPad ()
@property (nonatomic, strong) NSMutableDictionary<NSString *, NSArray<id<JDLLauncher>> *> *launchers;
@end

@implementation JDLLauncherPad
- (instancetype)init {
    if (self = [super init]) {
    }
    return self;
}
- (NSMutableDictionary<NSString *, NSArray<id<JDLLauncher>> *> *)launchers {
    if (!_launchers) {
        _launchers = [@{} mutableCopy];
    }
    return _launchers;
}
- (void)launchPage:(id<JDLPage>)page failure:(void (^)(NSError *error))failure sucess:(void (^)(void))success callback:(void (^)(id data))callback {
    id<JDLLauncher> launcher = [self matchLauncher:page];
    if (!launcher) {
        if (failure) {
            NSError *error = [NSError errorWithDomain:kJDLRouterErrorDomain code:JDLRouterErrorCodePageLauncherNotFound userInfo:nil];
            failure(error);
        }
        return;
    }
    [launcher launchPage:page failure:failure sucess:success callback:callback];
}
- (void)addLauncher:(id<JDLLauncher>)launcher {
    NSArray<NSString *> *schemes = launcher.paths.allKeys;
    [schemes enumerateObjectsUsingBlock:^(NSString *_Nonnull obj, NSUInteger idx, BOOL *_Nonnull stop) {
        NSMutableArray<id<JDLLauncher>> *launchers = [self.launchers[obj] mutableCopy] ?: [@[] mutableCopy];
        if (![launchers containsObject:launcher]) {
            [launchers addObject:launcher];
        }
        self.launchers[obj] = launchers;
    }];
}
- (id<JDLLauncher>)matchLauncher:(id<JDLPage>)page {
    NSArray<id<JDLLauncher>> *launchers = self.launchers[page.scheme];
    if (!launchers.count) {
        return nil;
    }
    __block id<JDLLauncher> targetLauncher;
    __block NSInteger matchLength = 0;
    [launchers enumerateObjectsUsingBlock:^(id<JDLLauncher> _Nonnull obj, NSUInteger idx, BOOL *_Nonnull stop) {
        NSInteger tMatchLength = [self matchPage:page launcher:obj];

        if (tMatchLength > matchLength) {
            targetLauncher = obj;
            matchLength = tMatchLength;
        }
    }];

    return targetLauncher;
}
- (NSInteger)matchPage:(id<JDLPage>)page launcher:(id<JDLLauncher>)launcher {
    if (![launcher.paths.allKeys containsObject:page.scheme]) {
        return 0;
    }
    NSArray<NSString *> *paths = [launcher.paths valueForKey:page.scheme];
    __block NSInteger macthPathLength = 0;
    [paths enumerateObjectsUsingBlock:^(NSString *_Nonnull obj, NSUInteger idx, BOOL *_Nonnull stop) {
        if ([page.path containsString:obj]) {
            if (macthPathLength == 0 || obj.length < page.path.length) {
                macthPathLength = obj.length;
            }
        }
    }];
    if (macthPathLength == 0) {
        return 1;
    }
    return macthPathLength;
}
- (void)removeLauncher:(id<JDLLauncher>)launcher {

    NSArray<NSString *> *schemes = launcher.paths.allKeys;
    [schemes enumerateObjectsUsingBlock:^(NSString *_Nonnull obj, NSUInteger idx, BOOL *_Nonnull stop) {
        NSMutableArray<id<JDLLauncher>> *launchers = [self.launchers[obj] mutableCopy] ?: [@[] mutableCopy];
        if ([launchers containsObject:launcher]) {
            [launchers removeObject:launcher];
        }
    }];
}
@end
