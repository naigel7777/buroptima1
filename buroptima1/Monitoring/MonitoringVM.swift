//
//  MonitoringVM.swift
//  buroptima1
//
//  Created by Nail Safin on 16.07.2020.
//  Copyright © 2020 Nail Safin. All rights reserved.
//

import Foundation
import CoreGraphics
import Combine

final class MonitoringVM: ObservableObject {
    
    
    
    let api: BurAPI
    var data: [(main: Datum, visualElements:[Datum])] = []
    
    var visualDataForColum: [VisualModel] = []
    var listDatum: [Datum] = []
    var factors: [Col] = []
    var menuVM: MenuVM
    
    @Published var visualData: VisualModel = .zero
    @Published var begintime: Int = 0
    @Published var lastTimeStamp: Int = 0
    @Published var scale: Scale = .eightHour
    @Published var colum: Col = .zero
    
    
    private var bag = Set<AnyCancellable>()
    
    init(_ api: BurAPI = BurAPI()) {
        self.api = api
        self.menuVM = MenuVM()
        
        
        
        $begintime
            .sink(receiveValue: getData)
            .store(in: &bag)
        
        $scale
            .combineLatest(menuVM.$wellID){zoom, id in
                (zoom, id)
            }
            .sink { [weak self] _ in self?.begintime = 0 }
            .store(in: &bag)
        
        //         $columID
        //            .sink(receiveValue: createVisualModelForColum(_:))
        //            .store(in: &bag)
        
        $lastTimeStamp
            .filter { [weak self] lasttime in self?.data.last?.main.tickStart == lasttime }
            .sink { [weak self] lasttime in self?.begintime = lasttime }
            .store(in: &bag)
        
    }
    
    func onApearTime(_ time: Int) -> () -> () {
        { [weak self] in
            self?.lastTimeStamp = time
            
        }
    }
    
    private func getData(_ beginTime: Int) {
        let wellid = menuVM.wellID
        api.getMonitoring(wellid: wellid, begintime: beginTime, height: 1200, scale: scale.rawValue) { [weak self] res,stop in
            if beginTime == 0 {
                self?.api.getMonitoringFators(wellid: wellid, cache: false) { [weak self] response in
                    
                    self?.listDatum = res
                    self?.factors = response
                    
                    self?.colum = response.first ?? .zero
                    
                    if let tmpData = self?.configureData(listtime: res) {
                        self?.data = tmpData
                    }
                    
                    print("Get first data ------")
                }
                
            } else {
                
                self?.listDatum.append(contentsOf: res)
                
                if let tmpData = self?.configureData(listtime: res) {
                    self?.data.append(contentsOf: tmpData)
                }
                
                print("Get more data ------ \(stop)")
                
            }
        
        }
        
    }
    
    
    //    private func createVisualModelForColum(_ colum: Int) {
    //
    //        if let tmpCol = self.factors.first(where: {$0.number == colum}) {
    //            var temArray: [VisualModel] = []
    //            tmpCol.indicators.forEach { (indicator) in
    //
    //
    //                let tmpDatum = self.listDatum.compactMap { (item) -> (min: Double, max: Double, exist: Bool) in
    //                    let i = item.indicators?.first(where: {$0.indicatorID == indicator.indicatorID})
    //
    //                    return (min: i?.min ?? 0.0, max: i?.max ?? 0.0, i?.exist ?? true)
    //                }
    //
    //
    //
    //                let tmpStopTime = self.begintime
    //
    //                var tmpModel: VisualModel = VisualModel(id: tmpCol.id,
    //                                                        title: tmpCol.title,
    //                                                        number: tmpCol.number,
    //                                                        titleIndicator: indicator.title,
    //                                                        min: indicator.min,
    //                                                        max: indicator.max,
    //                                                        factor: indicator.factor,
    //                                                        color: indicator.color,
    //                                                        indicatorID: IndicatorType(rawValue: indicator.indicatorID) ?? .MD,
    //                                                        fillStyle: indicator.fillStyle,
    //                                                        lineStyle: indicator.lineStyle,
    //                                                        value: indicator.value,
    //                                                        unit: indicator.unit,
    //                                                        exist: true,
    //                                                        stopTime: tmpStopTime)
    //                tmpModel.listData = tmpDatum
    //
    //
    //
    //
    //                temArray.append(tmpModel)
    //            }
    //            visualDataForColum = temArray
    //            print(" DATA FOR COLUM ---- \(temArray.count)")
    //        }
    //
    //
    //
    //
    //
    //    }
    
    
    private func configureData(listtime: [Datum]) -> [(main: Datum, visualElements: [Datum])] {
        
        var tempArray: [(main: Datum, visualElements:[Datum])] = []
        var tmpVisual = [Datum]()
        var tmpMain = Datum.zero
        
        listtime.forEach { element in
            if  element.i % 100 == 0 {
                if tmpMain != Datum.zero {
                    tempArray.append((tmpMain,tmpVisual))
                    tmpVisual = []
                }
                tmpMain = element
                
            } else {
                tmpVisual.append(element)
            }
        }
        
        return tempArray
    }
    
    
    func getIndicator(rowElement: (main: Datum, visualElements:[Datum]), geometry: CGSize) -> [(grafic: [(min: CGPoint, max: CGPoint)], color: String)] {
        var tmpArray: [(grafic: [(min: CGPoint, max: CGPoint)], color: String)] = []
        var tmpIndicatorArray: [(min: CGPoint, max: CGPoint)] = []
        let c = rowElement.visualElements.count
        let height: CGFloat = geometry.height / CGFloat(c)
        let width: CGFloat = (geometry.width / 4) * 3
        var lastMin: Double = 0.0
        var lastY: Int = 0
        var emptyDataFlag: Bool = true
       
        
        self.colum.indicators.forEach { (indicator) in
            tmpIndicatorArray = []
            var i = 0
            let scale = width / CGFloat(indicator.max - indicator.min)
            
           
            
            rowElement.visualElements.forEach { (item) in
                if let element = item.indicators?.first(where: { $0.indicatorID == indicator.indicatorID }) {
                    
                    if element.exist {
                        
                        var min = element.min ?? 0.0
                        
                                                if min < 0.0 {
                                                    min = 0.0
                                                }
//                                                } else if min == 0.0 {
//                                                    min = rowElement.visualElements.min
//                                                } else if min < vd.min {
//                                                    min = vd.min
//                                                } else if min > vd.max {
//                                                    min = vd.max
//                                                } else {
//                                                    min = d.min
//                                                }
                        
                        var max = element.max ?? 0.1
                        
                        //                        if max < 0 {
                        //                            max = vd.min
                        //                        } else if max == 0.0 {
                        //                            max = vd.min
                        //                        } else if max < vd.min {
                        //                            max = vd.min
                        //                        } else if max > vd.max {
                        //                            max = vd.max
                        //                        } else {
                        //                            max = d.max
                        //                        }
                        if emptyDataFlag {
                            let originMinFlag = CGPoint(x: (scale * CGFloat(lastMin)), y: height * CGFloat(c - lastY))
                            let originMaxFlag = CGPoint(x: (scale * CGFloat(min)) + 1, y: height * CGFloat(c - i))
                            tmpIndicatorArray.append((originMinFlag, originMaxFlag))
   //                         emptyDataFlag = false
                        }
                        
                        let originMin = CGPoint(x: (scale * CGFloat(min)), y: height * CGFloat(c - i))
                        let originMax = CGPoint(x: (scale * CGFloat(max )) + 1, y: height * CGFloat(c - i))
                        tmpIndicatorArray.append((originMin, originMax))
                        

                        lastMin = min
                        lastY = i
                        
                    } else {
                        emptyDataFlag = true
                        
                    }
                    
                    i += 1
                   
                    
                }
                
            }
            tmpArray.append((tmpIndicatorArray,indicator.color))
        }
        
        
        
        
        return tmpArray
    }
    
}



