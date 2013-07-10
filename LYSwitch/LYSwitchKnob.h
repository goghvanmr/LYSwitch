//
//  LYSwitchKnob.h
//  LYSwitch
//
//  Created by LI Yi on 7/9/13.
//  Copyright (c) 2013 LI Yi. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "LYSwitch.h"

@interface LYSwitchKnob : UIView

@property (nonatomic, weak) LYSwitch* parentSwitch;

- (void)setOn:(BOOL)on animated:(BOOL)animated;

- (id)initWithParentSwitch:(LYSwitch *)parentSwitch;

- (void)grow;
- (void)shrink;

@end
