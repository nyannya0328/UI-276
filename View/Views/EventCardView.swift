//
//  EventCardView.swift
//  EventCardView
//
//  Created by nyannyan0328 on 2021/08/02.
//

import SwiftUI

struct EventCardView: View {
    @Binding var pinchValue : CGFloat
    var event : Event
    var body: some View {
        HStack(spacing:15){
            
            
            Text(getDate())
                .font(.title3.bold())
                .fontWeight(.black)
                .multilineTextAlignment(.center)
            
            VStack(alignment: .leading, spacing: 0) {
                
                VStack(alignment: .leading, spacing: 15) {
                    
                    Text(event.title)
                        .font(.title3.weight(.semibold))
                        .foregroundColor(.orange)
                        .lineLimit(1)
                    
                    
                    Text(event.timing)
                        .font(.body.bold())
                        .foregroundColor(.green)
                        .opacity(0.5)
                        .lineLimit(1)
                    
                    
                    
                }
                
                .frame(height: 100)
                .frame(maxWidth:.infinity,alignment: .leading)
                
                .overlay(
                
                Image(systemName: "chevron.right")
                
                ,alignment: .trailing
                
                )
                
                
                VStack(alignment: .leading, spacing: 15) {
                    
                    Text("A")
                    
                    Text("A")
                    
                    Text("A")
                    
                    
                    HStack(spacing:10){
                        
                        
                        ForEach(1...3,id:\.self){index in
                            
                            
                            
                            Image("p\(index)")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 30, height: 30)
                                .clipShape(Circle())
                                .offset(x: -getImageoffset())
                            
                        }
                        
                        
                        
                    }
                    .padding(.top)
                    .padding(.leading,20)
                    
                    
                    
                    
                    
                    
                }
                .frame(height: maxCardSize(), alignment: .top)
                .opacity(getopacity())
            }
            
            Spacer()
            
            
            
            
            
        }
        .padding()
        .frame(height: 100 + maxCardSize())
        .background(.white,in: RoundedRectangle(cornerRadius: 10))
        .clipped()
        .shadow(color: .black.opacity(0.3), radius: 5, x: 5, y: 5)
        .shadow(color: .red.opacity(0.3), radius: 5, x: 0, y: -5)
    }
       
    func getImageoffset()->CGFloat{
        
        let progress = maxCardSize() / 180
        
        return progress * 20
        
        
    }
    
    func getDate()->String{
        
        return event.date.replacingOccurrences(of: " ", with: "\n")
    }
    
    func maxCardSize()->CGFloat{
        
        let progress = pinchValue * 40
        
        return progress
    }
    
    func getopacity()->CGFloat{
        let progress = maxCardSize() / 180
        
        return progress
        
        
    }
    
    
    
}

struct EventCardView_Previews: PreviewProvider {
    static var previews: some View {
        EventsMainView()
    }
}
