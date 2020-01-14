//
//  UIViewController+JDLRouter.h
//  JDLRouter
//
//  Created by 郑振兴 on 2020/1/14.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (JDLRouter)
@property (nonatomic, strong) void (^callback)(id data);
@property (nonatomic, strong) NSArray<NSURLQueryItem *> *queryItems;
+ (UIViewController *)currentViewController;
@end

NS_ASSUME_NONNULL_END
