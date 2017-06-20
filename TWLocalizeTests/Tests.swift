//
//  TWLocalizeTests.swift
//  TWLocalizeTests
//
//  Created by Tom Wolters on 17-06-17.
//  Copyright © 2017 TW App Creation. All rights reserved.
//

import XCTest
import TWLocalize

class TWLocalizeTests: XCTestCase {
    
    let systemLang = NSLocale(localeIdentifier: Locale.current.identifier).object(forKey: NSLocale.Key.languageCode) as! String
    
    override func setUp() {
        TWLocalize.setLanguage(to: nil)
        super.setUp()
    }
    
    func test_returnTranslatedText_inDutch() {
        TWLocalize.setLanguage(to: .dutch)
        XCTAssertEqual(TWLocalize.text(TWLocalizedStrings.MyTranslatedText)!, TWLocalizedStrings.MyTranslatedText[.dutch]!)
    }
    
    func test_returnSystemSetLanguage() {
        XCTAssertEqual(TWLocalize.text(TWLocalizedStrings.MyTranslatedText)!, TWLocalizedStrings.MyTranslatedText[TWLanguageCode(rawValue: systemLang)!])
    }
    
    func test_canSetCustomLanguageBackToNil() {
        TWLocalize.setLanguage(to: .dutch)
        XCTAssertEqual(TWLocalize.text(TWLocalizedStrings.MyTranslatedText)!, TWLocalizedStrings.MyTranslatedText[.dutch]!)
        TWLocalize.setLanguage(to: nil)
        XCTAssertEqual(TWLocalize.text(TWLocalizedStrings.MyTranslatedText)!, TWLocalizedStrings.MyTranslatedText[TWLanguageCode(rawValue: systemLang)!])
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
