//
//  PrefixHeader.h
//  LejianTest
//
//  Created by Guo Grey on 2020/10/20.
//  Copyright © 2020 Grey. All rights reserved.
//

#import <Masonry.h>
#import <MJRefresh.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import <SDWebImage/UIButton+WebCache.h>
#import <AFNetworking.h>
#import "HttpRequest.h"
#import <MBProgressHUD.h>

#import "UIImage+CornerImage.h"

#ifndef PrefixHeader_h
#define PrefixHeader_h

#define SCREENWIDTH [UIScreen mainScreen].bounds.size.width
#define SCREENHEIGHT [UIScreen mainScreen].bounds.size.height
#define STATUSBARHEIGHT [UIApplication sharedApplication].windows[0].safeAreaInsets.top
#define BOTTOMHEIGHT [UIApplication sharedApplication].windows[0].safeAreaInsets.bottom

#define DEFAULTPICTURE @"defaultPicture"

#define USERTOKEN @"8ed7ddfde5ca37849b7c43591957d7fb73adc2a1"

//网络请求
#define BASEURL @"http://devmobile.zhuawawa.site"

#define GetBlindBoxSeriesLitByTabTypeURL @"/neckpets/getBlindBoxSeriesLitByTabType.json"

#endif /* PrefixHeader_h */
