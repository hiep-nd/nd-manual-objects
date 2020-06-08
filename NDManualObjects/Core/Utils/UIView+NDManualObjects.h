//
//  UIView+NDManualObjects.h
//  NDManualObjects
//
//  Created by Nguyen Duc Hiep on 2/13/20.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (NDManualObjects)

/// Add subviews. All subview will be set
/// translatesAutoresizingMaskIntoConstraints to NO.
/// @param subviews The views.
- (void)nd_addSubviews:(NSArray<UIView*>*)subviews
    NS_SWIFT_NAME(nd_add(subviews:));
- (void)nd_addSubviews:(NSArray<UIView*>*)subviews
    translatesAutoresizingMaskIntoConstraints:
        (NSNumber* _Nullable)translatesAutoresizingMaskIntoConstraints
    NS_REFINED_FOR_SWIFT;

@end

NS_ASSUME_NONNULL_END
