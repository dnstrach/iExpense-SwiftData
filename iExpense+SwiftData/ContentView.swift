//
//  ContentView.swift
//  iExpense+SwiftData
//
//  Created by Dominique Strachan on 12/20/23.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    //@State private var expenses = Expenses()
    @State private var showingAddExpense = false
    @State private var expenseType = "All"
    
    @State private var sortOrder = [
        SortDescriptor(\ExpenseItem.name),
        SortDescriptor(\ExpenseItem.amount)
    ]
    
    var body: some View {
        NavigationStack {
            ExpensesList(type: expenseType, sortOrder: sortOrder)
//            List {
//                ExpensesList(title: "Business", expenses: expenses.businessItems, deleteItems: removeBusinessItems)
//                ExpensesList(title: "Personal", expenses: expenses.personalItems, deleteItems: removePersonalItems)
//            }
            .navigationTitle("iExpense")
            .toolbar {
                Button("Add Expense", systemImage: "plus") {
                    showingAddExpense = true
                }

                Menu("Filter", systemImage: "line.3.horizontal.decrease.circle") {
                    Picker("Filter", selection: $expenseType) {
                        Text("Show All Expenses")
                            .tag("All")

                        Divider()

                        ForEach(AddView.types, id: \.self) { type in
                            Text(type)
                                .tag(type)
                        }
                    }
                }

                Menu("Sort", systemImage: "arrow.up.arrow.down") {
                    Picker("Sort By", selection: $sortOrder) {
                        Text("Name (A-Z)")
                            .tag([
                                SortDescriptor(\ExpenseItem.name),
                                SortDescriptor(\ExpenseItem.amount),
                            ])

                        Text("Name (Z-A)")
                            .tag([
                                SortDescriptor(\ExpenseItem.name, order: .reverse),
                                SortDescriptor(\ExpenseItem.amount),
                            ])

                        Text("Amount (Cheapest First)")
                            .tag([
                                SortDescriptor(\ExpenseItem.amount),
                                SortDescriptor(\ExpenseItem.name)
                            ])

                        Text("Amount (Most Expensive First)")
                            .tag([
                                SortDescriptor(\ExpenseItem.amount, order: .reverse),
                                SortDescriptor(\ExpenseItem.name)
                            ])
                    }
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView()
                // AddView(expenses: expenses)
            }
        }
    }
    
//    func removeItems(at offsets: IndexSet, in inputArray: [ExpenseItem]) {
//        var objectsToDelete = IndexSet()
//        
//        for offset in offsets {
//            let item = inputArray[offset]
//            
//            if let index = expenses.items.firstIndex(of: item) {
//                objectsToDelete.insert(index)
//            }
//        }
//        
//        expenses.items.remove(atOffsets: objectsToDelete)
//    }
//    
//    func removePersonalItems(at offsets: IndexSet) {
//        removeItems(at: offsets, in: expenses.personalItems)
//    }
//    
//    func removeBusinessItems(at offsets: IndexSet) {
//        removeItems(at: offsets, in: expenses.businessItems)
//    }
}

#Preview {
    ContentView()
        .modelContainer(for: ExpenseItem.self)
}
