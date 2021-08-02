//
//  FullSwipPopUpExtension.swift
//  FullSwipPopUpExtension
//
//  Created by nyannyan0328 on 2021/08/02.
//

import SwiftUI

extension View{
    
    func fullswipPopup<Content : View>(show : Binding<Bool>,content : @escaping()->Content) -> some View{
        
        
       fullswipPopHelper(show: show, content: content(), maincontent: self)
            
    }
    
    
    
}

struct FullSwipPopUpExtension_Previews: PreviewProvider {
    static var previews: some View {
        PopUpMainView()
    }
}

private struct fullswipPopHelper<Maincotent : View,Content:View> : View{
    
    var maincontent : Maincotent
    var content : Content
    @Binding var show : Bool
    
    init(show : Binding<Bool>,content : Content,maincontent : Maincotent){
        
        
        self._show = show
        self.content = content
        self.maincontent = maincontent
        
        
        
    }
    
    @GestureState var gestureoffset : CGFloat = 0
    
    @State var offset : CGFloat = 0
    
    @Environment(\.colorScheme) var schemer
    
    var body: some View{
        
        GeometryReader{proxy in
            
            maincontent
                .offset(x:show && offset >= 0 ? getoffset(size: proxy.size.width) : 0)
                .overlay(
                
                    ZStack{
                        
                        
                        if show{
                            
                            content
                                .background(
                                    
                                    
                                    (schemer == .dark ? Color.black : Color.white)
                                        .ignoresSafeArea()
                                    
                                        .shadow(color: .black.opacity(0.3), radius: 5, x: 5, y: 5)
                                    
                                        .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: -5)
                                
                                
                                
                                )
                                .offset(x: offset > 0 ? offset : 0)
                                .gesture(
                                
                                    DragGesture().updating($gestureoffset, body: { value, out, _ in
                                        out = value.translation.width
                                    })
                                        .onEnded({ Value in
                                       
                                            withAnimation(.spring()){
                                                
                                                
                                                offset = 0
                                                
                                                let translation = Value.translation.width
                                                
                                                let maxTranslation = proxy.size.width / 2.5
                                                if translation > maxTranslation{
                                                    
                                                    
                                                    show = false
                                                }
                                                
                                                
                                            }
                                        })
                                
                                )
                                .transition(.move(edge: .trailing))
                        }
                    }
                
                )
                .onChange(of: gestureoffset) { newValue in
                    
                    offset = gestureoffset
                }
            
            
        }
    }
    
    func getoffset(size : CGFloat)->CGFloat{
        
        
        let progress = offset / size
        
        let start : CGFloat = -80
        
        let progressWidth = (progress * 90) <= 90 ? (progress * 90) : 90
        
        let mainOffset = (start + progressWidth) < 0 ? (start + progressWidth) : 0
        
        return mainOffset
        
    }
    
    
    
}
