//
//  GraphView.swift
//  buroptima1
//
//  Created by Nail Safin on 27.07.2020.
//  Copyright © 2020 Nail Safin. All rights reserved.
//

import SwiftUI

struct GraphView: View {
    
    @EnvironmentObject var vm: MonitoringVM
    
    var body: some View {
        GeometryReader { geometry in
            ForEach(self.vm.visualDataForColum.indices, id: \.self, content: { j in
                Path { path in
                    
                    for i in self.vm.visualDataForColum[j].listData.indices {
                        
                        
                        let vd = self.vm.visualDataForColum[j]
                        let d = vd.listData[i]
                        let c = vd.listData.count
                        
                        let height: CGFloat = geometry.size.height / CGFloat(c)
                        let width: CGFloat = geometry.size.width
                        let scale = width / CGFloat(vd.max - Double(vd.min))
                        
                        let min = Double(vd.min) > d.min ? Double(vd.min) : d.min
                        let max = Double(vd.max) < d.max ? Double(vd.max) : d.max
                        
                        let originMin = CGPoint(x: scale * CGFloat(min), y: height * CGFloat(c - i))
                        let originMax = CGPoint(x: scale * CGFloat(max) + 1, y: height * CGFloat(c - i))
                        
                        
                        
                        path.move(to: originMin)
                        path.addLine(to: originMax)
                        
                    }
                    
                    
                }.stroke(Color(hex: self.vm.visualDataForColum[j].color), lineWidth: 1)
                .animation(.linear(duration: 0.6))
            })
            
        }
    }
    
}

struct GraphView_Previews: PreviewProvider {
    static var previews: some View {
        GraphView()
    }
}
