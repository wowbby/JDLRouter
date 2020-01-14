//
//  JDLDns.h
//  Pods-JDLRouter_Example
//
//  Created by 郑振兴 on 2020/1/14.
//

#import "JDLDnsProvider.h"
#import "JDLPage.h"
#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN

@protocol JDLDns <NSObject>

/// 准备Page，根据page的OriginURL匹配DNS表中的URL
/// @param page JDLPage
- (void)preparePage:(id<JDLPage>)page;

/// 设置DNS表的数据
/// @param data NSDictionary<NSString *, NSString *> *
- (void)setData:(NSDictionary<NSString *, NSString *> *)data;

/// 向DNS表中添加单条数据
/// @param key originURL
/// @param value localURL
- (void)addItem:(NSString *)key value:(NSString *)value;

/// 替换DNS表中的某一条数据
/// @param key originURL
/// @param value localURL
/// @param replace 是否替换
- (void)addItem:(NSString *)key value:(NSString *)value replace:(BOOL)replace;

/// 移除DNS表中的数据
/// @param key originURL
- (void)removeItem:(NSString *)key;

/// 查询某一条DNS表中的数据
/// @param key originURL
- (id<JDLDnsItem>)itemForKey:(NSString *)key;
@end

@interface JDLDns : NSObject <JDLDns>
- (instancetype)initWithProvider:(id<JDLDnsProvider>)provider;
@end

NS_ASSUME_NONNULL_END
