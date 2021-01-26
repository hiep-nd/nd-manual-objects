//
//  Objects_NDManualViewControllerHelper.h
//  NDManualObjects
//
//  Created by Nguyen Duc Hiep on 2/13/20.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import <NDManualObjects/Objects_NDManualViewController.h>

#import <NDManualObjects/Objects_NDManualObject.h>

#ifdef __cplusplus
namespace nd {
namespace objc {
class ManualViewControllerHelper {
 public:
  inline void viewDidLoad(
      __kindof UIViewController<NDManualViewController>* _Nullable owner) {
    if (owner.viewDidLoadHandler) {
      owner.viewDidLoadHandler(owner);
      owner.viewDidLoadHandler = nil;
    }
  }

  inline void viewDidDisappear(
      __kindof UIViewController<NDManualViewController>* _Nullable owner,
      BOOL animated) {
    if (owner.isBeingDismissed) {
      NDCallIfCan(owner.wasDismissedHandler, owner);
    }
  }
};
}
}

#define NDManualViewController_helper_Default_Decl \
  nd::objc::ManualViewControllerHelper _helper;

#define NDManualViewController_viewDidLoad_Default_Impl \
  -(void)viewDidLoad {                                  \
    [super viewDidLoad];                                \
    _helper.viewDidLoad(self);                          \
  }

#define NDManualViewController_viewDidDisappear_Default_Impl \
  -(void)viewDidDisappear : (BOOL)animated {                 \
    [super viewDidDisappear:animated];                       \
    _helper.viewDidDisappear(self, animated);                \
  }

#define NDManualViewController_Props_Default_Impl \
  @synthesize viewDidLoadHandler;                 \
  @synthesize wasDismissedHandler;

#define NDManualViewController_Default_Impl        \
  NDManualObject_manualInit_Default_Impl;          \
  NDManualViewController_Props_Default_Impl;       \
  NDManualViewController_viewDidLoad_Default_Impl; \
  NDManualViewController_viewDidDisappear_Default_Impl;

#endif

NS_ASSUME_NONNULL_BEGIN

// clang-format off
@interface NDManualViewControllerHelper
    : NDPossession < __kindof UIViewController <NDManualViewController>* >

-(void)viewDidLoad;
// clang-format on
- (void)viewDidDisappear:(BOOL)animated;

@end

NS_ASSUME_NONNULL_END
