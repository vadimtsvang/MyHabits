//
//  File.swift
//  MyHabits
//
//  Created by Vadim on 10.04.2022.
//

import UIKit

public extension UIView {

    func toAutoLayout() {
        translatesAutoresizingMaskIntoConstraints = false
    }

    func addSubviews(_ subviews: UIView...) {
        subviews.forEach { addSubview($0) }
    }
}
