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
- (void)dnsPage:(id<JDLPage>)page;
@end

@interface JDLDns : NSObject <JDLDns>
- (instancetype)initWithProvider:(id<JDLDnsProvider>)provider;
@end

NS_ASSUME_NONNULL_END
