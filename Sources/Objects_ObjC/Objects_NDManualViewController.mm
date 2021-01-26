//
//  Objects_NDManualViewController.mm
//  NDManualObjects
//
//  Created by Nguyen Duc Hiep on 2/13/20.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import <NDManualObjects/Objects_NDManualViewController.h>

#import <NDManualObjects/Objects_NDManualViewControllerHelper.h>

#import <NDUtils/NDUtils.h>

@implementation NDManualViewController {
  NDManualViewController_helper_Default_Decl;
}

// MARK: - UIViewController
- (instancetype)initWithNibName:(NSString*)nibNameOrNil
                         bundle:(NSBundle*)nibBundleOrNil {
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    [self manualInit];
  }
  return self;
}

- (instancetype)initWithCoder:(NSCoder*)coder {
  self = [super initWithCoder:coder];
  if (self) {
    [self manualInit];
  }
  return self;
}

NDManualViewController_Default_Impl;

@end
