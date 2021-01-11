//
//  ContentView.swift
//  buroptima1
//
//  Created by Nail Safin on 27.05.2020.
//  Copyright © 2020 Nail Safin. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var viewModel: LoginController


    var body: some View {
    NavigationView {
        VStack{
            Image("forest").resizable().edgesIgnoringSafeArea(.top)
            Logo().offset(y: -150).padding(.bottom, -150)
            Spacer()
            
            VStack(alignment: .center, spacing: 5.0) {
                Text("Buroptima")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .lineLimit(nil)
                Text(/*@START_MENU_TOKEN@*/"system"/*@END_MENU_TOKEN@*/).padding()
                
                
                
            }
            
            VStack{
                HStack(alignment: .center, spacing: 25.0){
                    Text ("Login")
                    TextField("Enter your login", text: $viewModel.login)
                        .cornerRadius(/*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
                        
                }
                .padding(.horizontal)
                HStack(alignment: .center, spacing: 25.0){
                    Text("Password")
                    TextField("Enter your passsword", text: $viewModel.password)
                }
                .padding(.horizontal)
                NavigationLink(destination: LazyView{Monitoring().environmentObject(self.viewModel.monitoringVM)}
                                .navigationBarTitle("", displayMode: .inline)
                                .navigationBarHidden(true),
                               tag: self.viewModel.tagButton,
                               selection: self.$viewModel.tap) {
                    
                    Button(action: viewModel.showlogin) {
                    Text("Enter")
                        .font(.title)
                        .fontWeight(.ultraLight)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                        .frame(width: 200.0)
                        .background(LinearGradient.actionButton)
                        .cornerRadius(/*@START_MENU_TOKEN@*/15.0/*@END_MENU_TOKEN@*/)
                    }}
                Spacer()
                
            }
        }
    }
    }

}
fileprivate extension LinearGradient {
    static let actionButton = LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]),
                                            startPoint: .topLeading,
                                            endPoint: .bottomTrailing)
}
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView().environmentObject(LoginController())
    }
}
