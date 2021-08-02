//
//  Event.swift
//  Event
//
//  Created by nyannyan0328 on 2021/08/02.
//

import SwiftUI

let colors : [Color] = [.red,.green,.orange,.purple,.yellow]

struct Event: Identifiable {
    var id = UUID().uuidString
    var date : String
    var timing : String
    var title : String
    
    var randam = colors.randomElement() ?? .red
    
    
   
}

var events : [Event] = [
    
    Event(date: "Jul 19", timing: "1:20 - 3:30", title: "Hunt"),
    Event(date: "Jul 20", timing: "8:00 - 19:00", title: "Walking"),
    Event(date: "Jul 21", timing: "19:00 - 5:00", title: "Sleep"),
    Event(date: "Jul 22", timing: "12:00 - 14:00", title: "Nap"),
    Event(date: "Jul 24", timing: "7:00 - 8:00", title: "Eat"),
    Event(date: "Jul 25", timing: "9:00 - 10:00", title: "Nap"),
   



]

