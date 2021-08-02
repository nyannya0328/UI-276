//
//  DetailView.swift
//  DetailView
//
//  Created by nyannyan0328 on 2021/08/02.
//

import SwiftUI

struct DetailView: View {
    @EnvironmentObject var model : CardViewModel
    
    @State var showdate = false
    var animation : Namespace.ID
    var body: some View {
        if let card = model.currentCard,model.showDetail{
            
            
            VStack(spacing:0){
                
                
                Image(card.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .matchedGeometryEffect(id: card.id + "IMAGE", in: animation)
                    .background(
                    
                    
                        LinearGradient(colors: [
                        
                            Color("\(card.cardColor)1"),
                            Color("\(card.cardColor)2"),
                            
                            Color("\(card.cardColor)3"),
                        
                        
                        
                        ], startPoint: .topLeading, endPoint: .bottomTrailing)
                            .matchedGeometryEffect(id: card.id + "BG", in: animation)
                            .ignoresSafeArea()
                    
                    )
                    .overlay(
                    
                        Button(action: {
                            withAnimation{
                                
                                
                                model.showDetail = false
                            }
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .font(.title2)
                                .padding()
                                .foregroundColor(.white)
                                .background(.black,in: Circle())
                                
                            
                            
                        })
                            .padding()
                            .opacity(showdate ? 1 : 0)
                    
                    
                        ,alignment: .topTrailing
                    )
                
                
          
                    
                    
                    
                    VStack(alignment: .leading, spacing: 15) {
                        
                        
                        Text(card.title)
                            .font(.title2.bold())
                            .matchedGeometryEffect(id: "\(card.id)TITLE", in: animation)
                            
                        PopUpMainView()
                        
                        
                    }
                    .opacity(showdate ? 1 : 0)
                    
                    
                   
                  
                
                
                
                
                
                
            }
            .background(.ultraThinMaterial)
            .onAppear {
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    
                    showdate = true
                }
                
            }
            .onDisappear {
                
                showdate = false
                
            }
            
            
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
