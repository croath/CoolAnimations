//
//  ViewController.m
//  CoolAnimations
//
//  Created by croath on 13-2-23.
//  Copyright (c) 2013年 croath. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

static const float time_1 = 0.5f;

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated{
  [super viewDidAppear:animated];
  CALayer *layer = _button.layer;
  CALayer *layer2 = _button2.layer;
  CATransform3D rotationAndPerspectiveTransform = CATransform3DIdentity;
  rotationAndPerspectiveTransform.m34 = 1.0 / -100;
  rotationAndPerspectiveTransform = CATransform3DRotate(rotationAndPerspectiveTransform, 4*45.0f * M_PI / 180.0f, 2.0f, 1.0f, 0.0f);
  
  CABasicAnimation *transformAnimation = [CABasicAnimation animation];
  [transformAnimation setValue:@"anim1" forKey:@"id"];
  
  transformAnimation.toValue = [NSValue valueWithCATransform3D:rotationAndPerspectiveTransform];
  transformAnimation.duration = time_1/2.0;
  [transformAnimation setDelegate:self];
  [transformAnimation setAutoreverses:NO];
  [transformAnimation setFillMode:kCAFillModeForwards];
  [transformAnimation setRemovedOnCompletion:NO];
  [layer addAnimation:transformAnimation forKey:@"transform"];
  [layer2 addAnimation:transformAnimation forKey:@"transform"];
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
  NSString *v = [anim valueForKey:@"id"];
  CALayer *layer = _button.layer;
  CALayer *layer2 = _button2.layer;
  
  if ([v isEqualToString:@"anim1"]) {
    CATransform3D rotationAndPerspectiveTransform = CATransform3DIdentity;
    rotationAndPerspectiveTransform.m34 = 1.0 / -100;
    rotationAndPerspectiveTransform = CATransform3DRotate(rotationAndPerspectiveTransform, 2*45.0f * M_PI / 180.0f, 2.0f, 1.0f, 0.0f);
    
    CABasicAnimation *transformAnimation = [CABasicAnimation animation];
    [transformAnimation setValue:@"anim2" forKey:@"id"];
    transformAnimation.fromValue = ((CABasicAnimation*)anim).toValue;
    transformAnimation.toValue = [NSValue valueWithCATransform3D:rotationAndPerspectiveTransform];
    transformAnimation.duration = time_1/4;
    [transformAnimation setDelegate:self];
    [transformAnimation setAutoreverses:NO];
    [transformAnimation setFillMode:kCAFillModeForwards];
    [transformAnimation setRemovedOnCompletion:NO];
    [layer addAnimation:transformAnimation forKey:@"transform"];
    [layer2 addAnimation:transformAnimation forKey:@"transform"];
  } else if ([v isEqualToString:@"anim2"]){
    CATransform3D rotationAndPerspectiveTransform = CATransform3DIdentity;
    rotationAndPerspectiveTransform.m34 = 1.0 / -100;
    rotationAndPerspectiveTransform = CATransform3DRotate(rotationAndPerspectiveTransform, 0*45.0f * M_PI / 180.0f, 2.0f, 1.0f, 0.0f);
    
    CABasicAnimation *transformAnimation = [CABasicAnimation animation];
    [transformAnimation setValue:@"anim3" forKey:@"id"];
    transformAnimation.fromValue = ((CABasicAnimation*)anim).toValue;
    transformAnimation.toValue = [NSValue valueWithCATransform3D:rotationAndPerspectiveTransform];
    transformAnimation.duration = time_1/4;
    [transformAnimation setDelegate:self];
    [transformAnimation setAutoreverses:NO];
    [transformAnimation setFillMode:kCAFillModeForwards];
    [transformAnimation setRemovedOnCompletion:NO];
    [layer addAnimation:transformAnimation forKey:@"transform"];
    [layer2 addAnimation:transformAnimation forKey:@"transform"];
  }
  
}

@end
