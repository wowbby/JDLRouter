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

/// 跳转过程URL处理JDLRouterLogicPatch 的管理类
@protocol JDLPatcher <NSObject>

/// 注册一个patcher
/// @param patch JDLRouterLogicPatch
- (void)registerLogicPatch:(id<JDLRouterLogicPatch>)patch;

/// 取消注册一个patcher
/// @param indentifire indentifire
- (void)unRegisterLogicPatch:(NSString *)indentifire;

/// patch一个页面的URL
/// @param page JDLPage
- (void)patchPage:(id<JDLPage>)page;
@end

@interface JDLPatcher : NSObject <JDLPatcher>

@end

NS_ASSUME_NONNULL_END
