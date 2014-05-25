//
//  BNRHypnosisView.m
//  Hypnotiser
//
//  Created by Ronan Sean Reilly on 24/04/2014.
//  Copyright (c) 2014 Ronan Sean Reilly. All rights reserved.
//

#import "BNRHypnosisView.h"

// This is a class extension with one property for circle color.
@interface BNRHypnosisView ()

@end

@implementation BNRHypnosisView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        // set background color for view
        self.backgroundColor = [UIColor clearColor];
        self.circleColor = [UIColor lightGrayColor];
    }
    return self;
}

// Custom accessor that changes the color of our circles
-(void)setCircleColor:(UIColor *)circleColor{
    _circleColor = circleColor;
    [self setNeedsDisplay];
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGRect bounds = self.bounds;
    
    // figure out the center of the bounds rectangle
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width/2.0;
    center.y = bounds.origin.y + bounds.size.height/2.0;
    
    // UI Image object
    /*UIImage *logoImage = [UIImage imageNamed:@"logo.png"];*/
    
    /*CGRect imageFrame = CGRectMake(center.x - (logoImage.size.width/2),
                                      (logoImage.size.width/2),
                                      logoImage.size.height ,
                                      logoImage.size.width);*/
    
    // circle will be largest that will fit in the view
    //float radius = (MIN(bounds.size.width, bounds.size.height)/2);
    
    float maxRadius = hypot(bounds.size.width, bounds.size.height)/2.0;
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    
    /*[path addArcWithCenter:center
                    radius:radius
                startAngle:0.0
                  endAngle:M_PI * 2.0
                 clockwise:YES];*/
    
    for (float currentRadius = maxRadius; currentRadius > 0; currentRadius -=20) {
        
        [path moveToPoint:CGPointMake(center.x + currentRadius, center.y)];
        
        [path addArcWithCenter:center radius:currentRadius
                    startAngle:0.0
                      endAngle:M_PI * 2.0
                     clockwise:YES];
    }
    
    //[[UIColor lightGrayColor] setStroke];
    
    // Use circleColor from init
    [self.circleColor setStroke];
    
    path.lineWidth = 10.0;
    
    [path stroke];
    
    UIImage *logoImage = [UIImage imageNamed:@"logo"];
    [logoImage drawInRect:CGRectMake(60, 134, 200, 300)];
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"%@ was touched", self);
    
    // Get 3 numbers between 1 - 0
    float red = (arc4random() % 100) /100.0;
    float green = (arc4random() % 100) /100.0;
    float blue = (arc4random() % 100) /100.0;
    
    UIColor *randomColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    
    self.circleColor = randomColor;
}


@end
