//
//  TabButton.swift
//  buroptima1
//
//  Created by Nail Safin on 26.11.2020.
//  Copyright © 2020 Nail Safin. All rights reserved.
//

import SwiftUI

struct TabButton: View {
    
    var title: String
    var image: String
    @Binding var selected : String
    
    var body: some View {
        Button(action: {
            withAnimation(.spring()) {
                selected = title
            }
            
        }) {
            HStack(spacing: 10) {
                Image(systemName: image)
                if selected == title {
                    Text(title)
                        .foregroundColor(.white)
                }
                
                
            }
            .padding(.vertical,10)
            .padding(.horizontal)
            .background(Color.white.opacity(selected == title ? 0.08 : 0))
            .clipShape(Capsule())
        }
    }
}


