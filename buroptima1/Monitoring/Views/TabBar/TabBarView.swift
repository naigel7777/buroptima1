//
//  TabBarView.swift
//  buroptima1
//
//  Created by Nail Safin on 26.11.2020.
//  Copyright © 2020 Nail Safin. All rights reserved.
//

import Foundation
import SwiftUI

struct TabBarView: View {
    @State var current = "Бурение"
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom) ) {
            TabView(selection: $current) {
                Text("Бурение")
                    .tag("Бурение")
                Text("Механика")
                    .tag("Механика")
                Text("Расход ПЖ")
                    .tag("Расход ПЖ")
                Text("Насос")
                    .tag("Насос")
                
            }
            HStack(spacing: 0){
                TabButton(title: "Бурение", image: "line.horizontal.3", selected: $current)
                Spacer(minLength: 0)
                TabButton(title: "Механика", image: "line.horizontal.3", selected: $current)
                Spacer(minLength: 0)
                TabButton(title: "Расход ПЖ", image: "line.horizontal.3", selected: $current)
                Spacer(minLength: 0)
                TabButton(title: "Насос", image: "line.horizontal.3", selected: $current)
            }
            .padding(.vertical, 12)
            .padding(.horizontal)
            .background(Color("tab"))
            .clipShape(Capsule())
            .padding(.horizontal,25)
        }

    }
}
