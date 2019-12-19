//
//  Elements.swift
//  Elements
//
//  Created by Adam Diaz on 12/19/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//


import Foundation

struct Element: Codable {
    let id: Int?
    let name: String
    let atomicMass: Double
    let boilingPoint: Double
    let meltingPoint: Double
    let discoveredBy: String
    let number: Int
    let symbol: String
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case atomicMass = "atomic_mass"
        case boilingPoint = "boil"
        case meltingPoint = "melt"
        case discoveredBy = "discovered_by"
        case number
        case symbol
    }
}
