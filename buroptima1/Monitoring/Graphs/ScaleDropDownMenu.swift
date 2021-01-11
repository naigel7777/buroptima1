//
//  ScaleDropDownMenu.swift
//  buroptima1
//
//  Created by Nail Safin on 26.11.2020.
//  Copyright © 2020 Nail Safin. All rights reserved.
//

import Foundation
import SwiftUI

@available(iOS 14.0, *)
struct ScaleDropDownMenu: View {
    
    
    let scaleInfo: ScaleModel

    @Binding var scale : Scale
    
    var body: some View {
        Menu (content: {
            
            Button(action: {
                self.scale = .tenMin
                print("tapped button \(self.scale.rawValue)")
            }) {
                Text("\(scaleInfo.getScaleInfo(type: .tenMin))")
            }.foregroundColor(.white)
            
            
            Button(action: {
                self.scale = .twentyMin

                print("tapped button \(self.scale.rawValue)")
            }) {
                Text("\(scaleInfo.getScaleInfo(type: .twentyMin))")
            }.foregroundColor(.white)
            
            Button(action: {
                self.scale = .thirtyMin
                print("tapped button \(self.scale.rawValue)")
            }) {
                Text("\(scaleInfo.getScaleInfo(type: .thirtyMin))")
            }.foregroundColor(.white)
            
            Button(action: {
                self.scale = .oneHour
                print("tapped button \(self.scale.rawValue)")
            }) {
                Text("\(scaleInfo.getScaleInfo(type: .oneHour))")
            }.foregroundColor(.white)
            
            Button(action: {
                self.scale = .fourHour
                print("tapped button \(self.scale.rawValue)")
            }) {
                Text("\(scaleInfo.getScaleInfo(type: .fourHour))")
            }.foregroundColor(.white)
            
            Button(action: {
                self.scale = .eightHour
                print("tapped button \(self.scale.rawValue)")
            }) {
                Text("\(scaleInfo.getScaleInfo(type: .eightHour))")
            }.foregroundColor(.white)
            
            Button(action: {
                self.scale = .twelfHour
                print("tapped button \(self.scale.rawValue)")
            }) {
                Text("\(scaleInfo.getScaleInfo(type: .twelfHour))")
            }.foregroundColor(.white)
            
            Button(action: {
                self.scale = .twentyfourHour
                print("tapped button \(self.scale.rawValue)")
            }) {
                Text("\(scaleInfo.getScaleInfo(type: .twentyfourHour))")
            }.foregroundColor(.white)
        }) {
            Label (title: {
                Text("\(scaleInfo.getScaleInfo(type: scale))")
                    .foregroundColor(Color.white)
            }) {
                Image(systemName: "rectangle.expand.vertical")
                    .foregroundColor(Color.white)
               
                    
            }
            .padding(.vertical,10)
            .padding(.horizontal)
            .background(Color.black)
            .clipShape(Capsule())

        }

    }
}

