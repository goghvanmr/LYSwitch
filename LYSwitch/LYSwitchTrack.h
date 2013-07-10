//
//  LYSwitchTrack.h
//  LYSwitch
//
//  Created by LI Yi on 7/9/13.
//  Copyright (c) 2013 LI Yi. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "LYSwitch.h"

@interface LYSwitchTrack : UIView

@property (nonatomic, weak) LYSwitch *parentSwitch;

@property (nonatomic, strong) UIColor *colorWhenOff;
@property (nonatomic, strong) UIColor *colorWhenOn;

-(void)setOn:(BOOL)on animated:(BOOL)animated;

-(id)initWithParentSwitch:(LYSwitch *)parentSwitch;

@end
