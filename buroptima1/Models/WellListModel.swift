//
//  WellListModel.swift
//  buroptima1
//
//  Created by Nail Safin on 04.12.2020.
//  Copyright © 2020 Nail Safin. All rights reserved.
//


import Foundation

// MARK: - WellListModel
struct WellListModel: Codable {
    let code: Int
    let res: [WellList]
}

// MARK: - Re
struct WellList: Codable, Identifiable {
    let id: Int
    let title: String
    let wellClusters: [WellCluster]

    enum CodingKeys: String, CodingKey {
        case id, title
        case wellClusters = "well_clusters"
    }
}

// MARK: - WellCluster
struct WellCluster: Codable, Identifiable {
    let id: Int
    let title: String
    let wells: [Well]
}

// MARK: - Well
struct Well: Codable, Identifiable {
    let id: Int
    let title: String
    let online: Int
}
