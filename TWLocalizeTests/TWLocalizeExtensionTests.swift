//
//  TWLocalizeExtensionTests.swift
//  TWLocalize
//
//  Created by Tom Wolters on 18-06-17.
//  Copyright © 2017 TW App Creation. All rights reserved.
//

import XCTest
import TWLocalize

class TWLocalizeExtensionTests: XCTestCase {
    
    let systemLang = NSLocale(localeIdentifier: Locale.current.identifier).object(forKey: NSLocale.Key.languageCode) as! String
    
    override func setUp() {
        super.setUp()
        TWLocalize.setLanguage(to: nil)
    }
    
    func  test_canSetTextTranslatedTextForAUILabel() {
        let label = UILabel()
        label.setLocalized(text: TWLocalizedStrings.MyTranslatedText)
        XCTAssertEqual(TWLocalizedStrings.MyTranslatedText[TWLanguageCode(rawValue: systemLang)!], label.text)
    }
    
    func  test_canSetTextTranslatedTitleForAUIButton() {
        let button = UIButton()
        button.setLocalizedTitle(text: TWLocalizedStrings.MyTranslatedText)
        XCTAssertEqual(TWLocalizedStrings.MyTranslatedText[TWLanguageCode(rawValue: systemLang)!], button.currentTitle)
    }
    
    func test_TWLocalizedTextHashReturnsLocalized() {
        XCTAssertEqual(TWLocalizedStrings.MyTranslatedText.localized, TWLocalizedStrings.MyTranslatedText[TWLanguageCode(rawValue: systemLang)!])
    }
}
