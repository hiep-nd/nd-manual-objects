//
//  Objects_NDManualViewControllerHelper.m
//  NDManualObjects
//
//  Created by Nguyen Duc Hiep on 2/13/20.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import <NDManualObjects/Objects_NDManualViewControllerHelper.h>

@implementation NDManualViewControllerHelper {
  NDManualViewController_helper_Default_Decl;
}

- (void)viewDidLoad {
  _helper.viewDidLoad(self.owner);
}

- (void)viewDidDisappear:(BOOL)animated {
  _helper.viewDidDisappear(self.owner, animated);
}

@end
