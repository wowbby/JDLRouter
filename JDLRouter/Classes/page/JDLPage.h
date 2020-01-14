//
//  JDLPage.h
//  JDLRouter
//
//  Created by 郑振兴 on 2020/1/14.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, JDLPageStage) {
    JDLPageStageDns = 0,
    JDLPageStagePatch,
    JDLPageStageLaunch
};

NS_ASSUME_NONNULL_BEGIN

@protocol JDLPage <NSObject>
@property (nonatomic, copy, readonly) NSString *originURL;
@property (nonatomic, copy) NSString *localURL;
@property (nonatomic, assign, readonly) JDLPageStage stage;
- (void)updateStage:(JDLPageStage)stage;
- (NSURLQueryItem *)queryItemForKey:(NSString *)key;
- (void)moveQueryItemForKey:(NSString *)key;
- (void)addQueryItemForKey:(NSString *)key value:(NSString *)value;
- (void)updateQueryItemForKey:(NSString *)key value:(NSString *)value;

@end

@interface JDLPage : NSObject <JDLPage>
@property (nonatomic, copy, readonly) NSString *originURL;
@property (nonatomic, copy) NSString *localURL;
@property (nonatomic, assign, readonly) JDLPageStage stage;
- (instancetype)initWithOriginURL:(NSString *)originURL;

@end

NS_ASSUME_NONNULL_END
