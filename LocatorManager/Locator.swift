//
//  Locator.swift
//  LocatorManager
//
//  Created by Anas Alhasani on 5/1/18.
//  Copyright © 2018 Anas Alhasani. All rights reserved.
//

import Foundation
import CoreLocation

public final class Locator: NSObject {
    
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

private extension Locator {
    
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

extension Locator: Locatable {
    
    public func currentPosition(mode: UpdateMode, completion: @escaping LocationHandler) {
        requestLocationAuthorization { [weak self] isAuthorized in
            guard isAuthorized else {
                completion(.failure(LocatorError.unauthorized))
                return
            }
            self?.updateMode = mode
            self?.startUpdatingLocation(completion: completion)
        }
    }
}

extension Locator: CLLocationManagerDelegate {
    
    public func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        locationHandler?(.failure(LocatorError.failed))
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
