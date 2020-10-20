//
//  HttpRequest.h
//  LeJianTest
//
//  Created by Guo Grey on 2020/10/20.
//  Copyright © 2020 Grey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 *  网络请求类型
 */
typedef NS_ENUM(NSUInteger,HttpRequestType) {
    /**
     *  get请求
     */
    HttpRequestTypeGet = 0,
    /**
     *  post请求
     */
    HttpRequestTypePost,
    /**
     *  put请求
     */
    HttpRequestTypePut,
    /**
     *  delete请求
     */
    HttpRequestTypeDelete

};
NS_ASSUME_NONNULL_BEGIN

@interface HttpRequest : NSObject

+ (instancetype)sharedInstance;


/**
 *  发送网络请求
 *
 *  @param URLString   请求的网址字符串
 *  @param parameters  请求的参数
 *  @param type        请求的类型
 */
+ (void)requestWithURLString:(NSString *)URLString
                  parameters:(id)parameters
                        type:(HttpRequestType)type
                     success:(void (^)(id responseObject))success
                     failure:(void (^)(NSError *error))failure;
@end

NS_ASSUME_NONNULL_END
