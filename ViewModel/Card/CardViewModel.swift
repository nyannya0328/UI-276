//
//  CardViewModel.swift
//  CardViewModel
//
//  Created by nyannyan0328 on 2021/08/02.
//

import SwiftUI

class CardViewModel: ObservableObject {
   @Published var selectdTab = "Setting"
    @Published var showDetail = false
    @Published var currentCard : Card?
}

