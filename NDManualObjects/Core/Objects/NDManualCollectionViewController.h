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

@property(nonatomic, copy) void (^_Nullable loadHandler)
    (NDManualCollectionViewController*);
- (void)registerClass:(Class)cls identifier:(NSString*)identifier;
- (void)registerNibName:(NSString*)nibName identifier:(NSString*)identifier;

@end

NS_ASSUME_NONNULL_END
