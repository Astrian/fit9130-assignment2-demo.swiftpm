//
//  SwiftUIView.swift
//  
//
//  Created by Astrian Zheng on 18/5/2024.
//

import SwiftUI

struct LoginPassword: View {
    @Binding var username: String
    @Binding var isPresented: Bool
    @FocusState private var passwordFocused: Bool
    @State private var password = ""
    
    var body: some View {
        VStack {
            HStack (spacing: 12) {
                Image("Avatar")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                VStack(alignment: .leading) {
                    Text("Welcome").font(.headline)
                    Text(self.username).font(.title)
                }
                Spacer()
            }
            VStack {
                
                HStack {
                    SecureField("Password", text: self.$password)
                        .focused(self.$passwordFocused)
                        .font(.system(size: 30))
                        .submitLabel(.continue)
                }
                Rectangle().fill(self.passwordFocused ? Color.accentColor : Color.gray).frame(height: 2)
            }
            HStack {
                Button{} label: {
                    Text("I need help")
                }
                Spacer()
            }.padding(.top)
            Spacer()
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button{
                    withAnimation {
                        self.isPresented = false
                        UIApplication.shared.endEditing()
                    }
                } label: {
                    Text("Login")
                }.disabled(self.password == "")
            }
        }
            .padding()
            .navigationTitle("Password")
            .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        LoginPassword(username: .constant("User"), isPresented: .constant(true))
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
