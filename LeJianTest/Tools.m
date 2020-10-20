//
//  Tools.m
//  LeJianTest
//
//  Created by Guo Grey on 2020/10/20.
//  Copyright © 2020 Grey. All rights reserved.
//

#import "Tools.h"

@implementation Tools
+ (UIImage *)drawCornerInRect:(CGRect)rect cornerRadius:(CGFloat)cornerRadius {
    UIImage * image = nil;
    // 创建贝塞尔曲线对象
    UIBezierPath * bezierPath = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:cornerRadius];
    // 开始设置绘图
    UIGraphicsBeginImageContextWithOptions(rect.size, false, [UIScreen mainScreen].scale);
    CGContextAddPath(UIGraphicsGetCurrentContext(), bezierPath.CGPath);
    CGContextClip(UIGraphicsGetCurrentContext());
    // 调用绘制方法
//    [self drawInRect:rect];
    
    // 绘制图片
    CGContextDrawPath(UIGraphicsGetCurrentContext(), kCGPathFillStroke);
    // 获取绘制完成的image
    image = UIGraphicsGetImageFromCurrentImageContext();
    // 结束绘制
    UIGraphicsEndImageContext();
    
    return image;
}
@end
