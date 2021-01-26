//
//  NDManualObject.h
//  NDManualObjects
//
//  Created by Nguyen Duc Hiep on 2/13/20.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import <NDManualObjects/Abstracts_NDManualObject.h>

NS_ASSUME_NONNULL_BEGIN

@interface NDManualObject : NSObject <NDManualObject>
@end

#define NDManualObject_manualInit_Default_Impl -(void)manualInit{};

NS_ASSUME_NONNULL_END
