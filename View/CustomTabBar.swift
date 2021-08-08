//
//  CustomTabBar.swift
//  CustomTabBar
//
//  Created by nyannyan0328 on 2021/08/08.
//

import SwiftUI

struct CustomTabBar: View {
    var animation : Namespace.ID
    @Binding var currentTab : Tab

    var size : CGSize
    var bottomEdge : CGFloat
    
    @State var startAnimation : Bool = false
    var body: some View {
        HStack(spacing:0){
            
            ForEach(Tab.allCases,id:\.rawValue){tab in
                
                
                TabButton(tab: tab, animation: animation, currentTab: $currentTab) { pressedTab in
                    
                    
                    withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 1)){
                        
                        
                        
                        startAnimation = true
                       
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.25){
                        
                        withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 1)){
                            
                            
                            
                         
                           currentTab = pressedTab
                        }
                        
                        
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.45){
                        
                        withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 1)){
                            
                            
                            
                         
                           startAnimation = false
                        }
                        
                        
                    }
                    
                    
                    
                    
                }
                
                
            }
            
            
        }
        .background(
        
            ZStack{
                
                let animationOffset : CGFloat = (startAnimation ? (startAnimation ? 15 : 18) : (bottomEdge == 0 ? 26 : 27))
                
                let offset : CGSize = bottomEdge == 0 ? CGSize(width: animationOffset, height: 31) : CGSize(width: animationOffset, height: 36)
                
                Circle()
                    .fill(Color("red"))
                    .frame(width: 45, height: 45)
                    .offset(y: 40)
                
                Circle()
                    .fill(.white)
                    .frame(width: 45, height: 45)
                    .scaleEffect(bottomEdge == 0 ? 0.8 : 1)
                   
                    .offset(x: offset.width, y: offset.height)

                Circle()
                    .fill(.white)
                    .frame(width: 45, height: 45)
                    .scaleEffect(bottomEdge == 0 ? 0.8 : 1)
                    .offset(x: -offset.width, y: offset.height)
                
                    
            }
                .offset(x: getStartOffset())
                .offset(x: getOffset())
            ,alignment: .leading
        
        
        
        )
        .padding(.horizontal,15)
        .padding(.top,8)
        .padding(.bottom,bottomEdge == 0 ? 25 : bottomEdge)
    }
    
    func getStartOffset()->CGFloat{
        
        let reduced = (size.width - 30) / 4
        let center = (reduced - 45) / 2
        
        return center
    }
    func getOffset()->CGFloat{
        let reduced = (size.width - 30) / 4
        
        let index = Tab.allCases.firstIndex { checkTab in
        
            return checkTab == currentTab
        } ?? 0
        
        return reduced * CGFloat(index)
        
        
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 8")
    }
}

struct TabButton : View{
    
    var tab : Tab
    var animation : Namespace.ID
    
    @Binding var currentTab : Tab
    
    var onTap : (Tab)->()
    
    var body: some View{
        
        
        Image(systemName: tab.rawValue)
            .foregroundColor(currentTab == tab ? .white : .gray)
            .frame(width: 45, height: 45)
            .background(
            
                ZStack{
                    
                    if currentTab == tab{
                        
                        Circle()
                            .fill(Color("red"))
                            .matchedGeometryEffect(id: "TAB", in: animation)
                    }
                }
            
            )
            .frame(maxWidth: .infinity)
            .contentShape(Rectangle())
            .onTapGesture {
                if currentTab != tab{
                    
                    onTap(tab)
                }
            }
    }
}


