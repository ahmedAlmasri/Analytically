//
//  Deallocator.swift
//  Analytically
//
//  Created by Ahmad Almasri on 1/16/21.
//

import Foundation

final class Deallocator {

    var closure: () -> Void

    init(_ closure: @escaping () -> Void) {
        self.closure = closure
    }

    deinit {
        closure()
    }
}
