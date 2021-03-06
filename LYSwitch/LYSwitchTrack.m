//
//  LYSwitchTrack.m
//  LYSwitch
//
//  Created by LI Yi on 7/9/13.
//  Copyright (c) 2013 LI Yi. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

#import "LYSwitchTrack.h"
#import "LYSwitch.h"

#define TRACK_BORDER_WIDTH 1.0
#define TRACK_TOGGLE_ANIMATION_DURATION 0.20

@interface LYSwitchTrack()

@end

@implementation LYSwitchTrack

@synthesize colorWhenOff = _colorWhenOff;
@synthesize colorWhenOn = _colorWhenOn;
@synthesize parentSwitch = _parentSwitch;

#pragma mark - Init func

-(id)initWithParentSwitch:(LYSwitch *)parentSwitch
{
    _parentSwitch = parentSwitch;
    
    CGRect frame = parentSwitch.bounds;
    self = [super initWithFrame:frame];
    if (self) {
        _colorWhenOn = parentSwitch.trackColorWhenOn;
        _colorWhenOff = parentSwitch.trackColorWhenOff;
        
        CGFloat cornerRadius = frame.size.height/2.0f;
        [self.layer setCornerRadius:cornerRadius];
        [self.layer setBorderWidth:TRACK_BORDER_WIDTH];
        
        [self setOn:_parentSwitch.isOn];
    }
    return self;
}

#pragma mark - Switch

-(void)setOn:(BOOL)on animated:(BOOL)animated
{
    if (animated) {
        [UIView animateWithDuration:TRACK_TOGGLE_ANIMATION_DURATION
                              delay:0
                            options:UIViewAnimationOptionCurveEaseOut
                         animations:^{
                             [self setOn:on];
                         }
                         completion:^(BOOL finished){
                             // Nothing
                         }
         ];
    }
    else {
        [self setOn:on];
    }
}


-(void)setOn:(BOOL)on
{
    if (on) {
        self.backgroundColor = self.colorWhenOn;
        self.layer.borderColor = [self.colorWhenOn CGColor];
    }
    else {
        [self setBackgroundColor:self.colorWhenOff];
        self.layer.borderColor = [self.colorWhenOff CGColor];
    }
}

@end