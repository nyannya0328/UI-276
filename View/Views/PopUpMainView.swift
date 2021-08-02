//
//  PopUpMainView.swift
//  PopUpMainView
//
//  Created by nyannyan0328 on 2021/08/02.
//

import SwiftUI

struct PopUpMainView: View {
    
    @State var show = false
    @State var currentDay : Int = 0
    var body: some View {
        NavigationView{
            
            
            List{
                Section(header: Text("Tutolialas")) {
                    
                    
                    ForEach(1...15,id:\.self){index in
                        
                        
                        Button {
                            withAnimation{
                                
                                currentDay = index
                                
                                show.toggle()
                            }
                        } label: {
                            
                            
                            Text("Day\(index)of Swift UI")
                        }
                        .foregroundColor(.primary)

                        
                      
                    }
                }
            }
            .listStyle(.grouped)
            .navigationTitle("Pop Up")
            .fullswipPopup(show: $show) {
                List{
                    Section(header: Text("Day\(currentDay)")) {
                        
                        
                        ForEach(1...30,id:\.self){index in
                            
                            Text("Couse\(index)")
                        }
                        
                        
                       
                    }
                }
                .listStyle(.grouped)
                
                
            }
        }
    }
}

struct PopUpMainView_Previews: PreviewProvider {
    static var previews: some View {
        PopUpMainView()
    }
}
