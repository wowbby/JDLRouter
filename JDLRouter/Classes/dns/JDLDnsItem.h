//
//  JDLDnsItem.h
//  JDLRouter
//
//  Created by 郑振兴 on 2020/1/14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@protocol JDLDnsItem <NSObject>

@property (nonatomic, copy) NSString *key;
@property (nonatomic, copy) NSString *value;

@end
@interface JDLDnsItem : NSObject <JDLDnsItem>
@property (nonatomic, copy) NSString *key;
@property (nonatomic, copy) NSString *value;
- (instancetype)initWithKey:(NSString *)key value:(NSString *)value;
@end

NS_ASSUME_NONNULL_END
