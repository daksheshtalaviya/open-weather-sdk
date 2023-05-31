//
//  System.swift
//  OpenWeatherSDK
//
//  Created by Dksh on 28/05/23.
//

import Foundation

public struct System : Codable {
    
    /// Internal parameter
    public let type : Int?
    
    /// Internal parameter
    public let id : Int?
    
    /// Country code (GB, JP etc.)
    public let country : String?
    
    /// Sunrise time, unix, UTC
    public let sunrise : Int?
    
    /// Sunset time, unix, UTC
    public let sunset : Int?
    
}
