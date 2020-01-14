//
//  JDLLauncher.h
//  Pods-JDLRouter_Example
//
//  Created by 郑振兴 on 2020/1/14.
//

#import "JDLPage.h"
#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN
@protocol JDLLauncher <NSObject>
@property (nonatomic, strong) NSString *indentifire;
@property (nonatomic, strong) NSMutableDictionary<NSString *, NSMutableArray<NSString *> *> *paths;

- (void)launchPage:(id<JDLPage>)page failure:(void (^)(NSError *error))failure sucess:(void (^)(void))success callback:(void (^)(id data))callback;
@end

/// 默认Launcher实现，用于原生页面的跳转
@interface JDLLauncher : NSObject <JDLLauncher>
@property (nonatomic, strong) NSMutableDictionary<NSString *, NSMutableArray<NSString *> *> *paths;
@end

NS_ASSUME_NONNULL_END
