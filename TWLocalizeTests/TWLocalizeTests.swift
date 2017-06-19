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
    
    func test_returnTranslatedText_inDutch() {
        TWLocalize.setLanguage(to: .dutch)
        
    }
    
    func test_returnSystemSetLanguage() {
        
    }
    
    func test_returnCustomSetLanguage() {
        
    }
    
    func test_canSetCustomLanguageBackToNil() {
        
    }
    
    func test_canSetCustomLanguaeToValidLanguageCode() {
        
    }
    
    func test_cannotSetCustomLanguageToInvalidLanguageCode() {
        
    }
    
    
}
