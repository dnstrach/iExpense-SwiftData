//
//  View-ExpenseStyle.swift
//  iExpense+SwiftData
//
//  Created by Dominique Strachan on 12/21/23.
//

import SwiftUI

extension View {
    func style(for item: ExpenseItem) -> some View {
        if item.amount < 50 {
            return self.foregroundColor(Color("Light"))
        } else if item.amount < 100 {
            return self.foregroundColor(Color("Mid"))
        } else {
            return self.foregroundColor(Color("Dark"))
        }
    }
}
