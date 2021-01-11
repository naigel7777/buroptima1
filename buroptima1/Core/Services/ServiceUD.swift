//
//  ServiceUD.swift
//  buroptima1
//
//  Created by Nail Safin on 16.07.2020.
//  Copyright © 2020 Nail Safin. All rights reserved.
//

import Foundation


final class ServiceUD {
    private let provider: UserDefaults?
    
    init(with ud: UserDefaults? = UserDefaults(suiteName: "com.buroptima")) {
        provider = ud
        
    }
    
    func set(to key: String, value: String) {
        provider?.set(value, forKey: key)
    }
    func get(from key: String) -> String {
        return provider?.string(forKey: key) ?? ""
    }
}


