//
//  JDLRouterException.h
//  Pods
//
//  Created by 郑振兴 on 2020/1/14.
//

#ifndef JDLRouterException_h
#define JDLRouterException_h

#define kJDLRouterErrorDomain @"com.jd.JDLRouter"

typedef NS_ENUM(NSInteger, JDLRouterErrorCode) {

    JDLRouterErrorCodeNone = 1000,            //无错误
    JDLRouterErrorCodeOriginURLNull,          //无originURL
    JDLRouterErrorCodeOriginURLInvalid,       //originURL不是有效的URL
    JDLRouterErrorCodePageInitFailure,        //JDLPage初始化失败
    JDLRouterErrorCodePageLauncherNotFound,   //没有相对应的Launcher来启动page
    JDLRouterErrorCodePageNativeClassNotFound //跳转原生页面时，无法从URL中解析出原生的类
};

#endif /* JDLRouterException_h */
