//
//  NSURLComponents+JDLRouter.h
//  JDLRouter
//
//  Created by 郑振兴 on 2020/1/14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSURLComponents (JDLRouter)
- (void)mergeQuery:(NSURLComponents *)components;
@end

NS_ASSUME_NONNULL_END
