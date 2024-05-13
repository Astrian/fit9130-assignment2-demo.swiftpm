//
//  CustomTab.swift
//  fit9130-assignment2-demo
//
//  Created by Astrian Zheng on 13/5/2024.
//

import SwiftUI

struct CustomTab: View {
    @Binding var selection: Int
    @Binding var showAddTaskSheet: Bool
    
    var body: some View {
        VStack {
            Divider()
            HStack {
                HStack {
                    Button {
                        self.selection = 0
                    } label: {
                        if selection == 0 {
                            Image(systemName: "calendar.day.timeline.left")
                                .font(Font(UIFont.systemFont(ofSize: 18)))
                                .foregroundStyle(.tint)
                                
                        } else {
                            Image(systemName: "calendar.day.timeline.left")
                                .font(Font(UIFont.systemFont(ofSize: 18)))
                                .foregroundStyle(.gray)
                        }
                        
                    }.frame(width: 52)
                    
                    Button {
                        self.selection = 1
                    } label: {
                        if selection == 1 {
                            ZStack {
                                Image(systemName: "bell.fill")
                                    .font(Font(UIFont.systemFont(ofSize: 18)))
                                    .foregroundStyle(.tint)
                            }
                        } else {
                            ZStack {
                                Image(systemName: "bell.badge.fill")
                                    .renderingMode(.template)
                                    .foregroundStyle(.tint, .gray)
                                    .font(Font(UIFont.systemFont(ofSize: 18)))
                                    
                            }
                        }
                    }.frame(width: 52)
                    
                    Button {
                        self.selection = 2
                    } label: {
                        if selection == 2 {
                            Image(systemName: "person.fill")
                                .font(Font(UIFont.systemFont(ofSize: 18)))
                                .foregroundStyle(.tint)
                        } else {
                            Image(systemName: "person.fill")
                                .font(Font(UIFont.systemFont(ofSize: 18)))
                                .foregroundStyle(.gray)
                        }
                    }.frame(width: 52)
                }
                
                Spacer()
                
                Button {
                    self.showAddTaskSheet.toggle()
                } label: {
                    Image(systemName: "plus")
                        .frame(width: 28, height: 28)
                        .foregroundStyle(.white)
                        .padding(.all, 8)
                }.background(.tint).clipShape(Circle()).shadow(radius: 2)
                
            }.padding(.vertical, 2).padding(.horizontal)
        }.frame(minWidth: 0, maxWidth: .infinity).background(.regularMaterial)
    }
}
