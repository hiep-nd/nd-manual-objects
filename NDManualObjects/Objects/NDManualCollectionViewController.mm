//
//  NDManualCollectionViewController.mm
//  NDManualObjects
//
//  Created by Nguyen Duc Hiep on 5/29/20.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import <NDManualObjects/Objects/NDManualCollectionViewController.h>

@interface NDManualCollectionViewController ()

@end

@implementation NDManualCollectionViewController

- (void)registerClass:(Class)cls identifier:(NSString*)identifier {
  [self.collectionView registerClass:cls forCellWithReuseIdentifier:identifier];
}

- (void)registerNibName:(NSString*)nibName identifier:(NSString*)identifier {
  [self.collectionView registerNib:[UINib nibWithNibName:nibName bundle:nil]
        forCellWithReuseIdentifier:identifier];
}

// MARK: - UICollectionViewController

- (instancetype)initWithCollectionViewLayout:(UICollectionViewLayout*)layout {
  self = [super initWithCollectionViewLayout:layout];
  if (self) {
    [self manualInit];
  }
  return self;
}

- (instancetype)initWithNibName:(NSString*)nibNameOrNil
                         bundle:(NSBundle*)nibBundleOrNil {
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    [self manualInit];
  }
  return self;
}

- (instancetype)initWithCoder:(NSCoder*)coder {
  self = [super initWithCoder:coder];
  if (self) {
    [self manualInit];
  }
  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];

  if (self.loadHandler) {
    self.loadHandler(self);
    self.loadHandler = nil;
  }
}

// MARK: - NDManualObject

- (void)manualInit {
}

@end
