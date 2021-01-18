//
//  NDLoadingContainer.mm
//  NDManualObjects
//
//  Created by Nguyen Duc Hiep on 8/12/20.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import <NDManualObjects/Objects_NDLoadingContainer.h>

#import <NDUtils/NDUtils.h>

@implementation NDManualTableViewController (NDLoading)

- (void)enableLoadingTableViewCell {
  auto oldHandler = self.willDisplayCellForRowAtIndexPathHandler;
  self.willDisplayCellForRowAtIndexPathHandler =
      ^(NDManualTableViewController* self, UITableViewCell* cell,
        NSIndexPath* indexPath) {
        NDCallIfCan(oldHandler, self, cell, indexPath);
        if ([cell conformsToProtocol:@protocol(NDLoadingContainer)]) {
          [static_cast<id<NDLoadingContainer>>(cell)
                  .activityIndicatorView startAnimating];
        }
      };
}

@end
