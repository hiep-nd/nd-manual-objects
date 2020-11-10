//
//  NDManualObjects.h
//  NDManualObjects
//
//  Created by Nguyen Duc Hiep on 6/8/20.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import <Foundation/Foundation.h>

//! Project version number for NDManualObjects.
FOUNDATION_EXPORT double NDManualObjectsVersionNumber;

//! Project version string for NDManualObjects.
FOUNDATION_EXPORT const unsigned char NDManualObjectsVersionString[];

#if !defined(__has_include)
#error \
    "NDManualObjects.h won't import anything if your compiler doesn't support \
          __has_include. Please import the headers individually."
#else

#if __has_include(<NDManualObjects/Abstracts.h>)
#import <NDManualObjects/Abstracts.h>
#endif

#if __has_include(<NDManualObjects/Objects.h>)
#import <NDManualObjects/Objects.h>
#endif

#endif
