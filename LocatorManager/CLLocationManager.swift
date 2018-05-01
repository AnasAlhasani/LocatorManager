//
//  CLLocationManager.swift
//  LocatorManager
//
//  Created by Anas Alhasani on 5/1/18.
//  Copyright © 2018 Anas Alhasani. All rights reserved.
//

import Foundation
import CoreLocation

public extension CLLocationManager {
    
    enum ServiceStatus {
        case available
        case notDetermined
        case denied
        case restricted
        case disabled
    }
    
    var serviceStatus: ServiceStatus {
        
        guard CLLocationManager.locationServicesEnabled() else {
            return .disabled
        }
        
        switch CLLocationManager.authorizationStatus() {
        case .notDetermined:
            return .notDetermined
        case .denied:
            return .denied
        case .restricted:
            return .restricted
        default:
            return .available
        }
        
    }
}
