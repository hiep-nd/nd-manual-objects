//
//  NDManualNavigationController.mm
//  NDManualObjects
//
//  Created by Nguyen Duc Hiep on 26/03/2020.
//  Copyright © 2021 Nguyen Duc Hiep. All rights reserved.
//

#import <NDManualObjects/Objects_NDManualNavigationController.h>

#import <NDManualObjects/Objects_NDManualViewControllerHelper.h>

@implementation NDManualNavigationController {
  NDManualViewController_helper_Default_Decl;
}

- (instancetype)initWithCoder:(NSCoder*)coder {
  self = [super initWithCoder:coder];
  if (self) {
    [self manualInit];
  }
  return self;
}

- (instancetype)initWithNibName:(NSString*)nibNameOrNil
                         bundle:(NSBundle*)nibBundleOrNil {
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    [self manualInit];
  }
  return self;
}

- (instancetype)initWithRootViewController:
    (UIViewController*)rootViewController {
  self = [super initWithRootViewController:rootViewController];
  if (self) {
    [self manualInit];
  }
  return self;
}

- (instancetype)initWithNavigationBarClass:(Class)navigationBarClass
                              toolbarClass:(Class)toolbarClass {
  self = [super initWithNavigationBarClass:navigationBarClass
                              toolbarClass:toolbarClass];
  if (self) {
    [self manualInit];
  }
  return self;
}

NDManualViewController_Default_Impl;

@end
