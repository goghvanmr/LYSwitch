//
//  LYSwitchKnob.m
//  LYSwitch
//
//  Created by LI Yi on 7/9/13.
//  Copyright (c) 2013 LI Yi. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "LYSwitchKnob.h"

#define KNOB_BORDER_WIDTH 1.5f
#define KNOB_BORDER_CG_COLOR [[UIColor colorWithWhite: 0.9f alpha:1.0f]CGColor]
#define KNOB_SHADOW_CG_COLOR [[UIColor grayColor] CGColor]
#define KNOB_SHADOW_OFFSET CGSizeMake(0, 4)
#define KNOB_SHADOW_OPACITY 0.6f
#define KNOB_SHADOW_RADIUS 1.0f

#define KNOB_ANIMATION_DURATION 0.25
#define KNOB_ANIMATION_DELAY 0

@interface LYSwitchKnob()

@property (nonatomic)BOOL isGrow;

@end

@implementation LYSwitchKnob

@synthesize parentSwitch = _parentSwitch;
@synthesize isGrow = _isGrow;

#pragma mark - Init func

- (id)initWithParentSwitch:(LYSwitch *)parentSwitch{
    _parentSwitch = parentSwitch;

    CGRect frame = [self frameStateNormal];
    
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor: [UIColor whiteColor]];
        
        CGFloat cornerRadius = frame.size.height/2.0f;
        [self.layer setCornerRadius:cornerRadius];
        [self.layer setBorderWidth:KNOB_BORDER_WIDTH];
        [self.layer setBorderColor:KNOB_BORDER_CG_COLOR];
        
        [self.layer setShadowColor:KNOB_SHADOW_CG_COLOR];
        [self.layer setShadowOffset:KNOB_SHADOW_OFFSET];
        [self.layer setShadowOpacity:KNOB_SHADOW_OPACITY];
        [self.layer setShadowRadius:KNOB_SHADOW_RADIUS];
    }
    return self;
}

#pragma mark - Switch

- (void)setOn:(BOOL)on animated:(BOOL)animated
{
    [UIView animateWithDuration:KNOB_ANIMATION_DURATION
                          delay:KNOB_ANIMATION_DELAY
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         self.frame = [self frameStateNormal];
                     }
                     completion:nil
     ];
}

#pragma mark - UI

- (CGRect)frameStateNormal
{
    CGFloat radius = self.parentSwitch.bounds.size.height;
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
    CGFloat radius = self.parentSwitch.bounds.size.height;
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
    [UIView animateWithDuration:KNOB_ANIMATION_DURATION
                          delay:KNOB_ANIMATION_DELAY
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         self.frame = [self frameStateGrown];
                     }
                     completion:nil
     ];
}

- (void)shrink{
    [UIView animateWithDuration:KNOB_ANIMATION_DURATION
                          delay:KNOB_ANIMATION_DELAY
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         self.frame = [self frameStateNormal];
                     }
                     completion:nil
     ];
}

@end
