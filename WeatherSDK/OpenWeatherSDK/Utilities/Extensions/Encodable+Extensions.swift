//
//  Encodable+Extensions.swift
//  OpenWeatherSDK
//
//  Created by Dksh on 28/05/23.
//

import Foundation

extension Encodable {

    func toJSONData(outputFormatting: JSONEncoder.OutputFormatting = .prettyPrinted) throws -> Data? {
        let encoder = JSONEncoder()
        encoder.outputFormatting = outputFormatting
        return try encoder.encode(self)
    }

    func toJSON(outputFormatting: JSONEncoder.OutputFormatting = .prettyPrinted) -> [String: Any] {
        (try? self.toJSONData(outputFormatting: outputFormatting)?.toJsonObject()) as? [String: Any] ?? [:]
    }
}
