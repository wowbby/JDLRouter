//
//  JDLRouterInjection.h
//  JDLRouter
//
//  Created by 郑振兴 on 2020/1/14.
//

#import "JDLRouter.h"
#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN

@interface JDLRouterInjection : NSObject
@property (nonatomic, strong) id<JDLRouter> router;
+ (instancetype)instance;
@end

NS_ASSUME_NONNULL_END
