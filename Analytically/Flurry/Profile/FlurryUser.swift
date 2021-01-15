//
//  FlurryUser.swift
//  Analytically
//
//  Created by Ahmad Almasri on 1/15/21.
//

import Foundation

public struct FlurryUser {
    
    public let userId: String
    public let age: UInt
    public let gender: Gender
    
    public init(userId: String, age: UInt, gender: Gender) {
        self.userId = userId
        self.age = age
        self.gender = gender
    }
}
