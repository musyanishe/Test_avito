//
//  Extension+UIView.swift
//  Test_avito
//
//  Created by Евгения Шевцова on 28.09.2022.
//

import UIKit

extension UIView {
    
    func pin(to superView: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superView.topAnchor),
            leadingAnchor.constraint(equalTo: superView.leadingAnchor),
            bottomAnchor.constraint(equalTo: superView.bottomAnchor),
            trailingAnchor.constraint(equalTo: superView.trailingAnchor)
        ])
    }
}
