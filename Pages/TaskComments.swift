//
//  SwiftUIView.swift
//  
//
//  Created by Astrian Zheng on 17/5/2024.
//

import SwiftUI

struct TaskComments: View {
    var body: some View {
        ZStack {
            List {
                HStack(alignment: .top) {
                    Image("Avatar").resizable().frame(width: 50, height: 50).clipShape(Circle())
                    VStack {
                        HStack(alignment: .top) {
                            VStack(alignment: .leading) {
                                Text("Name").bold()
                                Text("Volunteer").font(.callout).foregroundColor(.gray)
                            }
                            Spacer()
                            Text("3m").font(.callout).foregroundStyle(.gray)
                        }
                        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce quis sapien nunc. Quisque faucibus, odio at varius venenatis, velit eros ullamcorper odio, non posuere lacus eros nec tellus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed at risus augue. ").padding(.top, 4)
                    }
                }
            }.listStyle(.inset)
            
            VStack {
                Spacer()
                VStack {
                    Divider()
                    HStack{
                        TextField("Add comment...", text: .constant(""))
                            .padding(.horizontal, 12)
                            .padding(.vertical, 8)
                            .background(.white.opacity(0.7))
                            .clipShape(Capsule())
                            .padding()
                    }
                }.frame(minWidth: 0, maxWidth: .infinity).background(.regularMaterial)
            }
        }
        .navigationTitle("Comments")
    }
}

#Preview {
    NavigationView {
        TaskComments()
    }
}
