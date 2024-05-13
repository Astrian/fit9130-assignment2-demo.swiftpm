//
//  SwiftUIView.swift
//
//
//  Created by Astrian Zheng on 13/5/2024.
//

import SwiftUI

struct RequestCardAtToday: View {
    @State var requestTitle: String
    @State var requestTime: String
    var body: some View {
        ZStack {
            HStack {
                VStack(alignment: .leading) {
                    Text(self.requestTitle).bold()
                    Text(self.requestTime)
                        .foregroundColor(.gray)
                        .font(.caption)
                }
                Spacer()
            }
                .padding()
                .frame(minWidth: 0, maxWidth: .infinity)
                .background()
                .cornerRadius(4)
                .shadow(color: Color.black.opacity(0.2), radius: 2, x:0, y:1)
                .padding(.horizontal)
        }
    }
}

#Preview {
    RequestCardAtToday(requestTitle: "Request", requestTime: "4:00 pm")
}
