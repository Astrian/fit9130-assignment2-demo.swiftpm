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
            List {
                Section {
                    Picker(selection: .constant(1), label: Text("Service type")) {
                        Text("Cooking").tag(1)
                        Text("Sentitizing").tag(2)
                    }
                    TextField("Senior Name", text: .constant(""))
                    DatePicker("Request Time", selection: .constant(Date()))
                }
                Section {
                    Button{} label: {
                        Text("Book service")
                    }
                } footer: {
                    Text("Click to send booking message.")
                }
            }.navigationTitle("Assign Service").navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    Text("Preview")
        .sheet(isPresented: .constant(true)) {
            AddTask().presentationDetents([.medium])
        }
}
