//
//  UIView+NDManualObjects.swift
//  NDManualObjects
//
//  Created by Nguyen Duc Hiep on 2/13/20.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

import UIKit

extension UIView {
  public func nd_add(
    subviews: [UIView],
    translatesAutoresizingMaskIntoConstraints translates: Bool?
  ) {
    __nd_addSubviews(
      subviews,
      translatesAutoresizingMaskIntoConstraints:
        translates == nil ? nil : NSNumber(value: translates!))
  }
}
