//
//  NDManualView.mm
//  NDManualObjects
//
//  Created by Nguyen Duc Hiep on 2/13/20.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import <NDManualObjects/Objects_NDManualView.h>

#import <NDManualObjects/Objects_NDManualObject.h>

@implementation NDManualView

// MARK: - UIView

- (instancetype)initWithCoder:(NSCoder*)coder {
  self = [super initWithCoder:coder];
  if (self) {
    [self manualInit];
  }
  return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  if (self) {
    [self manualInit];
  }
  return self;
}

// MARK: - NDManualObject
NDManualObject_manualInit_Default_Impl;

@end
