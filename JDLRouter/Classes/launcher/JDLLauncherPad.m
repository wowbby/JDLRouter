//
//  JDLLauncherPad.m
//  JDLRouter
//
//  Created by 郑振兴 on 2020/1/14.
//

#import "JDLLauncherPad.h"

@interface JDLLauncherPad ()
@property (nonatomic, strong) NSMutableDictionary<NSString *, NSArray<id<JDLLauncher>> *> *launchers;
@end

@implementation JDLLauncherPad
- (instancetype)init {
    if (self = [super init]) {

        [self addLauncher:[JDLLauncher new]];
    }
    return self;
}
- (NSMutableDictionary<NSString *, NSArray<id<JDLLauncher>> *> *)launchers {
    if (!_launchers) {
        _launchers = [@{} mutableCopy];
    }
    return _launchers;
}
- (void)launchPage:(id<JDLPage>)page {
    id<JDLLauncher> launcher = [self matchLauncher:page];
    [launcher launchPage:page];
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
        NSInteger tMatchLength = [obj matchPage:page];

        if (tMatchLength > matchLength) {
            targetLauncher = obj;
            matchLength = tMatchLength;
        }
    }];

    return targetLauncher;
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
