//
//  NDLoadingContainer.h
//  NDManualObjects
//
//  Created by Nguyen Duc Hiep on 8/12/20.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import <NDManualObjects/Objects_NDManualTableViewController.h>

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(NDLoadingContainerProtocol)
@protocol NDLoadingContainer <NSObject>

@property(nonatomic, strong, readonly)
    UIActivityIndicatorView* activityIndicatorView;

@end

@interface NDManualTableViewController (NDLoadingContainer)

- (void)enableLoadingTableViewCell;

@end

NS_ASSUME_NONNULL_END
