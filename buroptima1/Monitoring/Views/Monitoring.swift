//
//  Monitoring.swift
//  buroptima1
//
//  Created by Nail Safin on 25.06.2020.
//  Copyright © 2020 Nail Safin. All rights reserved.
//

import SwiftUI

struct Monitoring: View {
    
    @EnvironmentObject var vm: MonitoringVM
    @State var open: Bool = false
    @State var showFactorDiscription: Bool = false
    @State var scaleIsVisible: Bool = false
    @State var xPos: CGFloat = 270
    @State var yPos: CGFloat = 125
    @State var columName: String = "Параметры бурения"
    //  @Binding var colum: Int
    let scaleInfo = ScaleModel()
    let columIcon :[Int:String] = [1:"01.circle",2:"02.circle",3:"03.circle",4:"04.circle"]
    
    var body: some View {
        ZStack{
            
            VStack{
                
                HStack {
                    
                    Button(action: {
                        self.open.toggle()
                        print("Menu tapped")
                        
                    }, label: {
                        Image(systemName: "line.horizontal.3")
                            .resizable()
                            .renderingMode(.original)
                            .foregroundColor(.white)
                            .frame(width: 15, height: 15)
                        Text("Menu")
                        
                    }).padding()
                    
                    Spacer()
                    Button(action: {
                        self.showFactorDiscription.toggle()
                        print("Factor tapped")
                        
                    }, label: {
                        Image(systemName: "info.circle")
                            .resizable()
                            .renderingMode(.original)
                            .foregroundColor(.white)
                            .frame(width: 15, height: 15)
                        Text("Info")
                        
                    }).padding()
                    if #available(iOS 14, *) {
                        ScaleDropDownMenu(scaleInfo: self.scaleInfo, scale: $vm.scale)
                    } else {
                        Button(action: {
                            withAnimation {
                                self.scaleIsVisible.toggle()
                            }
                            
                        }, label: {
                            Image(systemName: "rectangle.expand.vertical")
                                .resizable()
                                .renderingMode(.original)
                                .foregroundColor(.white)
                                .frame(width: 15, height: 15)
                            
                            Text("\(self.scaleInfo.getScaleInfo(type: self.vm.scale))")
                            
                        })
                        
                        .padding()
          
                    }
                } // HSTACK
                .padding()
                ScrollView(.horizontal){
                    HStack(spacing: 10){
                        ForEach (vm.factors) { value in
                            Button(action: {
                                vm.colum = value
                                columName = value.title
                                print("log - \(value.id)")
                            }) {
                                HStack(spacing: 10) {
                                    Image(systemName: columIcon[value.number] ?? "01.circle")
                                        .foregroundColor(.black)
                                    if columName == value.title {
                                        Text(value.title)
                                            .fontWeight(.bold)
                                            .foregroundColor(.black)
                                    }
                                }
                                .padding(.vertical,10)
                                .padding(.horizontal)
                                .background(Color.black.opacity(columName == value.title ? 0.08 : 0))
                                .clipShape(Capsule())
                            }
                        }

                    } // HSTACK
                    .padding(.horizontal, 15)
                }
                HStack{
                    
                }
                if showFactorDiscription {
                    ColumFactorDiscription()
                }
                
                GraphViewNew()
                
            } // VSTACK
            
            
            
            
            MenuView(open: $open).environmentObject(self.vm.menuVM)
            if #available(iOS 14, *) {
                
            } else {
                RangeDropDown(scaleInfo: self.scaleInfo , scaleIsVisible: $scaleIsVisible , scale: $vm.scale).position(x: xPos, y: yPos).offset(y: scaleIsVisible ? 0 : -100)
            }
        } // ZSTACK
        
    }
}


//struct Monitoring_Previews: PreviewProvider {
//    static var previews: some View {
//      //  Monitoring()
//    }
//}
