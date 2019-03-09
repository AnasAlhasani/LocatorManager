//
//  Result.swift
//  LocatorManager
//
//  Created by Anas Alhasani on 5/1/18.
//  Copyright © 2018 Anas Alhasani. All rights reserved.
//

import Foundation

public enum Result<Value> {
    case success(Value)
    case failure(Error)
}
