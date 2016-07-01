//
//  ViewController.m
//  UIBezierPathDemo
//
//  Created by Tony Zhang on 16/7/1.
//  Copyright © 2016年 Tony Zhang. All rights reserved.
//

#import "ViewController.h"
#import "CAShapeLayer+UIBezierPath.h"


@interface ViewController ()
/** sharp */
@property(nonatomic,strong) CAShapeLayer *shapeLay;

/** value */
@property(nonatomic,assign)CGFloat value;

/** nstimer */
@property(nonatomic,strong)NSTimer *timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self drawRect:CGRectMake(0, 100, 220, 220)];
    
    CAShapeLayer *layer = [[CAShapeLayer alloc]init];
    [layer drawRegularPolygonWithCount:10 andFrame:CGRectMake(0, 0, 200, 200)];
//    layer.backgroundColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:layer];
    
    UIView *view = [[UIView alloc]init];
    view.frame = CGRectMake(10, 240, 200, 200);
    view.transform = CGAffineTransformMakeRotation(-M_PI/2);
    [self.view addSubview:view];
    
    CAShapeLayer *circleLay = [[CAShapeLayer alloc]init];
    [circleLay drawBezierPathCircleWithFrame:CGRectMake(0, 0, 200, 200)];
    circleLay.strokeColor = [UIColor orangeColor].CGColor;
    circleLay.lineWidth = 10.0f;
    circleLay.strokeEnd = 1;
//    [circleLay setUncontinuedShapeLayer];
    [view.layer addSublayer:circleLay];
    
    self.shapeLay = [[CAShapeLayer alloc]init];
    [self.shapeLay drawBezierPathCircleWithFrame:CGRectMake(0, 0, 200, 200)];
    self.shapeLay.strokeColor = [UIColor blueColor].CGColor;
    self.shapeLay.lineWidth = 10.0f;
    self.shapeLay.strokeEnd = 0;
    self.shapeLay.strokeStart = 0;
    [self.shapeLay setUncontinuedShapeLayer];
    [view.layer addSublayer:self.shapeLay];
    
    self.value = 0;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(changeValue) userInfo:nil repeats:YES];

}


-(void)changeValue{

    self.value += 0.1;
    self.shapeLay.strokeEnd = self.value;
    if (self.value == 1.0) {
        [self.timer invalidate];
    }
}

@end
