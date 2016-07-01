//
//  CAShapeLayer+UIBezierPath.h
//  UIBezierPathDemo
//
//  Created by Tony Zhang on 16/7/1.
//  Copyright © 2016年 Tony Zhang. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>
#import <objc/runtime.h>

@interface CAShapeLayer (UIBezierPath)

/**
 *  绘制一个正多图形
 *
 *  @param count 多边形数量
 *  @param frame 位置
 */
- (void)drawRegularPolygonWithCount:(NSUInteger )count andFrame:(CGRect)frame;

/**
 *  绘制圆环
 */
/** 显示比例 */
//@property(nonatomic,assign)CGFloat radio;

/** UIBezierPath曲线 */
@property(nonatomic,strong)UIBezierPath *bezierPath;


-(void)drawBezierPathCircleWithFrame:(CGRect)frame;

/**
 *  设置间断的轴线
 */
-(void)setUncontinuedShapeLayer;

@end
