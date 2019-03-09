//
//  Commons.swift
//  LocatorManager
//
//  Created by Anas Alhasani on 3/9/19.
//  Copyright © 2019 Anas Alhasani. All rights reserved.
//r

import Foundation

// MARK: - Typealias

public typealias LocationHandler = (Result<(latitude: Double, longitude: Double)>) -> Void
typealias AuthorizationHandler = (Bool) -> Void

// MARK: - Mode

public enum UpdateMode {
    case oneshot
    case continous
}
