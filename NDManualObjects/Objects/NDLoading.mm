//
//  NDLoading.m
//  NDManualObjects
//
//  Created by Nguyen Duc Hiep on 8/12/20.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import <NDManualObjects/Objects/NDLoading.h>

#import <NDUtils/NDUtils.h>

@implementation NDManualTableViewController (NDLoading)

- (void)enableLoadingTableViewCell {
  auto oldHandler = self.willDisplayCellForRowAtIndexPathHandler;
  self.willDisplayCellForRowAtIndexPathHandler = ^(
      NDManualTableViewController* self, UITableViewCell* cell,
      NSIndexPath* indexPath) {
    NDCallIfCan(oldHandler, self, cell, indexPath);
    if ([cell conformsToProtocol:@protocol(NDLoading)]) {
      [static_cast<id<NDLoading>>(cell).activityIndicatorView startAnimating];
    }
  };
}

@end
