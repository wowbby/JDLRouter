//
//  JDLRouterException.h
//  Pods
//
//  Created by 郑振兴 on 2020/1/14.
//

#ifndef JDLRouterException_h
#define JDLRouterException_h

NSString *kJDLRouterErrorDomain = @"com.jd.JDLRouter";

typedef NS_ENUM(NSInteger, JDLRouterErrorCode) {

    JDLRouterErrorCodeNone = 1000,
    JDLRouterErrorCodeOriginURLNull,
    JDLRouterErrorCodeOriginURLInvalid,
    JDLRouterErrorCodePageInitFailure
};

#endif /* JDLRouterException_h */