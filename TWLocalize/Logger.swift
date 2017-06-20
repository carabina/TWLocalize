//
//  Logger.swift
//  SwiftStarterProject
//
//  Created by Tom Wolters on 31-05-17.
//  Copyright © 2017 9to5. All rights reserved.
//

import Foundation

enum LogOption {
    case error(String?)
    case warning(String?)
    case print(String?)
    case todo(String?)
}

class Logger {
    class func log(_ option:LogOption, file:String = #file, function:StaticString = #function, line:UInt = #line) {
        var fileName = file.components(separatedBy: "/").last!
        fileName = fileName.replacingOccurrences(of: ".swift", with: "")
        var message:String = ""
        
        message += symbol(for: option)
        message += "\(dateString(from: Date())): "
        message += "\(fileName).\(function) logged "
        
        switch option {
        case .error: message += "a error "
        case .warning: message += "a warning "
        case .print: message += "a print "
        case .todo: message += "a TODO "
        }
        
        message += "at line \(line)"
        
        switch option {
        case .error(let error): if let error = error { message += ":: ** \(error) **" }
        case .warning(let warning): if let warning = warning { message += ":: \(warning)" }
        case .print(let print): if let print = print { message += ":: \(print)" }
        case .todo(let todo): if let todo = todo { message += ":: \(todo)" }
        }
        
        message += " \(symbol(for: option))"
        
        print(message)
    }
    
    class func dateString(from date:Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "H:mm:ss"
        return dateFormatter.string(from: date)
    }
    
    class func symbol(for option:LogOption) -> String {
        switch option {
        case .error: return "❌ "
        case .warning: return "⚠️ "
        case .print: return "➡ "
        case .todo: return "🔜 "
        }
    }
}
