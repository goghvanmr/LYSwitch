//
//  LYSwitch.m
//  LYSwitch
//
//  Created by LI Yi on 7/9/13.
//  Copyright (c) 2013 LI Yi. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

#import "LYSwitch.h"
#import "LYSwitchTrack.h"
#import "LYSwitchKnob.h"

#define DEFAULT_TRACK_COLOR_WHEN_OFF [UIColor colorWithRed:83/255.0 green: 214/255.0 blue: 105/255.0 alpha: 1]
#define DEFAULT_TRACK_COLOR_WHEN_ON [UIColor colorWithWhite: 0.9f alpha:1.0f]

@class LYSwitchTrack;
@class LYSwitchKnob;

@interface LYSwitch ()

@property (nonatomic, strong) LYSwitchTrack *track;
@property (nonatomic, strong) LYSwitchKnob *knob;

@property (nonatomic, strong) UITapGestureRecognizer *tapGesture;
@property (nonatomic, strong) UIPanGestureRecognizer *panGesture;

@end

@implementation LYSwitch

@synthesize track = _track;
@synthesize knob = _knob;
@synthesize on = _on;
@synthesize tapGesture = _tapGesture;
@synthesize panGesture = _panGesture;
@synthesize trackColorWhenOff = _trackColorWhenOff;
@synthesize trackColorWhenOn = _trackColorWhenOn;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self
                                                             action:@selector(didTap:)];
        _tapGesture.delegate = self;
        [self addGestureRecognizer:_tapGesture];
        
        _panGesture = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(didPan:)];
        _panGesture.delegate = self;
        [self addGestureRecognizer:_panGesture];
        
        _trackColorWhenOn = DEFAULT_TRACK_COLOR_WHEN_ON;
        _trackColorWhenOff = DEFAULT_TRACK_COLOR_WHEN_OFF;
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];

    if (!_track) {
        _track = [[LYSwitchTrack alloc]initWithParentSwitch:self];
        [self addSubview:self.track];
    }
    
    if (!_knob){
        _knob = [[LYSwitchKnob alloc]initWithParentSwitch:self];
        [self addSubview:self.knob];
    }
}

- (void)didTap:(UITapGestureRecognizer *)gesture
{
    if (gesture.state == UIGestureRecognizerStateEnded) {
        [self toggleSwitch];
    }
}

- (void)didPan:(UIPanGestureRecognizer *)gesture
{
    CGPoint velocity = [gesture velocityInView:self];
    
    if (!((velocity.x < 0 && !self.isOn) ||
        (velocity.x > 0 && self.isOn))) {
        return;
    }
    
    if (gesture.state == UIGestureRecognizerStateBegan) {
        
        [self.knob grow];
    }
    else if (gesture.state == UIGestureRecognizerStateChanged) {
        CGPoint currentTouchLocation = [gesture locationInView: self];
        
        CGFloat width = self.frame.size.width;
        if ((!self.isOn && currentTouchLocation.x <= width - width*0.7)
            || (self.isOn && currentTouchLocation.x >= width*0.7)) {
            [self toggleSwitch];
        }

    }
    else if (gesture.state == UIGestureRecognizerStateEnded){
        CGPoint currentTouchLocation = [gesture locationInView: self];
        
        CGFloat width = self.frame.size.width;
        if (!(!self.isOn && currentTouchLocation.x <= width - width*0.7)
            || (self.isOn && currentTouchLocation.x >= width*0.7)) {
            NSLog(@"XXXX");
            [self.knob shrink];
        }
    }
}

- (void)toggleSwitch
{
    BOOL isOnAfterToggle = !self.isOn;
    [self setOn:isOnAfterToggle animated: YES];
}

- (void)setOn:(BOOL)on animated:(BOOL)animated
{
    self.on = on;
    
    [self.track setOn:on animated:YES];
    [self.knob setOn:on animated:YES];
}

@end
