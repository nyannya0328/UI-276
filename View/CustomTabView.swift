//
//  CustomTabView.swift
//  CustomTabView
//
//  Created by nyannyan0328 on 2021/08/02.
//

import SwiftUI

struct CustomTabView: View {
    @StateObject var model = CardViewModel()
    
    init(){
        
        UITabBar.appearance().isHidden = true
    }
    
    @Namespace var animation
    var body: some View {
        TabView(selection:$model.selectdTab){
            
            
            Home(animation: animation)
                .environmentObject(model)
                .tag("Home")
            
            EventsMainView()
                .tag("Puchased")
            
            GeometryReader{proxy in
                
                let topEdge = proxy.safeAreaInsets.top
                
                MessageMainView(topEdge: topEdge)
                    .ignoresSafeArea(.all, edges: .top)
                
                
            }
                .tag("Setting")
        }
        .overlay(
        
            HStack(spacing:0){
                
                MainTabButton(title: "Home", image: "house.fill", animation: animation)
                
                MainTabButton(title: "Puchased", image: "purchased.circle", animation: animation)
                
                MainTabButton(title: "Setting", image: "gear.circle", animation: animation)
                
                
                
            }
                .environmentObject(model)
                .padding(.horizontal)
                .padding(.vertical,10)
                .background(.black.opacity(0.8),in: Capsule())
                .padding(.horizontal)
                
            
            ,alignment: .bottom
        
        )
        .overlay(
        
            DetailView(animation: animation)
                .environmentObject(model)
            
        
        )
    }
}

struct CustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabView()
    }
}

struct MainTabButton : View{
    
    var title : String
    var image : String
    var animation : Namespace.ID
    
    @EnvironmentObject var model : CardViewModel
    
    var body: some View{
        
        
        Button {
            withAnimation{
                
                model.selectdTab = title
            }
        } label: {
            
            VStack(spacing:8){
                
                Image(systemName: image)
                    .font(.title2)
                    .frame(height: 18)
                
                Text(title)
                    .font(.caption.bold())
            }
            .foregroundColor(model.selectdTab == title ? Color("Tab") : .gray)
            .frame(maxWidth:.infinity)
            .overlay(
            
                ZStack{
                    
                    if model.selectdTab == title{
                        
                        MainCustomShape()
                        
                            .fill(
                            
                            
                                LinearGradient(colors: [
                                
                                    Color("Tab").opacity(0.3),
                                    .red.opacity(0.3),
                                    .blue.opacity(0.3)
                                
                                
                                ], startPoint: .top, endPoint: .bottom)
                            
                            )
                            .matchedGeometryEffect(id: "TAB", in: animation)
                            .padding(.top,-10)
                            .padding(.horizontal,9)
                        
                    }
                }
            
            )
            
        }

    }
}


struct MainCustomShape : Shape{
    
    func path(in rect: CGRect) -> Path {
        return Path{path in
            
            
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            path.addLine(to: CGPoint(x:rect.width - 10 , y: rect.height))
            path.addLine(to: CGPoint(x:10, y: rect.height))
        }
    }
}
