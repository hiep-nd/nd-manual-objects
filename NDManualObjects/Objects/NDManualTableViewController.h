//
//  NDManualTableViewController.h
//  NDManualObjects
//
//  Created by Nguyen Duc Hiep on 2/13/20.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <NDManualObjects/Abstracts/NDManualObject.h>

NS_ASSUME_NONNULL_BEGIN

@interface NDManualTableViewController : UITableViewController <NDManualObject>

// MARK: -UIViewController's handlers
@property(nonatomic, copy) void (^_Nullable viewDidLoadHandler)
    (__kindof NDManualTableViewController*);

// MARK: -UITableViewController's datasource handlers
@property(nonatomic, copy) NSInteger (^_Nullable numberOfRowsInSectionHandler)
    (__kindof NDManualTableViewController*, NSInteger);
@property(nonatomic, copy)
    __kindof UITableViewCell* (^_Nullable cellForRowAtIndexPathHandler)
        (__kindof NDManualTableViewController*, NSIndexPath*);
@property(nonatomic, copy) NSInteger (^_Nullable numberOfSectionsHandler)
    (__kindof NDManualTableViewController*);
@property(nonatomic, copy)
    NSString* _Nullable (^_Nullable titleForHeaderInSectionHandler)
        (__kindof NDManualTableViewController*, NSInteger);
@property(nonatomic, copy)
    NSString* _Nullable (^_Nullable titleForFooterInSectionHandler)
        (__kindof NDManualTableViewController*, NSInteger);
@property(nonatomic, copy) BOOL (^_Nullable canEditRowAtIndexPathHandler)
    (__kindof NDManualTableViewController*, NSIndexPath*);
@property(nonatomic, copy) BOOL (^_Nullable canMoveRowAtIndexPathHandler)
    (__kindof NDManualTableViewController*, NSIndexPath*);
@property(nonatomic, copy)
    NSArray<NSString*>* _Nullable (^_Nullable sectionIndexTitlesHandler)
        (__kindof NDManualTableViewController*);
@property(nonatomic, copy)
    NSInteger (^_Nullable sectionForSectionIndexTitleAtIndexHandler)
        (__kindof NDManualTableViewController*, NSString*, NSInteger);
@property(nonatomic, copy)
    void (^_Nullable commitEditingStyleForRowAtIndexPathHandler)
        (__kindof NDManualTableViewController*,
         UITableViewCellEditingStyle,
         NSIndexPath*);
@property(nonatomic, copy)
    void (^_Nullable moveRowAtIndexPathToIndexPathHandler)
        (__kindof NDManualTableViewController*, NSIndexPath*, NSIndexPath*);

// MARK: -UITableViewController's delegate handlers
@property(nonatomic, copy)
    void (^_Nullable willDisplayCellForRowAtIndexPathHandler)
        (__kindof NDManualTableViewController*,
         __kindof UITableViewCell*,
         NSIndexPath*);

@property(nonatomic, copy) CGFloat (^_Nullable heightForRowAtIndexPathHandler)
    (__kindof NDManualTableViewController*, NSIndexPath*);

@property(nonatomic, copy) void (^_Nullable didSelectRowAtIndexPathHandler)
    (__kindof NDManualTableViewController*, NSIndexPath*);

@property(nonatomic, copy) UITableViewCellEditingStyle (
    ^_Nullable editingStyleForRowAtIndexPathHandler)
    (__kindof NDManualTableViewController*, NSIndexPath*);

// MARK: -UITableViewController's scroll handlers
@property(nonatomic, copy) void (^_Nullable didScrollHandler)
    (__kindof NDManualTableViewController*);

@property(nonatomic, copy)
    void (^_Nullable willEndDraggingWithVelocityTargetContentOffsetHandler)
        (__kindof NDManualTableViewController*, CGPoint, CGPoint*);

@property(nonatomic, copy) void (^_Nullable didEndDraggingWillDecelerateHandler)
    (__kindof NDManualTableViewController*, BOOL);

@property(nonatomic, copy) void (^_Nullable didEndDeceleratingHandler)
    (__kindof NDManualTableViewController*);

- (void)registerClass:(Class)cls identifier:(NSString*)identifier;
- (void)registerClasses:(NSDictionary<NSString*, Class>*)classes;
- (void)registerNibName:(NSString*)nibName identifier:(NSString*)identifier;
- (void)registerNibNames:(NSDictionary<NSString*, NSString*>*)nibNames;

@end

NS_ASSUME_NONNULL_END
