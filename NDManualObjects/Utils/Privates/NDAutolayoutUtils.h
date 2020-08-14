//
//  NDAutolayoutUtils.h
//  NDManualObjects
//
//  Created by Nguyen Duc Hiep on 7/22/20.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

namespace nd {
template <typename T1, typename T2>
inline void AnchorFill(T1* _Nonnull container, T2* _Nonnull content) {
  [NSLayoutConstraint activateConstraints:@[
    [container.leadingAnchor constraintEqualToAnchor:content.leadingAnchor],
    [container.trailingAnchor constraintEqualToAnchor:content.trailingAnchor],
    [container.topAnchor constraintEqualToAnchor:content.topAnchor],
    [container.bottomAnchor constraintEqualToAnchor:content.bottomAnchor],
  ]];
}
}

NS_ASSUME_NONNULL_END
