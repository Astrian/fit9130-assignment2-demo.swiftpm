//
//  AddTask.swift
//  fit9130-assignment2-demo
//
//  Created by Astrian Zheng on 13/5/2024.
//

import SwiftUI

struct AddTask: View {
    @State private var serviceType = 1
    var body: some View {
        NavigationView {
            List {
                Section {
                    Picker(selection: self.$serviceType, label: EmptyView()) {
                        Text("Cooking").tag(1)
                        Text("Sentitizing").tag(2)
                        Text("Consulting").tag(3)
                    }.pickerStyle(.inline)
                }
                
                switch (self.serviceType) {
                case 1:
                    Section {
                        Picker(selection: .constant(1), label: EmptyView()) {
                            Text("Breakfast").tag(1)
                            Text("Launch").tag(2)
                            Text("Dinner").tag(3)
                        }
                        .pickerStyle(.inline)
                    } header: {
                        Text("Cooking service type")
                    }
                case 2:
                    EmptyView()
                case 3:
                    EmptyView()
                default:
                    EmptyView()
                }
                
                Section {
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
            AddTask().presentationDetents([.medium, .large])
        }
}
