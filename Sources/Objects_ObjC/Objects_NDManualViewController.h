//
//  Objects_NDManualViewController.h
//  NDManualObjects
//
//  Created by Nguyen Duc Hiep on 2/13/20.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <NDManualObjects/Abstracts_NDManualObject.h>

#import <NDUtils/NDUtils.h>

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(NDManualViewControllerProtocol)
@protocol NDManualViewController <NDManualObject>
@property(nonatomic, copy) void (^_Nullable viewDidLoadHandler)
    (__kindof id<NDManualViewController>);
@property(nonatomic, copy) void (^_Nullable wasDismissedHandler)
    (__kindof id<NDManualViewController>);
@end

@interface NDManualViewController : UIViewController <NDManualViewController>
@end

NS_ASSUME_NONNULL_END
