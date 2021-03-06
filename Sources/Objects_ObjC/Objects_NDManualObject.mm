//
//  NDManualObject.mm
//  NDManualObjects
//
//  Created by Nguyen Duc Hiep on 2/13/20.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import <NDManualObjects/Objects_NDManualObject.h>

@implementation NDManualObject

// MARK: - NSObject

- (instancetype)init {
  self = [super init];
  if (self) {
    [self manualInit];
  }
  return self;
}

// MARK: - NDManualObject
NDManualObject_manualInit_Default_Impl;

@end
