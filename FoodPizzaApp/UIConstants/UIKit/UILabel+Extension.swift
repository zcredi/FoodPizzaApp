//
//  UILabel+Extension.swift
//  FoodPizzaApp
//
//  Created by Владислав on 12.01.2024.
//

import UIKit

extension UILabel {
    convenience init(text: String = "") {
        self.init()
        self.numberOfLines = 0
        self.text = text
        self.font = .sfUiDisplayRegular13()
        self.textColor = .mainDarkColor
        self.adjustsFontSizeToFitWidth = true
        self.minimumScaleFactor = 0.5
    }
    
    convenience init(text: String? = "", font: UIFont?, textColor: UIColor, numberOfLines: Int = 0) {
        self.init()
        self.numberOfLines = numberOfLines
        self.text = text
        self.font = font
        self.textColor = textColor
    }
}
