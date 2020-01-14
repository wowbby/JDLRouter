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
- (void)addLauncher:(id<JDLLauncher>)launcher;
- (void)removeLauncher:(id<JDLLauncher>)launcher;
- (id<JDLLauncher>)matchLauncher:(id<JDLPage>)page;
- (void)launchPage:(id<JDLPage>)page;
@end

@interface JDLLauncherPad : NSObject <JDLLauncherPad>

@end

NS_ASSUME_NONNULL_END
