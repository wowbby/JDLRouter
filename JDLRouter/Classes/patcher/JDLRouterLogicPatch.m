//
//  JDLRouterLogicPatch.m
//  JDLRouter
//
//  Created by 郑振兴 on 2020/1/14.
//

#import "JDLRouterLogicPatch.h"

static NSString *ktestPatchTrigerKey = @"ktestPatchTriger";
static NSString *ktestPatchTrigerValue = @"1";
@implementation JDLRouterLogicPatch
- (NSString *)indentifire {
    return @"test";
}
- (NSInteger)priority {

    return 0;
}
- (BOOL)isNeedPatch:(id<JDLPage>)page {
    NSURLQueryItem *item = [page queryItemForKey:ktestPatchTrigerKey];
    if ([item.value isEqualToString:ktestPatchTrigerValue]) {

        return YES;
    }

    return NO;
    ;
}
- (void)patchPage:(id<JDLPage>)page {

    [page updateQueryItemForKey:ktestPatchTrigerKey value:@"0"];
}
@end
