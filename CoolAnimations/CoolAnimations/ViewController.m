//
//  ViewController.m
//  CoolAnimations
//
//  Created by croath on 13-2-23.
//  Copyright (c) 2013年 croath. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

//CATransform3D CATransform3DMakePerspective(CGPoint center, float disZ)
//{
//  CATransform3D transToCenter = CATransform3DMakeTranslation(-center.x, -center.y, 0);
//  CATransform3D transBack = CATransform3DMakeTranslation(center.x, center.y, 0);
//  CATransform3D scale = CATransform3DIdentity;
//  scale.m34 = -1.0f/disZ;
//  return CATransform3DConcat(CATransform3DConcat(transToCenter, scale), transBack);
//}
//
//CATransform3D CATransform3DPerspect(CATransform3D t, CGPoint center, float disZ)
//{
//  return CATransform3DConcat(t, CATransform3DMakePerspective(center, disZ));
//}

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
  __block CATransform3D rotationAndPerspectiveTransform = CATransform3DIdentity;
  rotationAndPerspectiveTransform.m34 = 1.0 / -500;
  rotationAndPerspectiveTransform = CATransform3DRotate(rotationAndPerspectiveTransform, 45.0f * M_PI / 180.0f, 1.0f, 1.0f, 0.0f);
  
  CABasicAnimation *transformAnimation = [CABasicAnimation animationWithKeyPath: @"transform"];
  
//  layer.transform = rotationAndPerspectiveTransform;
  
  transformAnimation.toValue = [NSValue valueWithCATransform3D:rotationAndPerspectiveTransform];
  transformAnimation.duration = 0.2;
//  [transformAnimation setRepeatCount:INFINITY];
  [transformAnimation setDelegate:self];
  [transformAnimation setAutoreverses:NO];
  [transformAnimation setFillMode:kCAFillModeForwards];
  [transformAnimation setRemovedOnCompletion:NO];
  [layer addAnimation:transformAnimation forKey:@"transform"];
  
//  [UIView animateWithDuration:0.1f
//                        delay:0.0f
//                      options:UIViewAnimationOptionCurveLinear
//                   animations:^{
//                     layer.transform = rotationAndPerspectiveTransform;
//                   } completion:^(BOOL finished) {
//                     [UIView animateWithDuration:0.1f
//                                           delay:0.0f
//                                         options:UIViewAnimationOptionCurveLinear
//                                      animations:^{
//                                        rotationAndPerspectiveTransform = CATransform3DRotate(rotationAndPerspectiveTransform, 45.0f * M_PI / 180.0f, 1.0f, 1.0f, 0.0f);
//                                        layer.transform = rotationAndPerspectiveTransform;
//                                      } completion:^(BOOL finished) {
//                                      }];
//                   }];
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
