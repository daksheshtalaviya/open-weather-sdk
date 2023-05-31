//
//  URLRequest+Extensions.swift
//  OpenWeatherSDK
//
//  Created by Dksh on 28/05/23.
//

import Foundation

public extension URLRequest {
    /// Returns the `httpMethod` as `HTTPMethod` type.
    var method: HTTPMethod? {
        get { return httpMethod.flatMap(HTTPMethod.init) }
        set { httpMethod = newValue?.rawValue }
    }

    func validate() throws {
        if method == .get, let bodyData = httpBody {
            throw APIError.urlRequestValidationFailed(reason: .bodyDataInGETRequest(bodyData))
        }
    }
}
