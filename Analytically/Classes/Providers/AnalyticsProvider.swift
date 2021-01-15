//
//  AnalyticsProvider.swift
//  Pods
//
//  Created by Ahmad Almasri on 1/12/21.
//

import Foundation

public protocol AnalyticsProfileProvider {
    associatedtype User
    func setProfile(with user: User)
}
public protocol AnalyticsProvider {
    func logEvent(name: String, parameters: [String: Any])
    func logError(errorId: String, message: String, error: Error)
   
}

extension AnalyticsProvider {
    func logError(errorId: String, message: String, error: Error) {}
}
