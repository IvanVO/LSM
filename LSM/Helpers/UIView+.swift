//
//  UIView+.swift
//  LSM
//
//  Created by Ivan Villanueva on 06/04/21.
//  Copyright © 2021 Ivan Villanueva. All rights reserved.
//

import UIKit

public extension UIView {
    func pinTo(_ view:UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: 50).isActive = true
        leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80).isActive = true
    }
}
