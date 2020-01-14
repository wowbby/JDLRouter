//
//  NSString+JDLRouter.m
//  JDLRouter
//
//  Created by 郑振兴 on 2020/1/14.
//

#import "NSString+JDLRouter.h"

@implementation NSString (JDLRouter)
- (BOOL)isEmpty {
    if (self == nil || self == NULL) return YES;
    if ([self isKindOfClass:[NSNull class]]) return YES;
    if ([[self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length] == 0) return YES;

    return NO;
}
- (BOOL)isURL {
    NSURLComponents *components = [NSURLComponents componentsWithString:self];

    return components ? YES : NO;
}
@end
