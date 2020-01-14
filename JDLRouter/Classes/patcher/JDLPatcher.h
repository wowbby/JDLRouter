//
//  JDLPatcher.h
//  Pods-JDLRouter_Example
//
//  Created by 郑振兴 on 2020/1/14.
//

#import "JDLPage.h"
#import "JDLRouterLogicPatch.h"
#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN

@protocol JDLPatcher <NSObject>
- (void)registerLogicPatch:(id<JDLRouterLogicPatch>)patch;
- (void)unRegisterLogicPatch:(NSString *)indentifire;
- (void)patchPage:(id<JDLPage>)page;
@end

@interface JDLPatcher : NSObject <JDLPatcher>

@end

NS_ASSUME_NONNULL_END
