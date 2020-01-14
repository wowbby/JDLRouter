//
//  JDLDns.m
//  Pods-JDLRouter_Example
//
//  Created by 郑振兴 on 2020/1/14.
//

#import "JDLDns.h"

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
- (void)dnsPage:(id<JDLPage>)page {
    id<JDLDnsItem> item = [self.provider itemForKey:page.originURL];
    if (item) {
        [page setLocalURL:item.value];
    }
    [page updateStage:JDLPageStagePatch];
}
@end
