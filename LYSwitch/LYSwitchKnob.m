//
//  LYSwitchKnob.m
//  LYSwitch
//
//  Created by LI Yi on 7/9/13.
//  Copyright (c) 2013 LI Yi. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

#import "LYSwitchKnob.h"

@interface LYSwitchKnob()

@property (nonatomic)BOOL isGrow;

@end

@implementation LYSwitchKnob

@synthesize parentSwitch = _parentSwitch;
@synthesize isGrow = _isGrow;

- (id)initWithParentSwitch:(LYSwitch *)parentSwitch{
    _parentSwitch = parentSwitch;

//    CGRect frame;
//    if (_isGrow) {
//        frame = [self frameStateGrown];
//    }
//    else {
//        frame = [self frameStateNormal];
//    }
    CGRect frame = [self frameStateNormal];
//    CGRect frame = [self frameStateGrown];
    
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor: [UIColor whiteColor]];
        
        CGFloat cornerRadius = frame.size.height/2.0f;
        [self.layer setCornerRadius:cornerRadius];
        [self.layer setBorderWidth:1.5];
        [self.layer setBorderColor:[[UIColor colorWithWhite: 0.9f alpha:1.0f]CGColor]];
        
        [self.layer setShadowColor:[[UIColor grayColor] CGColor]];
        [self.layer setShadowOffset:CGSizeMake(0, 4)];
        [self.layer setShadowOpacity:0.60f];
        [self.layer setShadowRadius:1.0];
    }
    return self;
}

- (void)setOn:(BOOL)on animated:(BOOL)animated
{
    [UIView animateWithDuration:0.25
                          delay:fabs(0.25 - 0.25)
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         self.frame = [self frameStateNormal];
//                         self.frame = [self frameStateGrown];
                     }
                     completion:nil
     ];
}

- (CGRect)frameStateNormal
{
    CGFloat radius = self.parentSwitch.bounds.size.height - 2;
    CGFloat offset = (self.parentSwitch.bounds.size.height - radius) / 2.0f;
    
    CGRect frame;
    
    if (self.parentSwitch.isOn) {
        frame = CGRectMake(offset, offset, radius, radius);
    }
    else {
        frame = CGRectMake(offset + self.parentSwitch.bounds.size.width - radius,
                           offset,
                           radius,
                           radius);
    }
    
    return frame;
}

- (CGRect)frameStateGrown
{
    CGFloat radius = self.parentSwitch.bounds.size.height - 2;
    CGFloat offset = (self.parentSwitch.bounds.size.height - radius) / 2.0f;
    
    CGRect frame;
    CGFloat width = radius * 1.2;
    CGFloat height = radius;
    
    if (self.parentSwitch.isOn) {
        frame = CGRectMake(offset, offset, width, height);
    }
    else {
        frame = CGRectMake(offset + self.parentSwitch.bounds.size.width - width,
                           offset,
                           width,
                           height);
    }
    
    return frame;
}

- (void)grow{
    [UIView animateWithDuration:0.25
                          delay:fabs(0.25 - 0.25)
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         self.frame = [self frameStateGrown];
                     }
                     completion:nil
     ];
}

- (void)shrink{
    [UIView animateWithDuration:0.25
                          delay:fabs(0.25 - 0.25)
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         self.frame = [self frameStateNormal];
                     }
                     completion:nil
     ];
}

@end
