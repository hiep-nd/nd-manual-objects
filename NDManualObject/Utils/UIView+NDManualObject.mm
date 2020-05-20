//
//  UIView+NDManualObject.mm
//  NDMVVM
//
//  Created by Nguyen Duc Hiep on 2/13/20.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import "NDManualObject/Utils/UIView+NDManualObject.h"

@implementation UIView (NDManualObject)

- (void)nd_addSubviews:(NSArray<UIView*>*)views {
  [self nd_addSubviews:views translatesAutoresizingMaskIntoConstraints:@(NO)];
}

- (void)nd_addSubviews:(NSArray<UIView*>*)views
    translatesAutoresizingMaskIntoConstraints:
        (NSNumber*)translatesAutoresizingMaskIntoConstraints {
  if (translatesAutoresizingMaskIntoConstraints != nil) {
    auto translates = translatesAutoresizingMaskIntoConstraints.boolValue;
    for (UIView* v in views) {
      v.translatesAutoresizingMaskIntoConstraints = translates;
      [self addSubview:v];
    }
  } else {
    for (UIView* v in views) {
      [self addSubview:v];
    }
  }
}

@end
