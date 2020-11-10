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

#import <map>

using namespace std;

namespace {
struct cmpNSString {
  bool operator()(NSString* lhs, NSString* rhs) const {
    return [lhs compare:rhs] == NSOrderedAscending;
  }
};
}

@implementation NDManualTableViewController {
  map<NSString*, UITableViewCell*, cmpNSString> _staticCells;
  map<UITableViewCell*, NSString*> _staticIdentifiers;
  NSInteger _performBatchUpdatesCount;
}

- (void)registerIdentifier:(NSString*)identifier class:(Class)cls {
  [self.tableView registerClass:cls forCellReuseIdentifier:identifier];
}

- (void)registerClasses:(NSDictionary<NSString*, Class>*)classes {
  [classes
      enumerateKeysAndObjectsUsingBlock:^(NSString* key, Class obj, BOOL*) {
        [self registerIdentifier:key class:obj];
      }];
}

- (void)registerIdentifier:(NSString*)identifier nibName:(NSString*)nibName {
  [self.tableView registerNib:[UINib nibWithNibName:nibName bundle:nil]
       forCellReuseIdentifier:identifier];
}

- (void)registerNibNames:(NSDictionary<NSString*, NSString*>*)nibNames {
  [nibNames enumerateKeysAndObjectsUsingBlock:^(NSString* key, NSString* obj,
                                                BOOL* stop) {
    [self registerIdentifier:key nibName:obj];
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
    NDAssertionFailure(@"Misused of '%@' as '%@' datasource.", self, tableView);
  } else {
    NDCallAndReturnIfCan(self.numberOfRowsInSectionHandler, self, section);
  }

  return 0;
}

- (UITableViewCell*)tableView:(UITableView*)tableView
        cellForRowAtIndexPath:(NSIndexPath*)indexPath {
  if (tableView != self.tableView) {
    NDAssertionFailure(@"Misused of '%@' as '%@' datasource.", self, tableView);
  }

  if (self.cellReusableIdentifierForRowAtIndexPathHandler) {
    auto identifier =
        self.cellReusableIdentifierForRowAtIndexPathHandler(self, indexPath);
    if (identifier) {
      auto cell = [self dequeueReusableCellWithIdentifier:identifier
                                             forIndexPath:indexPath];
      NDCallIfCan(self.prepareCellForRowAtIndexPathHandler, self, cell,
                  indexPath);
      return cell;
    }
  }

  return [[UITableViewCell alloc] init];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView*)tableView {
  if (tableView != self.tableView) {
    NDAssertionFailure(@"Misused of '%@' as '%@' datasource.", self, tableView);
  } else {
    NDCallAndReturnIfCan(self.numberOfSectionsHandler, self);
  }

  return 1;
}

- (NSString*)tableView:(UITableView*)tableView
    titleForHeaderInSection:(NSInteger)section {
  if (tableView != self.tableView) {
    NDAssertionFailure(@"Misused of '%@' as '%@' datasource.", self, tableView);
  } else {
    NDCallAndReturnIfCan(self.titleForHeaderInSectionHandler, self, section);
  }

  return nil;
}

- (nullable NSString*)tableView:(UITableView*)tableView
        titleForFooterInSection:(NSInteger)section {
  if (tableView != self.tableView) {
    NDAssertionFailure(@"Misused of '%@' as '%@' datasource.", self, tableView);
  } else {
    NDCallAndReturnIfCan(self.titleForFooterInSectionHandler, self, section);
  }

  return nil;
}

- (BOOL)tableView:(UITableView*)tableView
    canEditRowAtIndexPath:(NSIndexPath*)indexPath {
  if (tableView != self.tableView) {
    NDAssertionFailure(@"Misused of '%@' as '%@' datasource.", self, tableView);
  } else {
    NDCallAndReturnIfCan(self.canEditRowAtIndexPathHandler, self, indexPath);
  }

  return YES;
}

- (BOOL)tableView:(UITableView*)tableView
    canMoveRowAtIndexPath:(NSIndexPath*)indexPath {
  if (tableView != self.tableView) {
    NDAssertionFailure(@"Misused of '%@' as '%@' datasource.", self, tableView);
  } else {
    NDCallAndReturnIfCan(self.canMoveRowAtIndexPathHandler, self, indexPath);
  }

  return YES;
}

- (NSArray<NSString*>*)sectionIndexTitlesForTableView:(UITableView*)tableView {
  if (tableView != self.tableView) {
    NDAssertionFailure(@"Misused of '%@' as '%@' datasource.", self, tableView);
  } else {
    NDCallAndReturnIfCan(self.sectionIndexTitlesHandler, self);
  }

  return nil;
}

- (NSInteger)tableView:(UITableView*)tableView
    sectionForSectionIndexTitle:(NSString*)title
                        atIndex:(NSInteger)index {
  if (tableView != self.tableView) {
    NDAssertionFailure(@"Misused of '%@' as '%@' datasource.", self, tableView);
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
    NDAssertionFailure(@"Misused of '%@' as '%@' datasource.", self, tableView);
  } else {
    NDCallAndReturnIfCan(self.commitEditingStyleForRowAtIndexPathHandler, self,
                         editingStyle, indexPath);
  }
}

- (void)tableView:(UITableView*)tableView
    moveRowAtIndexPath:(NSIndexPath*)sourceIndexPath
           toIndexPath:(NSIndexPath*)destinationIndexPath {
  if (tableView != self.tableView) {
    NDAssertionFailure(@"Misused of '%@' as '%@' datasource.", self, tableView);
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
    NDAssertionFailure(@"Misused of '%@' as '%@' delegate.", self, tableView);
  } else {
    NDCallAndReturnIfCan(self.willDisplayCellForRowAtIndexPathHandler, self,
                         cell, indexPath);
  }
}

- (CGFloat)tableView:(UITableView*)tableView
    heightForRowAtIndexPath:(NSIndexPath*)indexPath {
  if (tableView != self.tableView) {
    NDAssertionFailure(@"Misused of '%@' as '%@' delegate.", self, tableView);
  } else {
    NDCallAndReturnIfCan(self.heightForRowAtIndexPathHandler, self, indexPath);
  }

  return tableView.rowHeight;
}

- (void)tableView:(UITableView*)tableView
    didSelectRowAtIndexPath:(NSIndexPath*)indexPath {
  if (tableView != self.tableView) {
    NDAssertionFailure(@"Misused of '%@' as '%@' delegate.", self, tableView);
  } else {
    NDCallAndReturnIfCan(self.didSelectRowAtIndexPathHandler, self, indexPath);
  }
}

- (UITableViewCellEditingStyle)tableView:(UITableView*)tableView
           editingStyleForRowAtIndexPath:(NSIndexPath*)indexPath {
  if (tableView != self.tableView) {
    NDAssertionFailure(@"Misused of '%@' as '%@' delegate.", self, tableView);
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
    NDAssertionFailure(@"Misused of '%@' as '%@' delegate.", self, scrollView);
  } else {
    NDCallAndReturnIfCan(self.didScrollHandler, self);
  }
}

- (void)scrollViewWillEndDragging:(UIScrollView*)scrollView
                     withVelocity:(CGPoint)velocity
              targetContentOffset:(inout CGPoint*)targetContentOffset {
  if (scrollView != self.tableView) {
    NDAssertionFailure(@"Misused of '%@' as '%@' delegate.", self, scrollView);
  } else {
    NDCallAndReturnIfCan(
        self.willEndDraggingWithVelocityTargetContentOffsetHandler, self,
        velocity, targetContentOffset);
  }
}

- (void)scrollViewDidEndDragging:(UIScrollView*)scrollView
                  willDecelerate:(BOOL)decelerate {
  if (scrollView != self.tableView) {
    NDAssertionFailure(@"Misused of '%@' as '%@' delegate.", self, scrollView);
  } else {
    NDCallAndReturnIfCan(self.didEndDraggingWillDecelerateHandler, self,
                         decelerate);
  }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView*)scrollView {
  if (scrollView != self.tableView) {
    NDAssertionFailure(@"Misused of '%@' as '%@' delegate.", self, scrollView);
  } else {
    NDCallAndReturnIfCan(self.didEndDeceleratingHandler, self);
  }
}

// MARK: - Static cells
- (void)registerCell:(__kindof UITableViewCell*)cell {
  if (!cell) {
    NDAssertionFailure(@"Can not register cell: '%@' to '%@'.",
                       cell, self);
    return;
  }
  
  auto identifier = cell.reuseIdentifier;
  if (!identifier) {
    NDAssertionFailure(@"Can not register identifier: '%@' to '%@'.",
                       identifier, self);
    return;
  }

  auto oldIdentifierIt = _staticIdentifiers.find(cell);
  if (oldIdentifierIt != _staticIdentifiers.end()) {
    if ([oldIdentifierIt->second isEqual:identifier]) {
      return;
    }
    
    _staticCells.erase(oldIdentifierIt->second);
  }
  
  identifier = identifier.copy;
  _staticIdentifiers[cell] = identifier;
  _staticCells[identifier] = cell;
}

- (void)unregisterCell:(__kindof UITableViewCell *)cell {
  auto identifier = cell.reuseIdentifier;
  if (!identifier) {
    NDAssertionFailure(@"Can not unregister cell: '%@' to '%@'.",
                       cell, self);
    return;
  }
  
  auto cellIt = _staticCells.find(identifier);
  if (cellIt == _staticCells.end()) {
    return;
  }

  _staticIdentifiers.erase(cellIt->second);
  _staticCells.erase(cellIt);
}

- (void)registerCells:(NSArray<__kindof UITableViewCell*>*)cells {
  [cells enumerateObjectsUsingBlock:^(UITableViewCell* obj, NSUInteger, BOOL*) {
    [self registerCell:obj];
  }];
}

- (void)unregisterCells:(NSArray<__kindof UITableViewCell *> *)cells {
  [cells enumerateObjectsUsingBlock:^(UITableViewCell* obj, NSUInteger, BOOL*) {
    [self unregisterCell:obj];
  }];
}

- (void)performBatchUpdates:(void(NS_NOESCAPE ^ _Nullable)(void))updates {
  auto updatesWithTracking = ^{
    self->_performBatchUpdatesCount++;
    NDCallIfCan(updates);
    self->_performBatchUpdatesCount--;
  };
  if (@available(iOS 11, tvOS 11, *)) {
    [self.tableView performBatchUpdates:updatesWithTracking completion:nil];
  } else {
    [self.tableView beginUpdates];
    updatesWithTracking();
    [self.tableView endUpdates];
  }
}

- (BOOL)isPerformingBatchUpdates {
  return _performBatchUpdatesCount > 0;
}

- (void)reloadRowsAtIndexPaths:(NSArray<NSIndexPath*>*)indexPaths
              withRowAnimation:(UITableViewRowAnimation)animation {
  if (_staticCells.empty()) {
    [self.tableView reloadRowsAtIndexPaths:indexPaths
                          withRowAnimation:animation];
    return;
  }

  NSMutableArray* builder =
      [[NSMutableArray alloc] initWithCapacity:indexPaths.count];
  [indexPaths
      enumerateObjectsUsingBlock:^(NSIndexPath* obj, NSUInteger, BOOL*) {
        auto cell = [self.tableView cellForRowAtIndexPath:obj];
        if (cell) {
          auto staticIdentifierIt = self->_staticIdentifiers.find(cell);
          if (staticIdentifierIt != self->_staticIdentifiers.end() &&
              [staticIdentifierIt->second
                  isEqual:self.cellReusableIdentifierForRowAtIndexPathHandler(
                              self, obj)]) {
            return;
          }
        }

        [builder addObject:obj];
      }];
  if (builder.count != indexPaths.count && !self.isPerformingBatchUpdates) {
    // relayout cells
    [self performBatchUpdates:nil];
  }
  [self.tableView reloadRowsAtIndexPaths:builder withRowAnimation:animation];
}

- (__kindof UITableViewCell*)
    dequeueReusableCellWithIdentifier:(NSString*)identifier
                         forIndexPath:(NSIndexPath*)indexPath {
  if (identifier) {
    auto cell = _staticCells[identifier];
    if (cell) {
      return cell;
    }
  }
  return [self.tableView dequeueReusableCellWithIdentifier:identifier
                                              forIndexPath:indexPath];
}
// MARK: - NDManualObject

- (void)manualInit {
}

@end
