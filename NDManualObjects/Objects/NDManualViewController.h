//
//  NDManualViewController.h
//  NDManualObjects
//
//  Created by Nguyen Duc Hiep on 2/13/20.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <NDManualObjects/Abstracts/NDManualObject.h>

NS_ASSUME_NONNULL_BEGIN

@interface NDManualViewController : UIViewController <NDManualObject>

@property(nonatomic, copy) void (^_Nullable viewDidLoadHandler)
    (__kindof NDManualViewController*);

@end

NS_ASSUME_NONNULL_END
