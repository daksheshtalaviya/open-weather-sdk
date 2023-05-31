//
//  String+Extensions.swift
//  EmployeeManagement
//
//  Created by Dksh on 27/05/23.
//

import Foundation

extension String {
    
    var encode: String? {
        return addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
    }
    
    var url: URL? {
        if let url = URL(string: self) {
            return url
        }
        return URL(string: self.encode ?? "")
    }
}
