//
//  JDLDnsProvider.m
//  JDLRouter
//
//  Created by 郑振兴 on 2020/1/14.
//

#import "JDLDnsProvider.h"
#import "NSString+JDLRouter.h"
@interface JDLDnsProvider ()
@property (nonatomic, strong) NSMutableDictionary<NSString *, id<JDLDnsItem>> *dnsData;
@property (nonatomic, strong) dispatch_queue_t queue;
@end

@implementation JDLDnsProvider
@synthesize dnsData = _dnsData;
#pragma mark - property getter && setter -
- (NSMutableDictionary<NSString *, id<JDLDnsItem>> *)dnsData {
    if (!_dnsData) {
        _dnsData = [@{} mutableCopy];
    }
    return _dnsData;
}
- (void)setDnsData:(NSMutableDictionary<NSString *, id<JDLDnsItem>> *)dnsData {
    dispatch_barrier_async(self.queue, ^{
        self->_dnsData = dnsData;
    });
}
- (dispatch_queue_t)queue {
    if (!_queue) {
        _queue = dispatch_queue_create("JDLDnsProvider_Queue", DISPATCH_QUEUE_CONCURRENT);
    }
    return _queue;
}
#pragma mark - public method
- (void)setData:(NSDictionary<NSString *, NSString *> *)data {
    [data enumerateKeysAndObjectsUsingBlock:^(NSString *_Nonnull key, NSString *_Nonnull obj, BOOL *_Nonnull stop) {
        [self addItem:key value:obj];
    }];
}
- (void)addItem:(NSString *)key value:(NSString *)value {
    [self addItem:key value:value replace:NO];
}
- (void)addItem:(NSString *)key value:(NSString *)value replace:(BOOL)replace {
    if ([self isContainItemWithKey:key] && !replace) {
        return;
    }
    JDLDnsItem *item = [[JDLDnsItem alloc] initWithKey:key value:value];
    if (item) {
        dispatch_barrier_async(self.queue, ^{
            [self.dnsData setValue:item forKey:key];
        });
    }
}
- (void)removeItem:(NSString *)key {
    if (![self isContainItemWithKey:key]) {

        return;
    }
    [self.dnsData removeObjectForKey:key];
}
- (id<JDLDnsItem>)itemForKey:(NSString *)key {
    if (key.isEmpty || !key.isURL) {
        return nil;
    }
    return self.dnsData[key];
}
#pragma mark - private method
- (BOOL)isContainItemWithKey:(NSString *)key {
    return [self.dnsData.allKeys containsObject:key];
}
@end
