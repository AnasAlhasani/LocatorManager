//
//  LocatorError.swift
//  LocatorManager
//
//  Created by Anas Alhasani on 5/2/18.
//  Copyright © 2018 Anas Alhasani. All rights reserved.
//

import Foundation

public enum LocatorError {
    
    case locationFail(String)
    case unauthorized(String)
    
    public var description: String {
        switch self {
        case .locationFail(let string): return string
        case .unauthorized(let string): return string
        }
    }
}
