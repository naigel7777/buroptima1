//
//  LazyView.swift
//  buroptima1
//
//  Created by Nail Safin on 16.07.2020.
//  Copyright © 2020 Nail Safin. All rights reserved.
//

import SwiftUI

struct LazyView<Content: View>: View {
    
    let build: () -> Content
    
    init(_ build:  @escaping () -> Content) {
        self.build = build
    }
    
    var body: Content {
        build()
    }
}

