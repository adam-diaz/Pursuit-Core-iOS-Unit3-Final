//
//  AppError.swift
//  Elements
//
//  Created by Adam Diaz on 12/19/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

enum AppError: Error, CustomStringConvertible {
    case badURL(String)
    case noResponse
    case networkClientError(Error)
    case noData
    case decodingError(Error)
    case encodingError(Error)
    case badStatusCode(Int)
    case badMimeType(String)
    
    
    var description: String {
        switch self {
        case .badURL(let url):
            return "\(url) is a bad url."
        case .noResponse:
            return "No response returned from web api."
        case .networkClientError(let error):
            return "Network Error: \(error)"
        case .noData:
            return "No data returned from web api."
        case .decodingError(let error):
            return "Decoding Error: \(error)"
        case .encodingError(let error):
            return "Encoding Error: \(error)"
        case .badStatusCode(let code):
            return "Bad status code of (\(code)) returned from web api."
        case .badMimeType(let mimeType):
            return "Verify your mime type, found a (\(mimeType)) mime type."
        }
        
        
    }
}
