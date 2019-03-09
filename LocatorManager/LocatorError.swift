//
//  LocatorError.swift
//  LocatorManager
//
//  Created by Anas Alhasani on 5/2/18.
//  Copyright © 2018 Anas Alhasani. All rights reserved.
//

import Foundation

enum LocatorError: Error {
    
    case failed
    case unauthorized
}

extension LocatorError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .failed: return "Sorry,\n We were unable to find your location"
        case .unauthorized: return "Location Refused,\nThe app is not allowed to retreive your current location"
        }
    }
}
