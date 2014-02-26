//
//  SpirographView.m
//  MoravianSpirograph
//
//  Created by Rachel Johnson on 2/22/14.
//  Copyright (c) 2014 Michael Toth. All rights reserved.
//

#import "SpirographView.h"


@implementation SpirographView

@synthesize k;
@synthesize l;
@synthesize stepSize;
@synthesize numberOfSteps;



- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setBackgroundColor:[UIColor yellowColor]];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGFloat x,y;
    UIBezierPath *bz = [[UIBezierPath alloc] init];
    CGFloat t=0;
    x=120 * ((1-k)*cos(t) + l*k *cos((1-k)/k)* t);
    y=120 * ((1-k)*sin(t) - l*k *sin((1-k)/k)* t);
    CGPoint p=CGPointMake(x + 140, y + 140);
    [bz moveToPoint:p];
    CGFloat i; 
    for (t=0; t<numberOfSteps*stepSize; t=t+stepSize) {
        x=120 * ((1-k)*cos(t) + l*k *cos((1-k)/k)* t);
        y=120 * ((1-k)*sin(t) - l*k *sin((1-k)/k)* t);
        p=CGPointMake(x+140, y+140);
        [bz addLineToPoint:p];
    }
    [bz stroke];
}

@end
