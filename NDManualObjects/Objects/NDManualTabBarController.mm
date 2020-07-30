//
//  NDManualTabBarController.mm
//  NDManualObjects
//
//  Created by Nguyen Duc Hiep on 2/13/20.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import <NDManualObjects/Objects/NDManualTabBarController.h>

#import <NDLog/NDLog.h>
#import <NDUtils/NDUtils.h>

@implementation NDManualTabBarController

// MARK: - UITabBarController
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

// MARK: -UITabBarController's tab bar delegate
- (void)tabBar:(UITabBar*)tabBar didSelectItem:(UITabBarItem*)item {
  if (tabBar != self.tabBar) {
    NDAssertionFailure(@"Misused of '%@' as '%@' delegate.", self, tabBar);
  } else {
    NDCallAndReturnIfCan(self.didSelectItemHandler, self, item);
  }
}

// MARK: - NDManualObject
- (void)manualInit {
}

@end
