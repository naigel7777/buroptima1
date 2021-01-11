//
//  LoginController.swift
//  buroptima1
//
//  Created by Nail Safin on 09.06.2020.
//  Copyright © 2020 Nail Safin. All rights reserved.
//

import Foundation
import Combine

final class LoginController: ObservableObject {
    
  
    
    private let api: BurAPI
    private let saver: BuroptimaSaveInUD
    let monitoringVM: MonitoringVM
    let tagButton: Int = 1
    
    @Published var login: String = "admin"
    @Published var password: String = "1234567"
    @Published var tap: Int? = nil
    
    
    init() {
        api = BurAPI()
        saver = BuroptimaSaveInUD()
        monitoringVM = MonitoringVM(api)
    }
    

    
    func showlogin(){
        print("Login : \(login) Password : \(password)")
        api.getSession(login: login, password: password) { [weak self] flag in
            if flag {
                print("LOG --- ", #function, self?.saver.get(valueFromField: .accessToken) ?? "")
                print("LOG --- ", self?.saver.get(valueFromField: .personID) ?? "")
                self?.tap = self?.tagButton
            } else {
                
            }
        }
      

    
       
    }
}
