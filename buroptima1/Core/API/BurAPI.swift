//
//  BurAPI.swift
//  buroptima1
//
//  Created by Nail Safin on 09.06.2020.
//  Copyright © 2020 Nail Safin. All rights reserved.
//

import Foundation
import Alamofire
import SignalRSwift

enum ServerError: Error {
    case badRequest
    case notReacheble
}
class BurAPI {
    let burURL = "http://lk.buroptima.com"
    
    private let saveService: BuroptimaSaveInUD
    
    init() {
        saveService = BuroptimaSaveInUD()
    }
    
    
    func getSession(login: String, password: String, async: @escaping(Bool)-> Void) {
        let requestURL = burURL + "/api/account/login"
        let params = ["username": login,
                      "password": password]
        
        Alamofire.request(requestURL, method: .get, parameters: params).responseData { [weak self] response in
            guard let data = response.data else { return print("WOW- we have a trouble with decode")  }
            do {
                print(response)
                let resp = try JSONDecoder().decode(BuroptimaSession.self, from: data)
                let tempResult: [BuroptimaFields: String] = [.accessToken: resp.accessToken,
                                                             .code: "\(resp.code)",
                                                             .orgID: "\(resp.orgID)",
                                                             .personID: "\(resp.personID)"]
                
                self?.saveService.save(fields: tempResult)
                async(true)
            } catch {
                async(false)
                print(error)
            }
        }
    }
    
    func getMonitoring(wellid: Int, begintime: Int, height: Int, scale: Int, completion: @escaping ([Datum],Int) -> Void) {
        let requestURL = burURL + "/api/clients/monitor_data2"
        let params = ["well_id": wellid,
                      "begin": begintime,
                      "height": height,
                      "scale": scale]
        let haders: HTTPHeaders = ["Authorization": "Bearer \(saveService.get(valueFromField: .accessToken))"]
        Alamofire.request(requestURL, method: .get, parameters: params, headers: haders).responseData { (result) in
            guard let data = result.value else {
                completion([],0)
                return print ("WOW - we have a trouble with decoding Monitoring Data") }
            
            do{
                let response = try JSONDecoder().decode(MonitoringModel.self, from: data)
                completion(response.data, response.stop)
                
                
            } catch {
                completion([],0)
                print(error)
            }
        }
    }
    
    func getMonitoringNew(wellid: Int, begintime: Int, height: Int, scale: Int, completion: @escaping ([Datum],Int) -> ()) {
        guard let requestURL = URL(string: burURL + "/api/clients/monitor_data2") else { return }
        let params = ["well_id": wellid,
                      "begin": begintime,
                      "height": height,
                      "scale": scale]
        let body = try? JSONSerialization.data(withJSONObject: params)
       // let haders: HTTPHeaders = ["Authorization": "Bearer \(saveService.get(valueFromField: .accessToken))"]
        
        var request = URLRequest(url: requestURL)
        request.setValue("Bearer \(saveService.get(valueFromField: .accessToken))", forHTTPHeaderField: "Authorization")
        request.httpBody = body
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let tmpData = data
            else { completion([],0)
                return print ("WOW - we have a trouble with decoding Monitoring Data")
                
            }
            do {
                let datum = try JSONDecoder().decode(MonitoringModel.self, from: tmpData)
                DispatchQueue.main.async {
                    completion(datum.data, datum.stop)
                }
                
            } catch {
                print(error)
            }
        }.resume()
    }
    
    func getMonitoringFators (wellid: Int, cache: Bool, completion: @escaping ([Col]) -> Void) {
        let requestURL = burURL + "/api/clients/monitor_card"
        let params = ["well_id": wellid,
                      "cache": cache] as [String : Any]
        let haders: HTTPHeaders = ["Authorization": "Bearer \(saveService.get(valueFromField: .accessToken))"]
        Alamofire.request(requestURL, method: .get, parameters: params, headers: haders).responseData { (result) in
            guard let data = result.value else {
                completion([])
                return print ("WOW - we have a trouble with decoding MonitoringFactors") }
            
            do{
                let response = try JSONDecoder().decode(MonitoringFactorsModel.self, from: data)
                completion(response.cols)
                
                
            } catch {
                completion([])
                print(error)
            }
        }
    }
    
    func getWellList(completion: @escaping ([WellList]) -> ()) {
        guard let requestURL = URL(string: burURL + "/api/clients/well_list") else { return print ("WOW - we have a trouble with request Well List") }
       
        //et haders: HTTPHeaders = ["Authorization": "Bearer \(saveService.get(valueFromField: .accessToken))"]
        
        var request = URLRequest(url: requestURL)
        request.setValue("Bearer \(saveService.get(valueFromField: .accessToken))", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let tmpData = data
            else { completion([])
                return print ("WOW - we have a trouble with decoding Well List")
                
            }
            do {
                let datum = try JSONDecoder().decode(WellListModel.self, from: tmpData)
                DispatchQueue.main.async {
                    completion(datum.res)
                }
                
            } catch {
                print(error)
            }
        }.resume()
    }
    
}
