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

/// 匹配Page，如果返回0，说明这个Launcher与page不匹配，如果返回1，说明只有schemer匹配，返回其他值代表path的匹配长度
/// @param page JDLPage
- (NSInteger)matchPage:(id<JDLPage>)page;
- (void)launchPage:(id<JDLPage>)page;
@end

@interface JDLLauncher : NSObject <JDLLauncher>
@property (nonatomic, strong) NSMutableDictionary<NSString *, NSMutableArray<NSString *> *> *paths;
@end

NS_ASSUME_NONNULL_END
