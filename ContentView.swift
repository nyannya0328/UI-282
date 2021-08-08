//
//  ContentView.swift
//  UI-282
//
//  Created by nyannyan0328 on 2021/08/08.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader{proxy in
            
            
            let size = proxy.size
            let bottomeEdge = proxy.safeAreaInsets.bottom
            
            Home(size: size, bottomEdge: bottomeEdge)
                .ignoresSafeArea(.all, edges: .bottom)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
