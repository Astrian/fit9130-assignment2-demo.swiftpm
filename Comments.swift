//
//  Comments.swift
//  
//
//  Created by Astrian Zheng on 19/5/2024.
//

import SwiftUI

struct Comments: View {
    @State var username: String
    @State var content: String
    @State var time: String
    @State var identity: String
    @State var image: String?
    
    var body: some View {
        HStack(alignment: .top) {
            Image("Avatar").resizable().frame(width: 40, height: 40).clipShape(Circle())
            VStack(spacing: 8) {
                
                HStack(alignment:.top) {
                    VStack(alignment: .leading) {
                        Text(self.username).bold().font(.system(.body, design: .rounded))
                        Text(self.identity).font(.callout).foregroundStyle(.gray)
                    }
                    Spacer()
                    Text(self.time).font(.callout).foregroundStyle(.gray)
                }
                
                HStack {
                    Text(self.content)
                    Spacer()
                }
                
                if self.image != nil {
                    HStack {
                        Image(self.image ?? "")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100, height: 100)
                            .clipped()
                            .cornerRadius(4)
                        Spacer()
                    }
                }
            }
        }.padding()
    }
}

#Preview {
    Comments(username: "Linda Sabastian", content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed dictum ipsum et lacinia finibus.", time: "3m", identity: "Volunteer", image: "Service Image - exercise")
}
