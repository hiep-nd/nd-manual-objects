//
//  NDManualViewController.mm
//  NDManualObjects
//
//  Created by Nguyen Duc Hiep on 2/13/20.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import <NDManualObjects/Objects_NDManualViewController.h>

#import <NDUtils/NDUtils.h>

@implementation NDManualViewController

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

- (void)viewDidLoad {
  [super viewDidLoad];

  if (self.viewDidLoadHandler) {
    self.viewDidLoadHandler(self);
    self.viewDidLoadHandler = nil;
  }
}

- (void)viewDidDisappear:(BOOL)animated {
  [super viewDidDisappear:animated];
  if (self.isBeingDismissed) {
    NDCallIfCan(self.wasDismissedHandler, self);
  }
}

// MARK: - NDManualObject

- (void)manualInit {
}

@end
