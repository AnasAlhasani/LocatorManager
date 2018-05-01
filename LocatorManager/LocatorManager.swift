//
//  LocatorManager.swift
//  LocatorManager
//
//  Created by Anas Alhasani on 5/1/18.
//  Copyright © 2018 Anas Alhasani. All rights reserved.
//

import Foundation
import CoreLocation

public class LocatorManager: NSObject {
    
    public typealias LocationHandler = (Result<(latitude: Double, longitude: Double)>) -> Void
    public typealias AuthorizationHandler = (Bool) -> Void
    
    public enum UpdateMode {
        case oneshot
        case continous
    }
    
    public static let shared = LocatorManager()
    
    private let locationManager = CLLocationManager()
    private var updateMode: UpdateMode = .oneshot

    private var locationHandler: LocationHandler?
    
    private override init() {
        super.init()
        locationManager.delegate = self
    }
    
    deinit {
        locationHandler = nil
    }
    
}

private extension LocatorManager {
    
    func requestLocationAuthorization(completion: @escaping AuthorizationHandler) {
        
        switch locationManager.serviceStatus {
        case .disabled, .denied, .restricted:
            completion(false)
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            completion(true)
        default:
            completion(true)
        }
        
    }
    
    func startUpdatingLocation(completion: @escaping LocationHandler) {
        locationHandler = completion
        locationManager.startUpdatingLocation()
    }
    
    func stopUpdatingLocation() {
        locationManager.stopUpdatingLocation()
        locationHandler = nil
    }
    
}

public extension LocatorManager {
    
    func currentPosition(mode: UpdateMode, completion: @escaping LocationHandler) {
        
        requestLocationAuthorization { [weak self] isAuthorized in
            
            if isAuthorized {
                self?.updateMode = mode
                self?.startUpdatingLocation(completion: completion)
            }else {
                let errorMessage = "Location Refused,\nThe app is not allowed to retreive your current location"
                completion(.failure(.unauthorized(errorMessage)))
            }
        }
    }
}

extension LocatorManager: CLLocationManagerDelegate {
    
    public func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        let errorMessage = "Sorry,\n We were unable to find your location"
        locationHandler?(.failure(.locationFail(errorMessage)))
    }
    
    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        guard let latestPosition = locations.first else { return }
        
        let latitude = latestPosition.coordinate.latitude
        
        let longitude = latestPosition.coordinate.longitude
        
        locationHandler?(.success((latitude, longitude)))
        
        
        guard updateMode == .oneshot else { return }
        
        stopUpdatingLocation()
        
    }
}



