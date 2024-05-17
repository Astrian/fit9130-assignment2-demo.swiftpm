//
//  SwiftUIView.swift
//
//
//  Created by Astrian Zheng on 13/5/2024.
//

import SwiftUI

struct Diary: View {
    var body: some View {
        List {
            Section {
                VStack(alignment: .leading) {
                    Text("Request no.").font(.callout).bold()
                    Text("1234567890")
                }
                VStack(alignment: .leading) {
                    Text("Service time").font(.callout).bold()
                    Text("18th May 2024 4:00 pm")
                }
            }
            
            Section {
                VStack(alignment: .leading) {
                    Text("18th May 2024 4:20 pm").bold().padding(.bottom, 4)
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce quis sapien nunc. Quisque faucibus, odio at varius venenatis, velit eros ullamcorper odio, non posuere lacus eros nec tellus. ")
                }
                
                Button{} label: {
                    Text("Add a log")
                }
                
            } header: {
                Text("Service detail")
            }
            
            Section {
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce quis sapien nunc. Quisque faucibus, odio at varius venenatis, velit eros ullamcorper odio, non posuere lacus eros nec tellus. ")
            } header: {
                Text("Health Comment")
            }
            
            Section {
                HStack {
                    Image("Service Image")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                    Text("file.png")
                }
                
                Button{} label: {
                    Text("Add an attachment")
                }
                
            } header: {
                Text("Attactments")
            }
            
            Section {
                NavigationLink(destination: TaskComments()) {
                    Text("Comments")
                }
            }
        }
            .navigationTitle("Diary")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button{} label: {
                        Image(systemName: "square.and.arrow.up")
                    }
                }
            }
    }
}

#Preview {
    NavigationView{
        Diary()
    }
}
