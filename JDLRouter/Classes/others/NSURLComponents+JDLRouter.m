//
//  NSURLComponents+JDLRouter.m
//  JDLRouter
//
//  Created by 郑振兴 on 2020/1/14.
//

#import "NSURLComponents+JDLRouter.h"

@implementation NSURLComponents (JDLRouter)
- (void)mergeQuery:(NSURLComponents *)components {
    NSArray<NSURLQueryItem *> *items = components.queryItems;
    NSArray<NSURLQueryItem *> *originItems = [self.queryItems mutableCopy];
    self.queryItems = [originItems arrayByAddingObjectsFromArray:items];
}
@end
