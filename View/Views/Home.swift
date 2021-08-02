//
//  Home.swift
//  Home
//
//  Created by nyannyan0328 on 2021/08/02.
//

import SwiftUI

struct Home: View {
    @EnvironmentObject var model : CardViewModel
    var animation : Namespace.ID
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack(spacing:15){
                
                
                Text("Best Selling")
                    .font(.title2)
                    .fontWeight(.black)
                    .frame(maxWidth:.infinity,alignment: .leading)
                
                
                ForEach(cards){card in
                    
                    Button {
                        
                        withAnimation(.spring()){
                            
                            model.currentCard = card
                            model.showDetail = true
                        }
                        
                    } label: {
                        
                        
                        VStack{
                            
                           
                            cardView(card: card)
                            
                            
                        }
                        .padding()
                        .background(
                            
                            
                            cardBG(card: card)
                        
                        
                        
                        )
                        
                        
                        
                    }
                    .buttonStyle(CardButtonStyle())

                    
                    
                }
                
                
                
                
            }
            .padding()
            .padding(.bottom,80)
            
            
            
        }
        
      
       
        
    }
    
    
    @ViewBuilder
    
    func cardBG(card : Card) -> some View{
        
        
        ZStack{
            
            if model.showDetail && model.currentCard == card{
                
                
                    LinearGradient(colors: [
                    
                        Color("\(card.cardColor)1"),
                        Color("\(card.cardColor)2"),
                        
                        Color("\(card.cardColor)3"),
                    
                    
                    
                    ], startPoint: .topLeading, endPoint: .bottomTrailing)
                     
                
                
                
            }
            
            else{
                
                
                    LinearGradient(colors: [
                    
                        Color("\(card.cardColor)1"),
                        Color("\(card.cardColor)2"),
                        
                        Color("\(card.cardColor)3"),
                    
                    
                    
                    ], startPoint: .topLeading, endPoint: .bottomTrailing)
                        .matchedGeometryEffect(id: card.id + "BG", in: animation)
            }
            
        }
        
        
    }
    
    
    @ViewBuilder
    
    func cardView(card : Card) -> some View{
        
        VStack(spacing:15){
            
            
            if model.showDetail && model.currentCard == card{
                
                
                Image(card.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .opacity(0)
                
                
                Text(card.title)
                    .font(.footnote.italic())
                    .foregroundColor(.white)
                    .opacity(0)
                   
                
                
                
            }
            
            else{
                
                
                
                Image(card.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .matchedGeometryEffect(id: card.id + "IMAGE", in: animation)
                    .cornerRadius(10)
                
                
                Text(card.title)
                    .font(.footnote.italic())
                    .foregroundColor(.white)
                    .matchedGeometryEffect(id: "\(card.id)TITLE", in: animation)
            }
        }
        
        
        
        
    }
    
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CardButtonStyle : ButtonStyle{
    
    func makeBody(configuration: Configuration) -> some View {
        return configuration.label
            .scaleEffect(configuration.isPressed ? 0.6 : 1)
            .animation(.easeInOut, value: configuration.isPressed)
            .shadow(radius: configuration.isPressed ? 10 : 0)
           
        
        
    }
}
