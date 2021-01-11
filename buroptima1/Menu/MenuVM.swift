//
//  MenuVM.swift
//  buroptima1
//
//  Created by Nail Safin on 27.07.2020.
//  Copyright © 2020 Nail Safin. All rights reserved.
//

import Foundation
import Combine

final class MenuVM: ObservableObject {
    @Published var model: [WellList]
    let api :BurAPI
    @Published var wellID: Int
    init() {
        self.api = BurAPI()
        self.model = []
        self.wellID = 10
        self.getData()
    }
    
    func getData() {
        api.getWellList { (data) in
            self.model = data
            print("в меню пришло значений - \(data.count)")
        }
    }
}
