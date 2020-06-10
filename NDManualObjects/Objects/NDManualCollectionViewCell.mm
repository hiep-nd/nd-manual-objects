//
//  NDManualCollectionViewCell.mm
//  NDManualObjects
//
//  Created by Nguyen Duc Hiep on 5/29/20.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import <NDManualObjects/Objects/NDManualCollectionViewCell.h>

@implementation NDManualCollectionViewCell

// MARK: - UICollectionViewCell
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

- (void)manualInit {
}

@end
