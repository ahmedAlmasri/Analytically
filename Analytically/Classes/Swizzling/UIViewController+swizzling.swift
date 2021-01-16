//
//  UIViewController+swizzling.swift
//  Analytically
//
//  Created by Ahmad Almasri on 1/16/21.
//

import Foundation

private let swizzling: (UIViewController.Type, Selector, Selector) -> () = { viewController, originalSelector, swizzledSelector  in

    let originalMethod = class_getInstanceMethod(viewController, originalSelector)
    let swizzledMethod = class_getInstanceMethod(viewController, swizzledSelector)

    method_exchangeImplementations(originalMethod!, swizzledMethod!)
    
}

private var associatedObjectAddr = ""

extension UIViewController {
    
    static func enableAutoLogPageView() {
        swizzling(Self.self, #selector(Self.viewDidLoad), #selector(Self.proj_viewDidLoad))

    }

    @objc func proj_viewDidLoad() {
        self.proj_viewDidLoad()
        
        let deallocator = Deallocator { [weak self] in
            (self as? Analyticable)?.service.endTimedLog(event: PageEvents.pageView("\(Self.self)"))
        }
        
        objc_setAssociatedObject(self, &associatedObjectAddr, deallocator, .OBJC_ASSOCIATION_RETAIN)
        
        (self as? Analyticable)?.service.log(event: PageEvents.pageView("\(Self.self)"), timed: true)
    }
}
