//
//  infoViewUtilities.swift
//  LSM
//
//  Created by Ivan Villanueva on 06/04/21.
//  Copyright © 2021 Ivan Villanueva. All rights reserved.
//

import UIKit

public extension UILabel {
    func pinTitleTo(_ view:UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: view.topAnchor, constant: 80).isActive = true
        leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        //bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}
