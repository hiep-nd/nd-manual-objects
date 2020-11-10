//
//  NDManualCollectionViewController.mm
//  NDManualObjects
//
//  Created by Nguyen Duc Hiep on 5/29/20.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import <NDManualObjects/Objects_NDManualCollectionViewController.h>

#import <NDLog/NDLog.h>
#import <NDUtils/NDUtils.h>

@interface NDManualCollectionViewController ()

@end

@implementation NDManualCollectionViewController

- (void)registerClass:(Class)cls identifier:(NSString*)identifier {
  [self.collectionView registerClass:cls forCellWithReuseIdentifier:identifier];
}

- (void)registerClasses:(NSDictionary<NSString*, Class>*)classes {
  [classes
      enumerateKeysAndObjectsUsingBlock:^(NSString* key, Class obj, BOOL*) {
        [self registerClass:obj identifier:key];
      }];
}

- (void)registerNibName:(NSString*)nibName identifier:(NSString*)identifier {
  [self.collectionView registerNib:[UINib nibWithNibName:nibName bundle:nil]
        forCellWithReuseIdentifier:identifier];
}

- (void)registerNibNames:(NSDictionary<NSString*, NSString*>*)nibNames {
  [nibNames enumerateKeysAndObjectsUsingBlock:^(NSString* key, NSString* obj,
                                                BOOL* stop) {
    [self registerNibName:obj identifier:key];
  }];
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

  if (self.viewDidLoadHandler) {
    self.viewDidLoadHandler(self);
    self.viewDidLoadHandler = nil;
  }
}

// MARK: - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView*)collectionView
     numberOfItemsInSection:(NSInteger)section {
  if (collectionView != self.collectionView) {
    NDAssertionFailure(@"Misused of '%@' as '%@' datasource.", self,
                       collectionView);
  } else {
    NDCallAndReturnIfCan(self.numberOfItemsInSectionHandler, self, section);
  }

  return 0;
}

- (UICollectionViewCell*)collectionView:(UICollectionView*)collectionView
                 cellForItemAtIndexPath:(NSIndexPath*)indexPath {
  if (collectionView != self.collectionView) {
    NDAssertionFailure(@"Misused of '%@' as '%@' datasource.", self,
                       collectionView);
  } else {
    NDCallAndReturnIfCan(self.cellForItemAtIndexPathHandler, self, indexPath);
  }

  return [[UICollectionViewCell alloc] init];
}

- (NSInteger)numberOfSectionsInCollectionView:
    (UICollectionView*)collectionView {
  if (collectionView != self.collectionView) {
    NDAssertionFailure(@"Misused of '%@' as '%@' datasource.", self,
                       collectionView);
  } else {
    NDCallAndReturnIfCan(self.numberOfSectionsHandler, self);
  }

  return 1;
}

// MARK: -UICollectionViewDelegate
- (void)collectionView:(UICollectionView*)collectionView
    didSelectItemAtIndexPath:(NSIndexPath*)indexPath {
  if (collectionView != self.collectionView) {
    NDAssertionFailure(@"Misused of '%@' as '%@' delegate.", self,
                       collectionView);
  } else {
    NDCallAndReturnIfCan(self.didSelectItemAtIndexPathHandler, self, indexPath);
  }
}

// MARK: -UICollectionViewController's scroll delegate
- (void)scrollViewDidScroll:(UIScrollView*)scrollView {
  if (scrollView != self.collectionView) {
    NDAssertionFailure(@"Misused of '%@' as '%@' delegate.", self, scrollView);
  } else {
    NDCallAndReturnIfCan(self.didScrollHandler, self);
  }
}

// MARK: - NDManualObject

- (void)manualInit {
}

@end
