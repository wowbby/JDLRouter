//
//  JDLDns.m
//  Pods-JDLRouter_Example
//
//  Created by 郑振兴 on 2020/1/14.
//

#import "JDLDns.h"
#import "JDLDnsProvider.h"
@interface JDLDns ()
@property (nonatomic, strong) id<JDLDnsProvider> provider;
@end

@implementation JDLDns
- (instancetype)initWithProvider:(id<JDLDnsProvider>)provider {
    if (self = [super init]) {
        self.provider = provider;
    }
    return self;
}
- (id<JDLDnsProvider>)provider {
    if (!_provider) {
        _provider = [[JDLDnsProvider alloc] init];
    }
    return _provider;
}
- (void)dnsPage:(id<JDLPage>)page {
    id<JDLDnsItem> item = [self.provider itemForKey:page.originURL];
    if (item) {
        [page setLocalURL:item.value];
    }
    [page updateStage:JDLPageStagePatch];
}
@end
