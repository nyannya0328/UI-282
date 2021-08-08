//
//  Home.swift
//  Home
//
//  Created by nyannyan0328 on 2021/08/08.
//

import SwiftUI

struct Home: View {
    @State var currentTab : Tab = .Home
    
    init(size : CGSize,bottomEdge : CGFloat){
        
        self.size = size
        self.bottomEdge = bottomEdge
        
        UITabBar.appearance().isHidden = true
    }
    @Namespace var animation
    
    var size : CGSize
    var bottomEdge : CGFloat
    var body: some View {
        ZStack(alignment: .bottom) {
            
            TabView(selection:$currentTab){
                
                Text("Home")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.black.opacity(0.05).ignoresSafeArea())
                    .tag(Tab.Home)
                
                Text("Search")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.black.opacity(0.05).ignoresSafeArea())
                    .tag(Tab.Search)
                
                Text("Liked")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.black.opacity(0.05).ignoresSafeArea())
                    .tag(Tab.Liked)
                
                Text("Setting")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.black.opacity(0.05).ignoresSafeArea())
                    .tag(Tab.Setting)
            }
            
       CustomTabBar(animation: animation, currentTab: $currentTab, size: size, bottomEdge: bottomEdge)
                .background(.white)
            
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

enum Tab : String,CaseIterable{
    
   
    case Home = "house.fill"
    case Search = "magnifyingglass"
    case Liked = "suit.heart.fill"
    case Setting = "gearshape"
}
