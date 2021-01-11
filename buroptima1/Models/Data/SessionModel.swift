//
//  SessionModel.swift
//  buroptima1
//
//  Created by Nail Safin on 09.06.2020.
//  Copyright © 2020 Nail Safin. All rights reserved.
//

import Foundation
// MARK: - Session Model

struct BuroptimaSession: Codable {
    let code: Int
    let accessToken: String
    let personID, orgID: Int

    enum CodingKeys: String, CodingKey {
        case code
        case accessToken = "access_token"
        case personID = "person_id"
        case orgID = "org_id"
    }
}


