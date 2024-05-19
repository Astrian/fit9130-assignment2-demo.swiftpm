//
//  SwiftUIView.swift
//
//
//  Created by Astrian Zheng on 14/5/2024.
//

import SwiftUI

struct Profile: View {
    @Binding var showTab: Bool
    @State private var showEditProfile = false
    
    var body: some View {
        if #available(iOS 17.0, *) {
            NavigationStack {
                List {
                    Section {
                        HStack {
                            HStack {
                                Image("Avatar").resizable().frame(width: 50, height: 50).clipShape(Circle())
                                VStack(alignment: .leading) {
                                    Text("Christine Taylor").foregroundStyle(.foreground).bold()
                                    Text("Senior").foregroundStyle(.gray)
                                }
                            }
                            Spacer()
                            Image(systemName: "chevron.right").foregroundColor(.gray)
                        }.onTapGesture {
                            self.showEditProfile = true
                        }
                    }
                    
                    Section {
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("64").font(.system(size: 26, design: .rounded)).foregroundStyle(Color.accentColor)
                                    Text("Age").font(.caption)
                                }
                                Spacer()
                            }
                            
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("F").font(.system(size: 26, design: .rounded)).foregroundStyle(Color.accentColor)
                                    Text("Sex").font(.caption)
                                }
                                Spacer()
                            }
                            
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("VIC").font(.system(size: 26, design: .rounded)).foregroundStyle(Color.accentColor)
                                    Text("Location").font(.caption)
                                }
                                Spacer()
                            }
                            
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("231").font(.system(size: 26, design: .rounded)).foregroundStyle(Color.accentColor)
                                    Text("Days in HCC").font(.caption)
                                }
                                Spacer()
                            }
                            
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("1,021").font(.system(size: 26, design: .rounded)).foregroundStyle(Color.accentColor)
                                    Text("Reuests").font(.caption)
                                }
                                Spacer()
                            }
                        }
                    } header: {
                        Text("Basic information")
                    }
                        
                    Section {
                        HStack {
                            Text("Weight")
                            Spacer()
                            Text("64kg").foregroundStyle(.gray)
                        }
                        
                        HStack {
                            Text("Height")
                            Spacer()
                            Text("162cm").foregroundStyle(.gray)
                        }
                        
                        HStack {
                            Text("Blood type")
                            Spacer()
                            Text("O").foregroundStyle(.gray)
                        }
                    } header: {
                        Text("Body health")
                    }
                    
                    Section {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Lorem ipsum").bold().font(.system(.title3, design: .rounded))
                            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris congue rhoncus porta. Morbi bibendum dui felis, id semper erat euismod ut. Nam scelerisque, urna et mollis mollis, ipsum tortor ornare mauris, vel aliquet arcu quam porttitor nibh.")
                        }
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Lorem ipsum").bold().font(.system(.title3, design: .rounded))
                            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris congue rhoncus porta. Morbi bibendum dui felis, id semper erat euismod ut. Nam scelerisque, urna et mollis mollis, ipsum tortor ornare mauris, vel aliquet arcu quam porttitor nibh.")
                        }
                    } header: {
                        Text("Medical history")
                    }
                    
                    Section{
                        Text("")
                    }.listRowBackground(Color.clear)
                }
                .onChange(of: self.showEditProfile) {
                    self.showTab = !self.showEditProfile
                }
                .navigationDestination(isPresented: self.$showEditProfile) {
                    Text("Profile Edit")
                }
                .navigationTitle("Profile")
            }
        } else {
            Text("Placeholder")
        }
    }
}

#Preview {
    Profile(showTab: .constant(false))
}
