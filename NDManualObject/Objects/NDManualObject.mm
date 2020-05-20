//
//  NDManualObject.mm
//  NDManualObject
//
//  Created by Nguyen Duc Hiep on 2/13/20.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import "NDManualObject/Objects/NDManualObject2.h"

@implementation NDManualObject

// MARK:- NSObject

- (instancetype)init {
  self = [super init];
  if (self) {
    [self manualInit];
  }
  return self;
}

// MARK:- NDManualObject

- (void)manualInit {
}

@end
