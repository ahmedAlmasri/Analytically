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
    func logEvent(name: String, parameters: [String: Any], timed: Bool)
    func logError(errorId: String, message: String, error: Error)
    func endTimedEvent(name: String, parameters: [String: Any])
   
}

extension AnalyticsProvider {
    func logError(errorId: String, message: String, error: Error) {}
    public func endTimedEvent(name: String, parameters: [String: Any]) { }
}
