//
//  AnalyticsEventMapper.swift
//  Pods
//
//  Created by Ahmad Almasri on 1/12/21.
//

import Foundation

public protocol Eventable {
    var name: String { get  }
    var parameters: [String: Any] { get }
}

public struct Caught {
    
    public init(errorId: String, message: String, error: Error) {
        self.errorId = errorId
        self.message = message
        self.error = error
    }
    
    var errorId: String
    var message: String
    var error: Error
    
    
}
