//
//  SwiftUIView.swift
//
//
//  Created by Astrian Zheng on 13/5/2024.
//

import SwiftUI

struct ServiceDetail: View {
    @State private var sericeType: DiaryType? = nil
    
    var body: some View {
        List {
            Section {
                VStack(alignment: .leading) {
                    Text("Service no.").font(.callout).bold()
                    Text("1234567890")
                }
                VStack(alignment: .leading) {
                    Text("Service type").font(.callout).bold()
                    Text("Cooking")
                }
                VStack(alignment: .leading) {
                    Text("Schduled time").font(.callout).bold()
                    Text("18 May 2024 4:00 pm")
                }
            }
            
            Section {
                HStack(alignment: .top) {
                    Image("Avatar")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Jazmine Winters").bold()
                        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit.")
                        Text("Volunteer no. 1234567").foregroundStyle(.gray).font(.caption)
                    }
                }
            } header: {
                Text("Volunteer detail")
            }
            
            Section {
                NavigationLink(destination: Diary(diaryType: .exercise)) {
                    Text("View diary")
                }
            }
        } .navigationTitle("Service detail")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                self.sericeType = self.getRandomDiaryType()
            }
    }
    
    func getRandomDiaryType() -> DiaryType {
        let allCases: [DiaryType] = [.exercise, .cooking]  // 手动创建枚举值数组
        let randomIndex = Int.random(in: 0..<allCases.count)
        return allCases[randomIndex]
    }
}
