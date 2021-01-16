//
//  PageEvents.swift
//  Analytically
//
//  Created by Ahmad Almasri on 1/16/21.
//

import Foundation

enum PageEvents: Eventable {

    case pageView(String)
    
    var name: String {
        
        switch self {
        case .pageView(let name):
            return name
        }
    }
    
    var parameters: [String: Any] {
        switch self {
        
        case .pageView:
            return [:]
        }
    }
}
