//
//  MessageMainView.swift
//  MessageMainView
//
//  Created by nyannyan0328 on 2021/08/02.
//

import SwiftUI



struct MessageMainView: View {
    
    let maxH = UIScreen.main.bounds.height < 750 ? (UIScreen.main.bounds.height / 1.9) : (UIScreen.main.bounds.height / 2.3)
    
    var topEdge : CGFloat = 0
    
    @State var offset : CGFloat = 0
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack(spacing:15){
                
                
                GeometryReader{proxy in
                    
                    TopBar(topEdge: topEdge, offset: $offset, maxH: maxH)
                    
                   
                    .frame(maxWidth: .infinity)
                    .frame(height: getHeaderHeight(),alignment: .bottom)
                    .background(
                    
                        
                        LinearGradient(colors: [
                            .red,
                            .green,
                            .orange,
                            .purple
                                
                        
                        
                        ], startPoint: .top, endPoint: .bottom)
                    
                        ,in: CustomShape(radi: getRadi(), corner: .bottomRight)
                    
                    )
                    .overlay(
                    
                    
                        TopNavBar(topEdge: topEdge, offset: $offset, maxH: maxH)
                            .padding(.horizontal)
                            .frame(height: 80)
                            .padding(.top,topEdge)
                           
                        
                    
                        ,alignment: .top
                    )
                    
                    
                    
                    
                }
                .frame(height: maxH)
                .offset(y: -offset)
                .zIndex(1)
                
                VStack{
                    
                    
                    ForEach(messages){message in
                        
                        
                        MessageCardView(message: message)
                        
                    }
                }
                .padding()
                .zIndex(0)
                
                
                
            }
            .modifier(OffsetModifier(offset: $offset))
            
    
        }
        .coordinateSpace(name: "SCROLL")
        .padding(.bottom,100)
        
        
    }
    
    func getHeaderHeight()->CGFloat{
        
        let topHeight = maxH + offset
        
        return topHeight > (80 + topEdge) ? topHeight : (80 + topEdge)
    }
    
    func getRadi()->CGFloat{
        
        let progress = -offset / (maxH - (80 + topEdge))
        
        let value = 1 - progress
        
        let radi = value * 50
        
        return offset < 0 ? radi : 35
    }
    
}

struct MessageMainView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct MessageCardView : View{
    
    var message  : Message
    
    var body: some View{
        
        HStack{
            
            
          Circle()
                .fill(message.color)
                .frame(width: 40, height: 40)
                .opacity(0.7)
            
            
            VStack(alignment: .leading, spacing: 15) {
                
                Text(message.userName)
                    .font(.title3.bold())
                    .foregroundColor(.brown)
                
                Divider()
                    .background(.orange)
                Text(message.message)
                    .font(.footnote.italic())
                
                
            }
            
        }
        .frame(maxWidth: .infinity,alignment: .leading)
    }
}

struct TopBar : View{
    
    var topEdge : CGFloat
    @Binding var offset : CGFloat
    var maxH : CGFloat
    
    var body: some View{
        
        VStack(alignment: .leading, spacing: 15) {
            
            
          Image("p1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 60, height: 60)
                .clipShape(Circle())
            
            ScrollView(.vertical, showsIndicators: false) {
                
                
                Text("Deer or true deer are hoofed ruminant mammals forming the family Cervidae. The two main groups of deer are the Cervinae, including the muntjac, the elk (wapiti), the red deer, the fallow deer, and the chital; and the Capreolinae, including the reindeer (caribou), the roe deer, the mule deer, and the moose. Female reindeer, and male deer of all species except the Chinese water deer, grow and shed new antlers each year. In this they differ from permanently horned antelope, which are part of a different family (Bovidae) within the same order of even-toed ungulates (Artiodactyla).")
                    .font(.title3)
            }
            .frame(height: 60)
            
            
            
            
        }
        .padding()
        .padding(.bottom)
        .opacity(getOpacity())
    }
    
    func getOpacity()->CGFloat{
        
        let progress = -offset / 70
        
        let opa = 1 - progress
        
        return offset < 0 ? opa : 1
    }
}

struct TopNavBar : View{
    
    var topEdge : CGFloat
    @Binding var offset : CGFloat
    
    var maxH : CGFloat
    
    var body: some View{
        
        HStack{
            
            
            Button {
                
            } label: {
                
                Image(systemName: "xmark")
                    .font(.system(size: 20, weight: .bold))
                  
            }
            
            
            
           
            
            Image("p1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 25, height: 25)
                .clipShape(Circle())
                .opacity(topBarTitleopacity())
            
            
         
            
            Spacer()
            
            Button {
                
            } label: {
                
                Image(systemName: "figure.stand.line.dotted.figure.stand")
                    .font(.system(size: 20, weight: .bold))
            }
            
            
            
            
        

            
            
            
        }
        .foregroundColor(.primary)
    }
    
    func topBarTitleopacity()->CGFloat{
        
        
        let progress = -(offset + 60) / (maxH - (80 + topEdge))
        
        return progress
    }
    
    
    
    
}


