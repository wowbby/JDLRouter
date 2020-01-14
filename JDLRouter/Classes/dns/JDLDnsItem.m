//
//  JDLDnsItem.m
//  JDLRouter
//
//  Created by 郑振兴 on 2020/1/14.
//

#import "JDLDnsItem.h"
#import "NSString+JDLRouter.h"
@implementation JDLDnsItem
- (instancetype)initWithKey:(NSString *)key value:(NSString *)value {
    if (self = [super init]) {
        if (key.isEmpty) {
            return nil;
        }
        if (!key.isURL) {
            return nil;
        }
        if (value.isEmpty) {
            return nil;
        }
        if (!value.isURL) {
            return nil;
        }
        _key = key;
        _value = value;
    }
    return self;
}
@end
