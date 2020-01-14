//
//  JDLPatcher.m
//  Pods-JDLRouter_Example
//
//  Created by 郑振兴 on 2020/1/14.
//

#import "JDLPatcher.h"
#import "NSString+JDLRouter.h"

@interface JDLPatcher ()
@property (nonatomic, strong) NSMutableDictionary<NSString *, id<JDLRouterLogicPatch>> *patchMap;
@end

@implementation JDLPatcher
- (NSMutableDictionary<NSString *, id<JDLRouterLogicPatch>> *)patchMap {
    if (!_patchMap) {
        JDLRouterLogicPatch *patch = [[JDLRouterLogicPatch alloc] init];
        _patchMap = [@{patch.indentifire : patch} mutableCopy];
    }
    return _patchMap;
}
- (void)registerLogicPatch:(id<JDLRouterLogicPatch>)patch {
    if (!patch.indentifire.isEmpty) {
        return;
    }
    [self.patchMap setValue:patch forKey:patch.indentifire];
}
- (void)unRegisterLogicPatch:(NSString *)indentifire {
    if (!indentifire.isEmpty) {
        return;
    }
    [self.patchMap removeObjectForKey:indentifire];
}
- (void)patchPage:(id<JDLPage>)page {

    __block BOOL isPatched = NO;

    [self.patchMap enumerateKeysAndObjectsUsingBlock:^(NSString *_Nonnull key, id<JDLRouterLogicPatch> _Nonnull patch, BOOL *_Nonnull stop) {
        if ([patch isNeedPatch:page]) {
            isPatched = YES;
            [patch patchPage:page];
        }
    }];

    if (!isPatched) {

        [page updateStage:JDLPageStageLaunch];
    }
}
@end
