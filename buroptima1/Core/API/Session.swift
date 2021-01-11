//
//  Session.swift
//  buroptima1
//
//  Created by Nail Safin on 09.06.2020.
//  Copyright © 2020 Nail Safin. All rights reserved.
//

import Foundation
import UIKit
class Session
{
    static let shared = Session()
    private init () {}
    
    var token = ""
    var orgID: Int = 1
    var personID: Int = 1
    var code: Int = 1
}
