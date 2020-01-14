//
//  JDLPage.h
//  JDLRouter
//
//  Created by 郑振兴 on 2020/1/14.
//

#import <Foundation/Foundation.h>
//页面跳转过程中的阶段
typedef NS_ENUM(NSInteger, JDLPageStage) {
    JDLPageStageDns = 0,
    JDLPageStagePatch,
    JDLPageStageLaunch,
    JDLPageStageFinish
};
//页面跳转方式以及是否支持动画
typedef NS_ENUM(NSInteger, JDLPageTransformFlag) {
    JDLPageTransformFlagPushWithAnimation,
    JDLPageTransformFlagPresentWithAnimation,
    JDLPageTransformFlagPushWithoutAnimation,
    JDLPageTransformFlagPresentWithoutAnimation,
    JDLPageTransformFlagBack
};
NS_ASSUME_NONNULL_BEGIN

@protocol JDLPage <NSObject>

/// 页面跳转的URL
@property (nonatomic, copy, readonly) NSString *originURL;

/// 页面跳转URL所对应的本地URL
@property (nonatomic, copy) NSString *localURL;

/// 页面跳转过程阶段
@property (nonatomic, assign, readonly) JDLPageStage stage;

/// 页面跳转方式
@property (nonatomic, assign, readonly) JDLPageTransformFlag flag;

/// 更新页面阶段
/// @param stage JDLPageStage
- (void)updateStage:(JDLPageStage)stage;

/// 页面的scheme
- (NSString *)scheme;

/// 页面的路径
- (NSString *)path;

/// 根据参数名称查询参数
/// @param key 参数名称
- (NSURLQueryItem *)queryItemForKey:(NSString *)key;

/// 移除一个页面跳转参数
/// @param key key
- (void)moveQueryItemForKey:(NSString *)key;

/// 添加一个页面跳转参数
/// @param key 参数名称
/// @param value 参数值
- (void)addQueryItemForKey:(NSString *)key value:(NSString *)value;

/// 更新一个页面跳转参数的值
/// @param key 参数名称
/// @param value 参数值
- (void)updateQueryItemForKey:(NSString *)key value:(NSString *)value;

@end

@interface JDLPage : NSObject <JDLPage>
@property (nonatomic, copy, readonly) NSString *originURL;
@property (nonatomic, copy) NSString *localURL;
@property (nonatomic, assign, readonly) JDLPageStage stage;
@property (nonatomic, assign, readonly) JDLPageTransformFlag flag;
- (instancetype)initWithOriginURL:(NSString *)originURL;

@end

NS_ASSUME_NONNULL_END
