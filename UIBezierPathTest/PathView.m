//
//  PathView.m
//  UIBezierPathTest
//
//  Created by change009 on 16/3/7.
//  Copyright © 2016年 change009. All rights reserved.
//

#import "PathView.h"

CGFloat DegreesToRadians(CGFloat degrees) {return degrees * M_PI / 180;};


@implementation PathView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
   
//    [self drawRoundedRectPath];
//    [self drawARCPath];
    [self drawThirdBezierPath];
    
}

//画三次塞贝尔曲线
- (void)drawThirdBezierPath {
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    // 设置起始端点
    [path moveToPoint:CGPointMake(20, 150)];
    
    [path addCurveToPoint:CGPointMake(300, 150)
            controlPoint1:CGPointMake(160, 0)
            controlPoint2:CGPointMake(160, 250)];
    
    path.lineCapStyle = kCGLineCapRound;
    path.lineJoinStyle = kCGLineJoinRound;
    path.lineWidth = 5.0;
    
    UIColor *strokeColor = [UIColor redColor];
    [strokeColor set];
    
    [path stroke];
}


//画二次贝塞尔曲线
- (void)drawSecondBezierPath {
    
    // 创建路径对象
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    // 设置起始点，终点和控制点的位置
    CGPoint startPoint = CGPointMake(20, 200);
    CGPoint endPoint = CGPointMake(300, 200);
    CGPoint controlPoint = CGPointMake(100, 400);
    
    // 设置起始点位置
    [path moveToPoint:startPoint];
    
    // 添加二次曲线
    [path addQuadCurveToPoint:endPoint controlPoint:controlPoint];
    
    path.lineCapStyle = kCGLineCapRound;
    path.lineJoinStyle = kCGLineJoinRound;
    path.lineWidth = 5.0;
    
    UIColor *strokeColor = [UIColor redColor];
    [strokeColor set];
    
    [path stroke];
}

//画弧线
- (void)drawARCPath {

    
    CGPoint center = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2);
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:100 startAngle:0 endAngle:DegreesToRadians(100) clockwise:NO];
    
    path.lineCapStyle = kCGLineCapRound;
    path.lineJoinStyle = kCGLineJoinRound;
    path.lineWidth = 5.0;
    
    UIColor *strokeColor = [UIColor redColor];
    [strokeColor set];
    
    [path stroke];
}

//画带有圆角的矩形
- (void)drawRoundedRectPath {
    
    //创建带圆角的矩形  圆角半径：20
//    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(60, 100, 200, 200) cornerRadius:20];
    
    //创建可以指定圆角位置的矩形
    //第一个参数一样是传了个矩形
    //第二个参数是指定在哪个方向画圆角
    //第三个参数是一个CGSize类型，用来指定水平和垂直方向的半径的大小
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(60, 100, 200, 200) byRoundingCorners:UIRectCornerTopLeft cornerRadii:CGSizeMake(20, 20)];
    
    //配置属性
    [[UIColor yellowColor] setFill];    //设置填充颜色
    [[UIColor redColor] setStroke];     //设置描边颜色
    
    path.lineWidth = 3;     //设置线宽
    
    //渲染
    [path stroke];
    [path fill];
}

//椭圆
- (void)drawCiclePath {
    // 当传入参数为正方形时，绘制出的内切图形就是圆，为矩形时画出的就是椭圆
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(60, 100, 200,300)];
    
    //配置属性
    [[UIColor yellowColor] setFill];    //设置填充颜色
    [[UIColor redColor] setStroke];     //设置描边颜色
    
    path.lineWidth = 3;     //设置线宽
    
    //渲染
    [path stroke];
    [path fill];
}

//矩形
- (void)drawRectPath {
    //1. 创建UIBezierPath对象并指定路径
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(60, 100, 200, 100)];
    
    
    //2. 配置属性
    [[UIColor yellowColor] setFill];    //设置填充颜色
    [[UIColor redColor] setStroke];     //设置描边颜色
    
    path.lineWidth = 3;     //设置线宽
    
    
    /*
        设置线条拐角样式
        typedef CF_ENUM(int32_t, CGLineCap) {
        kCGLineCapButt,     //默认
        kCGLineCapRound,    //圆角
        kCGLineCapSquare    //方形
        };
     */
    path.lineCapStyle = kCGLineCapRound;
    
    
    /*
        两条线连结点的样式
        typedef CF_ENUM(int32_t, CGLineJoin) {
        kCGLineJoinMiter,   //默认：斜接
        kCGLineJoinRound,   //圆滑衔接
        kCGLineJoinBevel    //圆滑衔接
        };
     */
    path.lineJoinStyle = kCGLineJoinBevel;  
    
    
    //3. 渲染，完成绘制
    [path stroke];
    [path fill];
}


//绘制三角形
- (void)drawTriangle{
    //1. 创建UIBezierPath对象
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    //2. 配置属性
    [[UIColor yellowColor] setFill];    //设置填充颜色
    [[UIColor redColor] setStroke];     //设置描边颜色
    path.lineWidth = 3;     //设置线宽
    
    //3.添加路径
    [path moveToPoint:CGPointMake(160, 100)];
    [path addLineToPoint:CGPointMake(100, 220)];
    [path addLineToPoint:CGPointMake(220, 220)];
    
    [path closePath];   //闭合路径（也可通过-addLineToPoint:方法添加）
    
    //4.渲染，完成绘制
    [path stroke];
    [path fill];
}


@end
