//
//  NDLoading.h
//  NDManualObjects
//
//  Created by Nguyen Duc Hiep on 8/12/20.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import <NDManualObjects/Objects/NDManualTableViewController.h>

NS_ASSUME_NONNULL_BEGIN

@protocol NDLoading <NSObject>

@property(nonatomic, strong, readonly)
    UIActivityIndicatorView* activityIndicatorView;

@end

@interface NDManualTableViewController (NDLoading)

- (void)enableLoadingTableViewCell;

@end

NS_ASSUME_NONNULL_END
