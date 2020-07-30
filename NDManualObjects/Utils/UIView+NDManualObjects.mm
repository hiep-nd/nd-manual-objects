//
//  UIView+NDManualObjects.mm
//  NDManualObjects
//
//  Created by Nguyen Duc Hiep on 2/13/20.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import <NDManualObjects/Utils/UIView+NDManualObjects.h>

#import "Privates/NDAutolayoutUtils.h"

#import <NDLog/NDLog.h>

using namespace nd;

@implementation UIView (NDManualObjects)

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

- (void)nd_fillWithContentView:(UIView*)contentView {
  if (!contentView) {
    NDAssertionFailure(@"Can not fill with content view: '%@'.", contentView);
    return;
  }

  [self nd_addSubviews:@[ contentView ]];
  AnchorFill(self, contentView);
}

@end
