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
                        
                    }
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
