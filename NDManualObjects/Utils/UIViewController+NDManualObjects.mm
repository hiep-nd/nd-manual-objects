//
//  UIViewController+NDManualObjects.mm
//  NDManualObjects
//
//  Created by Nguyen Duc Hiep on 6/11/20.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import <NDManualObjects/Utils/UIViewController+NDManualObjects.h>

@implementation UIViewController (NDManualObjects)

- (void)nd_addChildViewControllers:
    (NSArray<UIViewController*>*)childViewControllers {
  [self nd_addChildViewControllers:childViewControllers
      translatesAutoresizingMaskIntoConstraints:@(NO)];
}

- (void)nd_addChildViewControllers:(NSArray<UIView*>*)childViewControllers
    translatesAutoresizingMaskIntoConstraints:
        (NSNumber*)translatesAutoresizingMaskIntoConstraints {
  if (translatesAutoresizingMaskIntoConstraints != nil) {
    auto translates = translatesAutoresizingMaskIntoConstraints.boolValue;
    for (UIViewController* vc in childViewControllers) {
      [self addChildViewController:vc];
      vc.view.translatesAutoresizingMaskIntoConstraints = translates;
      [self.view addSubview:vc.view];
      [vc didMoveToParentViewController:self];
    }
  } else {
    for (UIViewController* vc in childViewControllers) {
      [self addChildViewController:vc];
      [self.view addSubview:vc.view];
      [vc didMoveToParentViewController:self];
    }
  }
}

@end
