//
//  EventsMainView.swift
//  EventsMainView
//
//  Created by nyannyan0328 on 2021/08/02.
//

import SwiftUI

struct EventsMainView: View {
    @State var pinchValue : CGFloat = 0
    @GestureState var zoom : Bool = false
    @State var lastPinch : CGFloat = 0
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack(spacing:20){
                
                ForEach(events){event in
                    
                    EventCardView(pinchValue: $pinchValue, event: event)
                    
                    
                }
                
            }
            .padding([.vertical,.leading])
            
        }
        .gesture(
        
            MagnificationGesture().updating($zoom, body: { velue, out, _ in
                
                
                out = true
                
            })
                .onChanged({ value in
                    
                    if zoom{
                        
                        let delta = lastPinch + ((value - 1) > 0 ? (value - 1) : (value - 1) * 4.5)
                        var absoluteDelta = delta > 0 ? delta : 0
                        absoluteDelta = absoluteDelta < 4.5 ? absoluteDelta : 4.5
                        self.pinchValue = absoluteDelta
                    }
                
                    
                })
                .onEnded({ value in
                    
                    
                    withAnimation(.easeInOut){
                        
                        
                        if pinchValue > 2{
                            
                            pinchValue = 4.5
                            lastPinch = 4.5
                            
                            
                        }
                        
                        else{
                            
                            
                            pinchValue = 0
                            lastPinch = 0
                            
                            
                        }
                        
                        
                    }
                    
                })
        
        )
        .safeAreaInset(edge: .top, content: {
            
            HStack{
                
                Text("Events")
                    .font(.title2.bold())
                
                
                Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: "magnifyingglass")
                        .font(.system(size: 20, weight: .black))
                }

                
                
            }
            .foregroundColor(.primary)
            .padding(.horizontal)
            
        })
        .background(Color.primary.opacity(0.1))
    }
}

struct EventsMainView_Previews: PreviewProvider {
    static var previews: some View {
        EventsMainView()
    }
}
