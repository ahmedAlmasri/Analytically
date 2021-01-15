//
//  AnalyticsProvider.swift
//  Pods
//
//  Created by Ahmad Almasri on 1/12/21.
//

import Foundation
import Flurry_iOS_SDK

public class FlurryProvider: AnalyticsProvider, AnalyticsProfileProvider {
    
    let sessionBuilder: FlurrySessionBuilder
    let apiKey: String
    
    public init(apiKey: String,
         sessionBuilder: FlurrySessionBuilder = FlurrySessionBuilder()
            .withLogLevel(FlurryLogLevelDebug)
            .withCrashReporting(true)
            .withIAPReportingEnabled(true)) {
        
        self.apiKey = apiKey
        self.sessionBuilder = sessionBuilder.withAppVersion( Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String)
        
        setup()
    }
    
    private func setup() {
        Flurry.startSession(apiKey, with: sessionBuilder)
    }
    
    public func logEvent(name: String, parameters: [String : Any]) {
        Flurry.logEvent(name, withParameters: parameters)
    }
    
    public func logError(errorId: String, message: String, error: Error) {
        Flurry.logError(errorId, message: message, error: error)
    }
    
    public func setProfile(with user: FlurryUser) {
        Flurry.setUserID(user.userId)
        Flurry.setAge(Int32(user.age))
        Flurry.setGender(user.gender.rawValue)
    }
}
