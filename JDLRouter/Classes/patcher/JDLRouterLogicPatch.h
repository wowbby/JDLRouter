//
//  JDLRouterLogicPatch.h
//  JDLRouter
//
//  Created by 郑振兴 on 2020/1/14.
//

#import "JDLPage.h"
#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN

@protocol JDLRouterLogicPatch <NSObject>
@property (nonatomic, strong) NSString *indentifire;
@property (nonatomic, assign) NSInteger priority;
- (BOOL)isNeedPatch:(id<JDLPage>)page;
- (void)patchPage:(id<JDLPage>)page;
@end

@interface JDLRouterLogicPatch : NSObject <JDLRouterLogicPatch>
@property (nonatomic, strong) NSString *indentifire;
@property (nonatomic, assign) NSInteger priority;
@end

NS_ASSUME_NONNULL_END
