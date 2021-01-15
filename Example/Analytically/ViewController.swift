//
//  ViewController.swift
//  Analytically
//
//  Created by ahmed.almasri@ymail.com on 01/12/2021.
//  Copyright (c) 2021 ahmed.almasri@ymail.com. All rights reserved.
//

import UIKit
import Analytically

enum TestEvent: String, Eventable {
    
    case firstAction = "FIRST_ACTION"
    var name: String {
        return self.rawValue
    }
    
    var parameters: [String : Any] {
        return ["ck": Date().timeIntervalSince1970]
    }
}
class ViewController: UIViewController {
    var services: AnalyticsService!
    override func viewDidLoad() {
        super.viewDidLoad()
        let provider = FlurryProvider(apiKey: "")
        provider.setProfile(with: FlurryUser(userId: "1", age: 28, gender: .male))
        services = AnalyticsService(providers: [provider])
        
    }

    @IBAction func testTapped(_ sender: UIButton) {
       // fatalError("not action")
        
        services.log(event: TestEvent.firstAction)
    }

}

