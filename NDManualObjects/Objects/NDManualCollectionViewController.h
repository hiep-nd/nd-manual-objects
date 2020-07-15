//
//  NDManualCollectionViewController.h
//  NDManualObjects
//
//  Created by Nguyen Duc Hiep on 5/29/20.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <NDManualObjects/Abstracts/NDManualObject.h>

NS_ASSUME_NONNULL_BEGIN

@interface NDManualCollectionViewController
    : UICollectionViewController <NDManualObject>

// MARK: -UIViewController's handlers
@property(nonatomic, copy) void (^_Nullable viewDidLoadHandler)
    (__kindof NDManualCollectionViewController*);

// MARK: -UICollectionViewController's datasource handlers
@property(nonatomic, copy) NSInteger (^_Nullable numberOfItemsInSectionHandler)
    (__kindof NDManualCollectionViewController*, NSInteger);
@property(nonatomic, copy)
    __kindof UICollectionViewCell* (^_Nullable cellForItemAtIndexPathHandler)
        (__kindof NDManualCollectionViewController*, NSIndexPath*);
@property(nonatomic, copy) NSInteger (^_Nullable numberOfSectionsHandler)
    (__kindof NDManualCollectionViewController*);

// MARK: -UITableViewController's delegate handlers
@property(nonatomic, copy) void (^_Nullable didSelectItemAtIndexPathHandler)
    (__kindof NDManualCollectionViewController*, NSIndexPath*);

// MARK: -UITableViewController's scroll handlers
@property(nonatomic, copy) void (^_Nullable didScrollHandler)
    (__kindof NDManualCollectionViewController*);

- (void)registerClass:(Class)cls identifier:(NSString*)identifier;
- (void)registerClasses:(NSDictionary<NSString*, Class>*)classes;
- (void)registerNibName:(NSString*)nibName identifier:(NSString*)identifier;
- (void)registerNibNames:(NSDictionary<NSString*, NSString*>*)nibNames;

@end

NS_ASSUME_NONNULL_END
