//
//  GraphviewNew.swift
//  buroptima1
//
//  Created by Nail Safin on 01.12.2020.
//  Copyright © 2020 Nail Safin. All rights reserved.
//

import Foundation
import SwiftUI

struct GraphViewNew: View {
    
    @EnvironmentObject var vm: MonitoringVM
    
    var body: some View {
        
        
       
            List {

                ForEach(self.vm.data, id: \.main.id) { row in
                        GeometryReader { geometry in
                            HStack{
                                Text("\(row.main.tickStart.toDateString)")
                                    .frame(width: geometry.size.width / 4,
                                           alignment: .leading)
                                    
                                    .onAppear(perform: self.vm.onApearTime(row.main.tickStart))
                                ZStack{
                                    ForEach( vm.getIndicator(rowElement: row, geometry: geometry.size), id: \.color) { item in
                                        
                                            Path { path in
                                                item.grafic.forEach { graph in
                                                    path.move(to: graph.min)
                                                    path.addLine(to: graph.max)
                                                }
                   
                                            }
                                            .stroke(Color(hex: item.color), lineWidth: 1)
                                            .animation(.linear(duration: 0.6))
                                            .frame(width: (geometry.size.width / 4) * 3, alignment: .trailing)
                                      
                                    }
                                }
                              
                            }
                
                            
                       
                        }.rotationEffect(.degrees(-180))
                        .listRowInsets(EdgeInsets())
                        .frame(height: 60)
                    // Geometry
                        
      
                } // ForEach data
                
                
                //                    VStack {
                //                        ForEach(self.vm.visualDataForColum.indices, id: \.self, content: { j in
                //                            Path { path in
                //
                //                                for i in self.vm.visualDataForColum[j].listData.indices {
                //                                    let vd = self.vm.visualDataForColum[j]
                //                                    let d = vd.listData[i]
                //                                    if d.exist {
                //
                //                                    let c = vd.listData.count
                //
                //                                    let height: CGFloat = geometry.size.height / CGFloat(c)
                //                                    let width: CGFloat = (geometry.size.width / 4) * 3
                //                                    let scale = width / CGFloat(vd.max - vd.min)
                //
                //                                    var min = d.min
                //
                //                                    if min < 0.0 {
                //                                        min = vd.min
                //                                    } else if min == 0.0 {
                //                                        min = vd.min
                //                                    } else if min < vd.min {
                //                                        min = vd.min
                //                                    } else if min > vd.max {
                //                                        min = vd.max
                //                                    } else {
                //                                        min = d.min
                //                                    }
                //
                //                                    var max = d.max
                //
                //                                    if max < 0 {
                //                                        max = vd.min
                //                                    } else if max == 0.0 {
                //                                        max = vd.min
                //                                    } else if max < vd.min {
                //                                        max = vd.min
                //                                    } else if max > vd.max {
                //                                        max = vd.max
                //                                    } else {
                //                                        max = d.max
                //                                    }
                //
                //                                    let originMin = CGPoint(x: (scale * CGFloat(min)), y: height * CGFloat(c - i))
                //                                   let originMax = CGPoint(x: (scale * CGFloat(max )) + 1, y: height * CGFloat(c - i))
                //
                //
                //
                //                                    path.move(to: originMin)
                //                                    path.addLine(to: originMax)
                //                                    }
                //
                //
                //
                //                                }
                //
                //
                //                            }
                //                            .stroke(Color(hex: self.vm.visualDataForColum[j].color), lineWidth: 1)
                //                            .animation(.linear(duration: 0.6))
                //
                //                        })
                //                    }.frame(width: ((geometry.size.width / 4) * 3) - 30, height: geometry.size.height)
                //                }
            }.rotationEffect(.degrees(-180))
           
            
            
        

        
        
        
        
        
        
    }
    
}
