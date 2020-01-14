//
//  JDLDnsProvider.h
//  JDLRouter
//
//  Created by 郑振兴 on 2020/1/14.
//

#import "JDLDnsItem.h"
#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN

@protocol JDLDnsProvider <NSObject>
@property (nonatomic, strong, readonly) NSMutableDictionary<NSString *, id<JDLDnsItem>> *dnsData;
- (void)setData:(NSDictionary<NSString *, NSString *> *)data;
- (void)addItem:(NSString *)key value:(NSString *)value;
- (void)addItem:(NSString *)key value:(NSString *)value replace:(BOOL)replace;
- (void)removeItem:(NSString *)key;
- (id<JDLDnsItem>)itemForKey:(NSString *)key;
@end

@interface JDLDnsProvider : NSObject <JDLDnsProvider>
@property (nonatomic, strong, readonly) NSMutableDictionary<NSString *, id<JDLDnsItem>> *dnsData;

@end

NS_ASSUME_NONNULL_END
