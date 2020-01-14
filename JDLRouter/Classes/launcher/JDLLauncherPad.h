//
//  JDLLauncherPad.h
//  JDLRouter
//
//  Created by 郑振兴 on 2020/1/14.
//

#import "JDLLauncher.h"
#import "JDLPage.h"
#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN

@protocol JDLLauncherPad <NSObject>

/// 添加Launcher
/// @param launcher JDLLauncher
- (void)addLauncher:(id<JDLLauncher>)launcher;

/// 移除Launcher
/// @param launcher JDLLauncher
- (void)removeLauncher:(id<JDLLauncher>)launcher;

/// 匹配Launcher
/// @param page JDLLauncher
- (id<JDLLauncher>)matchLauncher:(id<JDLPage>)page;

/// 打开Page
/// @param page JDLPage
- (void)launchPage:(id<JDLPage>)page failure:(void (^)(NSError *error))failure sucess:(void (^)(void))success callback:(void (^)(id data))callback;
;
@end

@interface JDLLauncherPad : NSObject <JDLLauncherPad>

@end

NS_ASSUME_NONNULL_END
