//
//  DKLog.swift
//  EmployeeManagement
//
//  Created by Dksh on 27/05/23.
//

import Foundation

/// Logs messages with customizable options, such as log type, mode, and additional information.
@objcMembers public class DKLog : NSObject {
    
    /// - Note: Use release mode when the app is on production mode.
    static var mode: Mode = .release

    enum Mode: String {
        case debug
        case release
    }
    
    @objc enum LogType: Int {
        case normal
        case info
        case warning
        case error
        case success

        var name: String {
            switch self {
            case .normal : return ""
            case .info   : return "INFO ℹ️"
            case .warning: return "WARNING ⚠️"
            case .error  : return "ERROR ❌"
            case .success: return "SUCCESS ✅"
            }
        }
    }
    
    /// Logs the provided items with additional contextual information.
    /// - Parameters:
    ///   - items: A variadic parameter representing the items to be logged.
    ///   - separator: A string used to separate the logged items. (Default value: " ")
    ///   - terminator: A string appended after the logged items. (Default value: "\n")
    ///   - fileName: The name of the source file where the log statement is called. (Default value: `#fileID`)
    ///   - line: The line number in the source file where the log statement is called. (Default value: `#line`)
    ///   - function: The name of the function where the log statement is called. (Default value: `#function`)
    ///   - type: The type of the log message. Default value is `.normal`.
    ///   - mode: The mode in which the log function is called. Default value is the value of `mode`.
    ///
    /// - Important: The Mode enumeration represents the modes debug and release.
    /// The LogType enumeration represents different types of log messages.
    ///
    /// - Note: This static function logs messages with customizable options, including log type, mode, and additional information. It provides flexibility to include various details like file name, line number, and function name in the log message.
    static func log(_ items: Any..., separator: String = " ", terminator: String = "\n", fileName: String = #fileID, line: Int = #line, function: String = #function, type: LogType = .normal, mode: Mode = mode) {
        
        let logs = [
            "\(self.className)",
            "\(fileName.components(separatedBy: "/").last ?? fileName)",
            "\(line)",
            "\(function)",
            "\(type.name)",
            "⟹\(items.first ?? "")"
        ].filter({!$0.isEmpty})
        let message = logs.joined(separator: ":")
        
        switch mode {
        case .release:
            print(message, separator: separator, terminator: terminator)
            break
            
        default:
            debugPrint(message, separator: separator, terminator: terminator)
        }
    }
    
}

extension NSObject {
    //MARK: -

    static var className: String {
        return String(describing: self)
    }
    
}
