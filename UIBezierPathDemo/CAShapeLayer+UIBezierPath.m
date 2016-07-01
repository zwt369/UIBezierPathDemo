//
//  CAShapeLayer+UIBezierPath.m
//  UIBezierPathDemo
//
//  Created by Tony Zhang on 16/7/1.
//  Copyright © 2016年 Tony Zhang. All rights reserved.
//

#import "CAShapeLayer+UIBezierPath.h"


static char overlayKey;
//static char emptyImageKey;

@implementation CAShapeLayer (UIBezierPath)

- (void)drawRegularPolygonWithCount:(NSUInteger )count andFrame:(CGRect)frame{

    self.frame = frame;
    CGFloat radius = frame.size.width/2;
    UIBezierPath* aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = 5.0;
    aPath.lineCapStyle = kCGLineCapRound; //线条拐角
    aPath.lineJoinStyle = kCGLineCapRound; //终点处理
    for (int i = 0; i < count; i ++) {
        CGFloat x = radius*cosf(i*M_PI*2/count);
        CGFloat y = radius*sinf(i*M_PI*2/count);
        CGPoint point = CGPointMake(x + radius, radius - y);
        NSLog(@"x== %f, y == %f",point.x,point.y);
        if (i == 0) {
             [aPath moveToPoint:point];
        }else{
             [aPath addLineToPoint:point];
        }
    }
     [aPath closePath];
     [aPath stroke];//Draws line 根据坐标点连线
    self.path = aPath.CGPath;
    self.strokeColor = [UIColor redColor].CGColor;
    self.fillColor = [UIColor clearColor].CGColor;
}

-(void)drawBezierPathCircleWithFrame:(CGRect)frame{
    self.bezierPath = [UIBezierPath bezierPathWithOvalInRect:frame];
    self.fillColor = [UIColor clearColor].CGColor;
//    self.position = CGPointMake(frame.size.width *0.5,frame.size.height * 0.5);
    self.path = self.bezierPath.CGPath;
}

-(UIBezierPath *)bezierPath{

    return objc_getAssociatedObject(self,&overlayKey);
}

-(void)setBezierPath:(UIBezierPath *)bezierPath{
    objc_setAssociatedObject(self, &overlayKey,bezierPath,OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(void)setUncontinuedShapeLayer{

    // 5=线的宽度 5=每条线的间距
    [self setLineDashPattern:[NSArray arrayWithObjects:[NSNumber numberWithInt:5],[NSNumber numberWithInt:5],nil]];
}


@end
