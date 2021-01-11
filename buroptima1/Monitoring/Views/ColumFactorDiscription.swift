//
//  ColumFactorDiscription.swift
//  buroptima1
//
//  Created by Nail Safin on 10.12.2020.
//  Copyright © 2020 Nail Safin. All rights reserved.
//

import SwiftUI

struct ColumFactorDiscription: View {
    
    @EnvironmentObject var vm: MonitoringVM
    
    
    var body: some View {
        GeometryReader{ geometry in
            HStack (spacing: 0) {
                Text("Время").frame(width: geometry.size.width / 4)
             
                VStack (spacing: 10) {
                    ForEach(vm.colum.indicators, id:\.id) { item in
                        VStack (spacing: 10) {
                            Text("\(item.title)")
                            Path { path in
                                let tmpX = (geometry.size.width / CGFloat(item.max))
                                let tmpDouble = (item.value as NSString).doubleValue
                                let tmp = tmpX * CGFloat(tmpDouble)
                                path.addArc(center: CGPoint(x: tmp, y: 0), radius: 4, startAngle: Angle(radians: 0.0), endAngle: Angle(radians: Double.pi * 2), clockwise: true )
                                path.move(to: CGPoint(x: 0, y: 0))
                                path.addLine(to: CGPoint(x: geometry.size.width, y: 0))
                                
                            }
                            .stroke(Color(hex: item.color), lineWidth: 1)
                            .animation(.linear(duration: 0.6))
                            HStack{
                                Text(String(format: "%.f", item.min))
                                Spacer()
                                Text("\(item.value) \(item.unit)")
                                Spacer()
                                Text(String(format: "%.f", item.max))
                            }
                            
                        }
                    }
                }
            }
        }
    }
}

struct ColumFactorDiscription_Previews: PreviewProvider {
    static var previews: some View {
        ColumFactorDiscription()
    }
}
