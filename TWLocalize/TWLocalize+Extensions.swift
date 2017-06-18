//
//  TWLocalize+Extensions.swift
//  TWLocalize
//
//  Created by Tom Wolters on 18-06-17.
//  Copyright © 2017 TW App Creation. All rights reserved.
//

import Foundation

public extension Dictionary where Dictionary.Key == TWLanguageCode, Dictionary.Value == String {
    var localized:String? {
        return TWLocalize.text(self)
    }
}

public extension UILabel {
    func setLocalized(text:TWLocalizedText) {
        self.text = TWLocalize.text(text)
    }
}

public extension UIButton {
    func setLocalizedTitle(text:TWLocalizedText, for controlState:UIControlState = .normal) {
        self.setTitle(TWLocalize.text(text), for: controlState)
    }
}
