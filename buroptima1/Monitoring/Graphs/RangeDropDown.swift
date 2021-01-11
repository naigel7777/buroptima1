//
//  RangeDropDown.swift
//  buroptima1
//
//  Created by Nail Safin on 28.07.2020.
//  Copyright © 2020 Nail Safin. All rights reserved.
//

import SwiftUI

struct RangeDropDown: View {
    
    
    let scaleInfo: ScaleModel
    
    
    @Binding var scaleIsVisible: Bool
    @Binding var scale : Scale
//     @EnvironmentObject var vm: MonitoringVM
    
    var body: some View {
        VStack{
            
            HStack{
                Image(systemName: "rectangle.expand.vertical")
                    .resizable()
                    .renderingMode(.original)
                    .foregroundColor(.white)
                    .frame(width: 15, height: 15)
                Text("\(scaleInfo.getScaleInfo(type: scale))")
            }.onTapGesture {
                withAnimation(.easeInOut) {
                    self.scaleIsVisible.toggle()
                }

            }
            if scaleIsVisible {
//                HStack{ Image(systemName: "rectangle.expand.vertical")
//                    .resizable()
//                    .renderingMode(.original)
//                    .foregroundColor(.white)
//                    .frame(width: 15, height: 15)
//                Text("\(scaleInfo.getScaleInfo(type: scale))")
//                }
                Button(action: {
                    self.scale = .tenMin
//                    self.vm.scale = self.scale
                    self.scaleIsVisible = false
                    print("tapped button \(self.scale.rawValue)")
                }) {
                    Text("\(scaleInfo.getScaleInfo(type: .tenMin))")
                }.foregroundColor(.white)
                
                
                Button(action: {
                    self.scale = .twentyMin
//                    self.vm.scale = self.scale
                    self.scaleIsVisible = false
                    print("tapped button \(self.scale.rawValue)")
                }) {
                    Text("\(scaleInfo.getScaleInfo(type: .twentyMin))")
                }.foregroundColor(.white)
                
                Button(action: {
                    self.scale = .thirtyMin
                    self.scaleIsVisible = false
                    print("tapped button \(self.scale.rawValue)")
                }) {
                    Text("\(scaleInfo.getScaleInfo(type: .thirtyMin))")
                }.foregroundColor(.white)
                
                Button(action: {
                    self.scale = .oneHour
                    self.scaleIsVisible = false
                    print("tapped button \(self.scale.rawValue)")
                }) {
                    Text("\(scaleInfo.getScaleInfo(type: .oneHour))")
                }.foregroundColor(.white)
                
                Button(action: {
                    self.scale = .fourHour
                    self.scaleIsVisible = false
                    print("tapped button \(self.scale.rawValue)")
                }) {
                    Text("\(scaleInfo.getScaleInfo(type: .fourHour))")
                }.foregroundColor(.white)
                
                Button(action: {
                    self.scale = .eightHour
                    self.scaleIsVisible = false
                    print("tapped button \(self.scale.rawValue)")
                }) {
                    Text("\(scaleInfo.getScaleInfo(type: .eightHour))")
                }.foregroundColor(.white)
                
                Button(action: {
                    self.scale = .twelfHour
                    self.scaleIsVisible = false
                    print("tapped button \(self.scale.rawValue)")
                }) {
                    Text("\(scaleInfo.getScaleInfo(type: .twelfHour))")
                }.foregroundColor(.white)
                
                Button(action: {
                    self.scale = .twentyfourHour
                    self.scaleIsVisible = false
                    print("tapped button \(self.scale.rawValue)")
                }) {
                    Text("\(scaleInfo.getScaleInfo(type: .twentyfourHour))")
                }.foregroundColor(.white)
             
                
            }
            
            
            
            
        }
    
        .padding()
  
   // .clipShape(Rectangle())
        .background(Color(UIColor.systemGray6))
        .cornerRadius(20)
   
        
           //.animation(.spring())
    }
}

struct RangeDropDown_Previews: PreviewProvider {
    static var previews: some View {
        RangeDropDown(scaleInfo: ScaleModel(), scaleIsVisible: .constant(true), scale: .constant(.eightHour))
    }
}
