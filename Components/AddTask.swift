//
//  AddTask.swift
//  fit9130-assignment2-demo
//
//  Created by Astrian Zheng on 13/5/2024.
//

import SwiftUI

struct AddTask: View {
    var body: some View {
        NavigationView {
            Text("")
                .navigationTitle("Make a request")
        }
    }
}

#Preview {
    Text("Preview")
        .sheet(isPresented: .constant(true)) {
            AddTask().presentationDetents([.medium])
        }
}
