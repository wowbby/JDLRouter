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
@end

@implementation JDLDnsProvider
@synthesize dnsData = _dnsData;
- (instancetype)init {
    if (self = [super init]) {

        [self setData:@{@"http://jd.com" : @"native://test/JDLNextViewController"}];
    }
    return self;
}
#pragma mark - property getter && setter -
- (NSMutableDictionary<NSString *, id<JDLDnsItem>> *)dnsData {
    if (!_dnsData) {
        _dnsData = [@{} mutableCopy];
    }
    return _dnsData;
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
        [self.dnsData setValue:item forKey:key];
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
    NSArray<NSString *> *urlComponents = [key componentsSeparatedByString:@"?"];
    NSString *mainPath = urlComponents.firstObject;
    return self.dnsData[mainPath];
}
#pragma mark - private method
- (BOOL)isContainItemWithKey:(NSString *)key {
    return [self.dnsData.allKeys containsObject:key];
}
@end
