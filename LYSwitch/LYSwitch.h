//
//  LYSwitch.h
//  LYSwitch
//
//  Created by LI Yi on 7/9/13.
//  Copyright (c) 2013 LI Yi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LYSwitch : UIControl <UIGestureRecognizerDelegate>

@property (nonatomic, getter = isOn) BOOL on;
@property (nonatomic, strong) UIColor *trackColorWhenOff;
@property (nonatomic, strong) UIColor *trackColorWhenOn;

- (CGRect)frameForKnob;
@end
