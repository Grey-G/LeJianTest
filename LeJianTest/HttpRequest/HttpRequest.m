//
//  HttpRequest.m
//  LeJianTest
//
//  Created by Guo Grey on 2020/10/20.
//  Copyright © 2020 Grey. All rights reserved.
//

#import "HttpRequest.h"

#define DELAYSECOND 60.0f

@implementation HttpRequest

static id _instance = nil;

+ (instancetype)sharedInstance
{
    return [[self alloc] init];
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [super allocWithZone:zone];
    });
    return _instance;
}

+ (void)requestWithURLString:(NSString *)URLString
                  parameters:(id)parameters
                        type:(HttpRequestType)type
                     success:(void (^)(id))success
                     failure:(void (^)(NSError *))failure {
    
    NSDictionary *ByRequest = parameters[@"ByRequest"];
    NSDictionary *ByURL = parameters[@"ByURL"];
    NSDictionary *ByHeader = parameters[@"ByHeader"];
    
    
    //判断是否需要拼接URL
    if (ByURL.count != 0) {
        
        for (NSString *key in ByURL) {
            NSString *value = [ByURL objectForKey:key];
            URLString = [URLString stringByReplacingOccurrencesOfString:key withString:value];
        }
    }
    
    NSURL* baseURL = [NSURL URLWithString:BASEURL];
    //获得请求管理者
    AFHTTPSessionManager * manager= [[AFHTTPSessionManager alloc] initWithBaseURL:baseURL];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    [manager.requestSerializer setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    manager.requestSerializer.timeoutInterval = DELAYSECOND;
    //判断是否需要拼接Body
    if (ByHeader.count != 0) {
        for (NSString *key in ByHeader) {
            NSString *value = [ByHeader objectForKey:key];
            [manager.requestSerializer setValue:value  forHTTPHeaderField:key];
        }
    }
        
    switch (type) {
        case HttpRequestTypeGet:
        {
            [manager GET:URLString parameters:ByRequest progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                if (success) {
                    success(responseObject);
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                if (failure)
                {
                    failure(error);
                }
                NSHTTPURLResponse *response  = (NSHTTPURLResponse *)task.response;
                NSLog(@"网络错误%ld",(long)response.statusCode);
            }];
        }
            break;
        case HttpRequestTypePost:
        {
            [manager POST:URLString parameters:ByRequest progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                if (success) {
                    success(responseObject);
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                if (failure) {
                    failure(error);
                }
                NSHTTPURLResponse *response  = (NSHTTPURLResponse *)task.response;
                NSLog(@"网络错误%ld",(long)response.statusCode);
            }];
        }
            break;
        case HttpRequestTypeDelete: {
            
            manager.requestSerializer.HTTPMethodsEncodingParametersInURI = [NSSet setWithObjects:@"GET", @"HEAD", nil];
            [manager DELETE:URLString parameters:ByRequest success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                if (success) {
                    success(responseObject);
                }
                
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                if (failure) {
                    failure(error);
                }
                NSHTTPURLResponse *response  = (NSHTTPURLResponse *)task.response;
                NSLog(@"网络错误%ld",(long)response.statusCode);
            }];
        }
            break;
        case HttpRequestTypePut: {
            
            [manager PUT:URLString parameters:ByRequest success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                if (success) {
                    success(responseObject);
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                if (failure) {
                    failure(error);
                }
                NSHTTPURLResponse *response  = (NSHTTPURLResponse *)task.response;                
                NSLog(@"网络错误%ld",(long)response.statusCode);
            }];
        }
            break;
    }
}

@end
