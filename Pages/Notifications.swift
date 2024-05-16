//
//  SwiftUIView.swift
//
//
//  Created by Astrian Zheng on 13/5/2024.
//

import SwiftUI

struct Notifications: View {
    @State private var showConfirmService = false
    var body: some View {
        NavigationView {
            List {
                Section {
                    VStack {
                        VStack(alignment: .leading) {
                            Text("Dear xxx,").padding(.bottom, 4)
                            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce quis sapien nunc. Quisque faucibus, odio at varius venenatis, velit eros ullamcorper odio, non posuere lacus eros nec tellus.")
                        }
                    }
                    Button {
                        self.showConfirmService = true
                    } label: {
                        Text("View detail...")
                    }
                } header: {
                    Text("Need your response")
                }
            }
            .navigationTitle("Notifications")
            .sheet(isPresented: self.$showConfirmService) {
                ConfirmService()
            }
        }
    }
}

#Preview {
    Notifications()
}
