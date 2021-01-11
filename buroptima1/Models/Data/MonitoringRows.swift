//
//  MonitoringRows.swift
//  buroptima1
//
//  Created by Nail Safin on 26.11.2020.
//  Copyright © 2020 Nail Safin. All rights reserved.
//

import Foundation
enum Colums: Int {
    case weill = 1
    case mehamik 
    case rashod
    case nasos
}

struct ColumsModel {
    let columModel : [Colums: String] = [
        .weill:"Параметры бурения",
        .mehamik:"Механические параметры",
        .rashod:"Расход ПЖ",
        .nasos:"Насос"]
    
    func getColum() -> [Colums: String]{
        return columModel
    }
    func getColumInfo(colum:Colums) -> String{
        let tmp = columModel[colum]
        return tmp ?? "XXX"
    }
}
