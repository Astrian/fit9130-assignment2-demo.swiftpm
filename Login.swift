//
//  Login.swift
//  fit9130-assignment2-demo
//
//  Created by Astrian Zheng on 13/5/2024.
//

import SwiftUI

struct Login: View {
    @State private var username = ""
    @State private var password = ""
    var body: some View {
        List {
          Section {
            VStack(alignment: .leading) {
              Text("Welcome to").font(.title)
              Text("MyHealthConnect").font(.largeTitle)
            }
          }.listRowBackground(Color.clear)
          Section {
            VStack {
              Image("Avatar")
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
            }
          }.listRowBackground(Color.clear)
          Section {
            TextField("Username", text: $username)
            SecureField("Password", text: $password)
          }
        
            Section {
                Text("Not a member? [Sign Up here](https://zzz)")
            }
        }
    }
}

#Preview {
    Login()
}
