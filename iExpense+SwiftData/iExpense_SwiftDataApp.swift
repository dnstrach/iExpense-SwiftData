//
//  iExpense_SwiftDataApp.swift
//  iExpense+SwiftData
//
//  Created by Dominique Strachan on 12/20/23.
//

import SwiftUI

@main
struct iExpense_SwiftDataApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: ExpenseItem.self)
    }
}
