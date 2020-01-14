//
//  JDLRouter.h
//  Pods-JDLRouter_Example
//
//  Created by 郑振兴 on 2020/1/14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
typedef void (^failureBlock)(NSError *error);
typedef void (^successBlock)(void);
typedef void (^dataBlock)(id data);
@protocol JDLRouter <NSObject>
- (void)gotoPage:(NSString *)url failure:(failureBlock)failure sucess:(successBlock)success callback:(dataBlock)callback;
@end

@interface JDLRouter : NSObject <JDLRouter>

@end

NS_ASSUME_NONNULL_END
