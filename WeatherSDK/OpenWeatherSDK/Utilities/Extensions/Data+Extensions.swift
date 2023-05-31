//
//  Data+Extensions.swift
//  OpenWeatherSDK
//
//  Created by Dksh on 28/05/23.
//

import Foundation

extension Data {
        
    func toJsonObject(withReadingOptions options: JSONSerialization.ReadingOptions = .mutableContainers) throws -> Any {
        try JSONSerialization.jsonObject(with: self, options: options)
    }
    
    func toString(encoding: String.Encoding = .utf8) -> String? {
        String(data: self, encoding: encoding)
    }
    
}
