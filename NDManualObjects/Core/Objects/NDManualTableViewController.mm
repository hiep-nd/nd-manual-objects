//
//  NDManualTableViewController.mm
//  NDManualObjects
//
//  Created by Nguyen Duc Hiep on 2/13/20.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import <NDManualObjects/Objects/NDManualTableViewController.h>

@implementation NDManualTableViewController

- (void)registerClass:(Class)cls identifier:(NSString*)identifier {
  [self.tableView registerClass:cls forCellReuseIdentifier:identifier];
}

- (void)registerNibName:(NSString*)nibName identifier:(NSString*)identifier {
  [self.tableView registerNib:[UINib nibWithNibName:nibName bundle:nil]
       forCellReuseIdentifier:identifier];
}

// MARK: - UITableViewController

- (instancetype)initWithStyle:(UITableViewStyle)style {
  self = [super initWithStyle:style];
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
