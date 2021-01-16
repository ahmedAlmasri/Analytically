//
//  AnalyticsService.swift
//  Pods
//
//  Created by Ahmad Almasri on 1/12/21.
//

import Foundation

public final class AnalyticsService {
    private var providers = [AnalyticsProvider]()
    
    public init(providers: [AnalyticsProvider]) {
        self.providers = providers
    }
    
    public func register(provider: AnalyticsProvider) {
        providers.append(provider)
    }

    public func log(event: Eventable, timed: Bool = false) {
        providers.forEach {
            $0.logEvent(name: event.name, parameters: event.parameters, timed: timed)
        }
    }
    public func endTimedLog(event: Eventable) {
        providers.forEach {
            $0.endTimedEvent(name: event.name, parameters: event.parameters)
        }
    }
    public func error(_ caught: Caught) {
        providers.forEach {
            $0.logError(errorId: caught.errorId, message: caught.message, error: caught.error)
        }
    }
    public func enableAutoLogPageView() {
        UIViewController.enableAutoLogPageView()
    }
}
