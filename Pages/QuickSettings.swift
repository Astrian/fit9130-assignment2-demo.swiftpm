//
//  SwiftUIView.swift
//  
//
//  Created by Astrian Zheng on 18/5/2024.
//

import SwiftUI

struct QuickSettings: View {
    var body: some View {
        NavigationStack {
            List{
                Section {
                    Toggle("Automatally entry requests", isOn: .constant(false))
                } footer: {
                    Text("When this toggle on, the")
                }
            }.navigationTitle("Quick Settings")
        }.presentationDetents([.medium])
    }
}

#Preview {
        
    QuickSettings()
}
