//
//  NDManualTabBarController.h
//  NDManualObjects
//
//  Created by Nguyen Duc Hiep on 2/13/20.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <NDManualObjects/Abstracts/NDManualObject.h>

NS_ASSUME_NONNULL_BEGIN

@interface NDManualTabBarController : UITabBarController <NDManualObject>

// MARK: -UITabBarController's tab bar delegate handlers
// called when a new view is selected by the user (but not programatically)
@property(nonatomic, copy) void (^_Nullable didSelectItemHandler)
    (__kindof NDManualTabBarController*, UITabBarItem*);

@end

NS_ASSUME_NONNULL_END
