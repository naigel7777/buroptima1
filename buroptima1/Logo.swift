//
//  logo.swift
//  buroptima1
//
//  Created by Nail Safin on 28.05.2020.
//  Copyright © 2020 Nail Safin. All rights reserved.
//

import SwiftUI

struct Logo: View {
    var body: some View {
        Image("logo")
            .resizable()
            .padding(.bottom, 38.0)
            .frame(width: 300.0, height: 300.0)
            .scaledToFill()
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
        .shadow(radius: 10)
      
        }
    
            
         
            
            
            
            
            
            
            
            
            
            
            
        
            
    
}

struct Logo_Previews: PreviewProvider {
    static var previews: some View {
        Logo()
    }
}
