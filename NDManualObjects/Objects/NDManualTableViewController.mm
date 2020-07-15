//
//  NDManualTableViewController.mm
//  NDManualObjects
//
//  Created by Nguyen Duc Hiep on 2/13/20.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import <NDManualObjects/Objects/NDManualTableViewController.h>

#import <NDLog/NDLog.h>
#import <NDUtils/NDUtils.h>

@implementation NDManualTableViewController

- (void)registerClass:(Class)cls identifier:(NSString*)identifier {
  [self.tableView registerClass:cls forCellReuseIdentifier:identifier];
}

- (void)registerClasses:(NSDictionary<NSString*, Class>*)classes {
  [classes
      enumerateKeysAndObjectsUsingBlock:^(NSString* key, Class obj, BOOL*) {
        [self registerClass:obj identifier:key];
      }];
}

- (void)registerNibName:(NSString*)nibName identifier:(NSString*)identifier {
  [self.tableView registerNib:[UINib nibWithNibName:nibName bundle:nil]
       forCellReuseIdentifier:identifier];
}

- (void)registerNibNames:(NSDictionary<NSString*, NSString*>*)nibNames {
  [nibNames enumerateKeysAndObjectsUsingBlock:^(NSString* key, NSString* obj,
                                                BOOL* stop) {
    [self registerNibName:obj identifier:key];
  }];
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

  if (self.viewDidLoadHandler) {
    self.viewDidLoadHandler(self);
    self.viewDidLoadHandler = nil;
  }
}

// MARK: -UITableViewController's datasource

- (NSInteger)tableView:(UITableView*)tableView
    numberOfRowsInSection:(NSInteger)section {
  if (tableView != self.tableView) {
    NDAssertFailure(@"Misused of '%@' as '%@' datasource.", self, tableView);
  } else {
    NDCallAndReturnIfCan(self.numberOfRowsInSectionHandler, self, section);
  }

  return 0;
}

- (UITableViewCell*)tableView:(UITableView*)tableView
        cellForRowAtIndexPath:(NSIndexPath*)indexPath {
  if (tableView != self.tableView) {
    NDAssertFailure(@"Misused of '%@' as '%@' datasource.", self, tableView);
  } else {
    NDCallAndReturnIfCan(self.cellForRowAtIndexPathHandler, self, indexPath);
  }

  return [[UITableViewCell alloc] init];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView*)tableView {
  if (tableView != self.tableView) {
    NDAssertFailure(@"Misused of '%@' as '%@' datasource.", self, tableView);
  } else {
    NDCallAndReturnIfCan(self.numberOfSectionsHandler, self);
  }

  return 1;
}

- (NSString*)tableView:(UITableView*)tableView
    titleForHeaderInSection:(NSInteger)section {
  if (tableView != self.tableView) {
    NDAssertFailure(@"Misused of '%@' as '%@' datasource.", self, tableView);
  } else {
    NDCallAndReturnIfCan(self.titleForHeaderInSectionHandler, self, section);
  }

  return nil;
}

- (nullable NSString*)tableView:(UITableView*)tableView
        titleForFooterInSection:(NSInteger)section {
  if (tableView != self.tableView) {
    NDAssertFailure(@"Misused of '%@' as '%@' datasource.", self, tableView);
  } else {
    NDCallAndReturnIfCan(self.titleForFooterInSectionHandler, self, section);
  }

  return nil;
}

- (BOOL)tableView:(UITableView*)tableView
    canEditRowAtIndexPath:(NSIndexPath*)indexPath {
  if (tableView != self.tableView) {
    NDAssertFailure(@"Misused of '%@' as '%@' datasource.", self, tableView);
  } else {
    NDCallAndReturnIfCan(self.canEditRowAtIndexPathHandler, self, indexPath);
  }

  return YES;
}

- (BOOL)tableView:(UITableView*)tableView
    canMoveRowAtIndexPath:(NSIndexPath*)indexPath {
  if (tableView != self.tableView) {
    NDAssertFailure(@"Misused of '%@' as '%@' datasource.", self, tableView);
  } else {
    NDCallAndReturnIfCan(self.canMoveRowAtIndexPathHandler, self, indexPath);
  }

  return YES;
}

- (NSArray<NSString*>*)sectionIndexTitlesForTableView:(UITableView*)tableView {
  if (tableView != self.tableView) {
    NDAssertFailure(@"Misused of '%@' as '%@' datasource.", self, tableView);
  } else {
    NDCallAndReturnIfCan(self.sectionIndexTitlesHandler, self);
  }

  return nil;
}

- (NSInteger)tableView:(UITableView*)tableView
    sectionForSectionIndexTitle:(NSString*)title
                        atIndex:(NSInteger)index {
  if (tableView != self.tableView) {
    NDAssertFailure(@"Misused of '%@' as '%@' datasource.", self, tableView);
  } else {
    NDCallAndReturnIfCan(self.sectionForSectionIndexTitleAtIndexHandler, self,
                         title, index);
  }

  return NSNotFound;
}

- (void)tableView:(UITableView*)tableView
    commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
     forRowAtIndexPath:(NSIndexPath*)indexPath {
  if (tableView != self.tableView) {
    NDAssertFailure(@"Misused of '%@' as '%@' datasource.", self, tableView);
  } else {
    NDCallAndReturnIfCan(self.commitEditingStyleForRowAtIndexPathHandler, self,
                         editingStyle, indexPath);
  }
}

- (void)tableView:(UITableView*)tableView
    moveRowAtIndexPath:(NSIndexPath*)sourceIndexPath
           toIndexPath:(NSIndexPath*)destinationIndexPath {
  if (tableView != self.tableView) {
    NDAssertFailure(@"Misused of '%@' as '%@' datasource.", self, tableView);
  } else {
    NDCallAndReturnIfCan(self.moveRowAtIndexPathToIndexPathHandler, self,
                         sourceIndexPath, destinationIndexPath);
  }
}

// MARK: -UITableViewController's delegate
- (void)tableView:(UITableView*)tableView
      willDisplayCell:(UITableViewCell*)cell
    forRowAtIndexPath:(NSIndexPath*)indexPath {
  if (tableView != self.tableView) {
    NDAssertFailure(@"Misused of '%@' as '%@' delegate.", self, tableView);
  } else {
    NDCallAndReturnIfCan(self.willDisplayCellForRowAtIndexPathHandler, self,
                         cell, indexPath);
  }
}

- (CGFloat)tableView:(UITableView*)tableView
    heightForRowAtIndexPath:(NSIndexPath*)indexPath {
  if (tableView != self.tableView) {
    NDAssertFailure(@"Misused of '%@' as '%@' delegate.", self, tableView);
  } else {
    NDCallAndReturnIfCan(self.heightForRowAtIndexPathHandler, self, indexPath);
  }

  return tableView.rowHeight;
}

- (void)tableView:(UITableView*)tableView
    didSelectRowAtIndexPath:(NSIndexPath*)indexPath {
  if (tableView != self.tableView) {
    NDAssertFailure(@"Misused of '%@' as '%@' delegate.", self, tableView);
  } else {
    NDCallAndReturnIfCan(self.didSelectRowAtIndexPathHandler, self, indexPath);
  }
}

- (UITableViewCellEditingStyle)tableView:(UITableView*)tableView
           editingStyleForRowAtIndexPath:(NSIndexPath*)indexPath {
  if (tableView != self.tableView) {
    NDAssertFailure(@"Misused of '%@' as '%@' delegate.", self, tableView);
  } else {
    NDCallAndReturnIfCan(self.editingStyleForRowAtIndexPathHandler, self,
                         indexPath);
  }

  return [tableView cellForRowAtIndexPath:indexPath].isEditing
             ? UITableViewCellEditingStyleDelete
             : UITableViewCellEditingStyleNone;
}

// MARK: -UITableViewController's scroll delegate

- (void)scrollViewDidScroll:(UIScrollView*)scrollView {
  if (scrollView != self.tableView) {
    NDAssertFailure(@"Misused of '%@' as '%@' delegate.", self, scrollView);
  } else {
    NDCallAndReturnIfCan(self.didScrollHandler, self);
  }
}

- (void)scrollViewWillEndDragging:(UIScrollView*)scrollView
                     withVelocity:(CGPoint)velocity
              targetContentOffset:(inout CGPoint*)targetContentOffset {
  if (scrollView != self.tableView) {
    NDAssertFailure(@"Misused of '%@' as '%@' delegate.", self, scrollView);
  } else {
    NDCallAndReturnIfCan(
        self.willEndDraggingWithVelocityTargetContentOffsetHandler, self,
        velocity, targetContentOffset);
  }
}

- (void)scrollViewDidEndDragging:(UIScrollView*)scrollView
                  willDecelerate:(BOOL)decelerate {
  if (scrollView != self.tableView) {
    NDAssertFailure(@"Misused of '%@' as '%@' delegate.", self, scrollView);
  } else {
    NDCallAndReturnIfCan(self.didEndDraggingWillDecelerateHandler, self,
                         decelerate);
  }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView*)scrollView {
  if (scrollView != self.tableView) {
    NDAssertFailure(@"Misused of '%@' as '%@' delegate.", self, scrollView);
  } else {
    NDCallAndReturnIfCan(self.didEndDeceleratingHandler, self);
  }
}

// MARK: - NDManualObject

- (void)manualInit {
}

@end
