//
//  NDManualView.mm
//  NDManualObject
//
//  Created by Nguyen Duc Hiep on 2/13/20.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import "NDManualObject/Objects/NDManualView.h"

@implementation NDManualView

// MARK:- UIView

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

- (void)prepareForInterfaceBuilder {
  [super prepareForInterfaceBuilder];
  [self.subviews enumerateObjectsUsingBlock:^(UIView* obj, NSUInteger, BOOL*) {
    [obj prepareForInterfaceBuilder];
  }];
}

// MARK:- NDManualObject

- (void)manualInit {
}

@end
