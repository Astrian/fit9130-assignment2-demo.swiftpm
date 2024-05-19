//
//  Login.swift
//  fit9130-assignment2-demo
//
//  Created by Astrian Zheng on 13/5/2024.
//

import SwiftUI

struct Login: View {
    @State private var username = ""
    @FocusState private var usernameFocused: Bool
    @State private var showPassword = false
    @Binding var isPresented: Bool
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("loginbackground")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .ignoresSafeArea()
                    .offset(y: self.usernameFocused ? -100 : 0)
                    .animation(.easeInOut, value: self.usernameFocused)
                VStack {
                    Spacer()
                    VStack {
                        
                        if !self.usernameFocused {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("Welcome to").font(.headline)
                                    Text("MyCareConnect").font(.title).foregroundStyle(Color.accentColor)
                                }
                                Spacer()
                            }
                        }
                        
                        VStack {
                            HStack {
                                TextField("Username", text: self.$username)
                                    .font(.system(size: 30))
                                    .focused(self.$usernameFocused)
                                    .submitLabel(.continue)
                                    .onSubmit {
                                        if self.username != "" {
                                            self.showPassword = true
                                        }
                                    }
                                if self.usernameFocused {
                                    Button {
                                        if self.username != "" {
                                            self.showPassword = true
                                        }
                                    } label: {
                                        Image(systemName: "arrow.forward.circle").font(.system(size: 30))
                                    }
                                }
                            }
                            Rectangle().fill(self.usernameFocused ? Color.accentColor : Color.gray).frame(height: 2)
                        }
                        
                        if !self.usernameFocused {
                            
                            HStack {
                                Rectangle().fill(Color.gray.opacity(0.2)).frame(height: 2)
                                Text("OR").foregroundStyle(.gray)
                                Rectangle().fill(Color.gray.opacity(0.2)).frame(height: 2)
                            }.padding(.vertical, 20)
                            
                            Button {} label: {
                                HStack {
                                    Spacer()
                                    Image(systemName: "apple.logo")
                                    Text("Login with Apple")
                                    Spacer()
                                }
                                .padding(.vertical, 8)
                                .foregroundColor(.white)
                                .background(.black)
                                .cornerRadius(4)
                            }
                            
                            Button {} label: {
                                HStack {
                                    Spacer()
                                    Text("Register")
                                    Spacer()
                                }
                                .padding(.vertical, 8)
                                .foregroundColor(.white)
                                .background(Color.accentColor)
                                .cornerRadius(4)
                            }
                        }
                    }.padding(.bottom, self.usernameFocused ? 220 : 60)
                }.padding(.horizontal)
            }
            .navigationDestination(isPresented: self.$showPassword) {
                LoginPassword(username: self.$username, isPresented: self.$isPresented)
            }
        }
    }
}

#Preview {
    Login(isPresented: .constant(true))
}
