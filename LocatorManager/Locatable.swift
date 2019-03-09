//
//  Locatable.swift
//  LocatorManager
//
//  Created by Anas Alhasani on 3/9/19.
//  Copyright © 2019 Anas Alhasani. All rights reserved.
//

import Foundation

public protocol Locatable {
    func currentPosition(mode: UpdateMode, completion: @escaping LocationHandler)
}
