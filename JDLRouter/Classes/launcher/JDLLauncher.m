//
//  JDLLauncher.m
//  Pods-JDLRouter_Example
//
//  Created by 郑振兴 on 2020/1/14.
//

#import "JDLLauncher.h"

@implementation JDLLauncher
@synthesize indentifire;
- (NSString *)indentifire {
    return @"default";
}
- (NSMutableDictionary<NSString *, NSMutableArray<NSString *> *> *)paths {

    return [@{
        @"http" : @[ @"jd.com" ],
    } mutableCopy];
}
- (NSInteger)matchPage:(id<JDLPage>)page {
    if (![self.paths.allKeys containsObject:page.scheme]) {
        return 0;
    }
    NSArray<NSString *> *paths = [self.paths valueForKey:page.scheme];
    __block NSInteger macthPathLength = 0;
    [paths enumerateObjectsUsingBlock:^(NSString *_Nonnull obj, NSUInteger idx, BOOL *_Nonnull stop) {
        if ([page.path containsString:obj]) {
            if (macthPathLength == 0 || obj.length < page.path.length) {
                macthPathLength = obj.length;
            }
        }
    }];
    if (macthPathLength == 0) {
        return 1;
    }
    return macthPathLength;
}
- (void)launchPage:(id<JDLPage>)page {
}

@end
