//
//  Signup.swift
//  fit9130-assignment2-demo
//
//  Created by Astrian Zheng on 13/5/2024.
//

import SwiftUI

struct Signup: View {
    @State private var accountType = 0
    var body: some View {
            List {
                Picker("Register as...", selection: $accountType) {
                    VStack(alignment: .leading){
                        Text("Senior").bold()
                        Text("Recive help from volunteers").font(.callout)
                    }.tag(0)
                    
                    VStack(alignment: .leading){
                        Text("Volunteer").bold()
                        Text("Provide help to seniors").font(.callout)
                    }.tag(1)
                }.pickerStyle(.inline)
                
                if accountType == 0 {
                    Section {
                        TextField("Email Address", text: .constant(""))
                        TextField("Full Name", text: .constant(""))
                    }
                } else {
                    Section {
                        Text("fields for volunteer...")
                    }
                }
            }
            
            .navigationTitle("Register")
        }
}

#Preview {
    NavigationView {
        Signup()
    }
}
