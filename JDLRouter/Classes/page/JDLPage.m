//
//  JDLPage.m
//  JDLRouter
//
//  Created by 郑振兴 on 2020/1/14.
//

#import "JDLPage.h"
#import "NSString+JDLRouter.h"
#import "NSURLComponents+JDLRouter.h"
@interface JDLPage ()
@property (nonatomic, copy) NSString *originURL;
@property (nonatomic, strong) NSURLComponents *urlComponents;
@property (nonatomic, assign) JDLPageStage stage;
@end

@implementation JDLPage
- (instancetype)initWithOriginURL:(NSString *)originURL {
    if (self = [super init]) {

        if (originURL.isEmpty) {
            return nil;
        }
        if (!originURL.isURL) {
            return nil;
        }
        self.originURL = originURL;
        self.stage = JDLPageStageDns;
    }
    return self;
}
- (void)setOriginURL:(NSString *)originURL {
    _originURL = originURL;
    _urlComponents = [NSURLComponents componentsWithString:_originURL];
}
- (void)setLocalURL:(NSString *)localURL {
    _localURL = localURL;
    NSURLComponents *components = [NSURLComponents componentsWithString:_localURL];
    [_urlComponents mergeQuery:components];
}
- (void)updateStage:(JDLPageStage)stage {
    _stage = stage;
}
- (NSURLQueryItem *)queryItemForKey:(NSString *)key {

    if (key.isEmpty) {
        return nil;
    }
    if (!self.urlComponents.queryItems.count) {
        return nil;
    }
    NSPredicate *pre = [NSPredicate predicateWithFormat:@"self.name == %@", key];
    return [self.urlComponents.queryItems filteredArrayUsingPredicate:pre].firstObject;
}
- (void)moveQueryItemForKey:(NSString *)key {

    if (key.isEmpty) {
        return;
    }
    if (!self.urlComponents.queryItems.count) {
        return;
    }
    NSURLQueryItem *item = [self queryItemForKey:key];
    if (item) {
        NSMutableArray<NSURLQueryItem *> *items = [self.urlComponents.queryItems mutableCopy];
        [items removeObject:item];
        self.urlComponents.queryItems = items;
    }
}
- (void)addQueryItemForKey:(NSString *)key value:(NSString *)value {
    if (key.isEmpty || value.isEmpty) {
        return;
    }
    if (!self.urlComponents) {
        return;
    }
    NSURLQueryItem *item = [[NSURLQueryItem alloc] initWithName:key value:value];
    if (item) {
        NSMutableArray<NSURLQueryItem *> *items = [self.urlComponents.queryItems mutableCopy];
        [items addObject:item];
        self.urlComponents.queryItems = items;
    }
}
- (void)updateQueryItemForKey:(NSString *)key value:(NSString *)value {
    if (key.isEmpty || value.isEmpty) {
        return;
    }
    if (!self.urlComponents) {
        return;
    }
    NSURLQueryItem *item = [[NSURLQueryItem alloc] initWithName:key value:value];
    if (item) {
        NSMutableArray<NSURLQueryItem *> *items = [self.urlComponents.queryItems mutableCopy];
        NSURLQueryItem *originItem = [self queryItemForKey:key];
        [items removeObject:originItem];
        [items addObject:item];
        self.urlComponents.queryItems = items;
    }
}
@end