//
//  SwiftUIView.swift
//  buroptima1
//
//  Created by Nail Safin on 27.07.2020.
//  Copyright © 2020 Nail Safin. All rights reserved.
//

import SwiftUI

struct MenuView: View {
    
    @Binding var open: Bool
    @EnvironmentObject var vm: MenuVM
    
    var body: some View {
    //    ScrollView(.vertical, showsIndicators: false) {
            VStack(){
                HStack{
                    Image("forest").resizable()
                        .frame(width: 60, height: 60,alignment: .leading)
                        .clipShape(Circle())
                        .padding(.horizontal, 20)
                    Text("Name Surname").foregroundColor(.white)
                        .font(.system(size: 20, weight: .semibold))
                        .padding(20)
                }.padding(.top, 20)
                ForEach (self.vm.model, id: \.id) { i in
                    Text(i.title)
                        
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .font(.title)
                        .multilineTextAlignment(.leading)
                        .frame(alignment: .leading)
                        .padding(.vertical, 10)
                    
                    MenuRowView(open: self.$open, wellList: i).frame(alignment: .leading)
                }
                
                Spacer()
            }
            .padding(.vertical, 30)
            .background(Image("forest").resizable())
             //   .background(LinearGradient(gradient: Gradient(colors: [.green, .blue]), startPoint: .top, endPoint: .bottom))
                .padding(.trailing, 80)
                .offset(x: open ? 0 : -UIScreen.main.bounds.width )
                .rotation3DEffect(Angle(degrees: open ? 0 : 45), axis: (x: 0, y: 20, z: 0))
                .animation(.default)
                .onTapGesture {
                  //  self.open.toggle()
            }
            .edgesIgnoringSafeArea(.vertical)
        }
 //   }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(open: .constant(true))
    }
}
