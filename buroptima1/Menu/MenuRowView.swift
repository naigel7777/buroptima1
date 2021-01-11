//
//  MenuRowView.swift
//  buroptima1
//
//  Created by Nail Safin on 27.07.2020.
//  Copyright © 2020 Nail Safin. All rights reserved.
//

import SwiftUI

struct MenuRowView: View {
    
    @Binding var open: Bool
    @EnvironmentObject var vm : MenuVM
    var wellList: WellList
    
    var body: some View {
        
        ForEach(wellList.wellClusters) { kust in
            Text(kust.title)
                .fontWeight(.medium)
                .foregroundColor(.black)
                .padding(.horizontal, 20)
                .onTapGesture {
                    self.open.toggle()
                    print("айди куста \(kust.id)")
                    
                }
            ForEach (kust.wells) { well in
                Text(well.title)
                    .fontWeight(well.id == vm.wellID ? .light : .bold)
                    .foregroundColor(.black)
                    .frame(alignment: .leading)
                    .padding(.horizontal, 20)
                    .onTapGesture {
                        print("айди скважины \(well.id)")
                        vm.wellID = well.id
                    
                        self.open.toggle()
                    }
            }
            
        }
    }
    
    
}
