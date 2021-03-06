//
//  Localize.swift
//  Tickee
//
//  Created by Tom Wolters on 16-06-17.
//  Copyright © 2017 Tickee. All rights reserved.
//

import UIKit

public typealias TWLocalizedText = [TWLanguageCode:String]

/** ## Example usage:
    ```
    extension TWLocalizedStrings {
        static let LoginHeader:TWLocalizedText = [.dutch: "Verstuur tickets naar je vrienden", .english: "Send tickets to your friends" ]
    }
    ```
 */
public struct TWLocalizedStrings {}

public final class TWLocalize {
    fileprivate static var defaultLanguage:String? {
        set {
            if let newValue = newValue {
                UserDefaults.standard.set(newValue, forKey: "TWLocalizedCustomLanguageIdentifier")
            } else {
                UserDefaults.standard.removeObject(forKey: "TWLocalizedCustomLanguageIdentifier")
            }
            
            UserDefaults.standard.synchronize()
        }
        get {
            return UserDefaults.standard.string(forKey: "TWLocalizedCustomLanguageIdentifier")
        }
    }
    
    fileprivate static var languageCode:TWLanguageCode? {
        if let languageCode = defaultLanguage {
            return TWLanguageCode(rawValue: languageCode)
        } else if let currentLanguageCode = NSLocale(localeIdentifier: Locale.current.identifier).object(forKey: NSLocale.Key.languageCode) as? String {
            return TWLanguageCode(rawValue: currentLanguageCode)
        }
        return nil
    }
    
    public class func setLanguage(to languageCode:TWLanguageCode?) {
        guard let code = languageCode else { defaultLanguage = nil ; return }
        let languageCodes = Locale.availableIdentifiers.map { NSLocale(localeIdentifier: $0).object(forKey: NSLocale.Key.languageCode) as! String }
        guard let _ = languageCodes.index(of: code.rawValue) else { Logger.log(.error("\(code.rawValue) is not a valid language code")) ; return }
        defaultLanguage = code.rawValue
    }
    
    public class func text(_ localizedText:TWLocalizedText) -> String? {
        return localizedText[languageCode!] ?? localizedText[.english] ?? localizedText.first?.value
    }
}
