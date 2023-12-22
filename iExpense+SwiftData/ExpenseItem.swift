//
//  ExpenseItem.swift
//  iExpense+SwiftData
//
//  Created by Dominique Strachan on 12/21/23.
//

import SwiftUI
import SwiftData

@Model
class ExpenseItem /*Identifiable, Codable, Equatable*/ {
   // var id = UUID()
    let name: String
    let type: String
    let amount: Double
    
    init(name: String, type: String, amount: Double) {
        self.name = name
        self.type = type
        self.amount = amount
    }
}
