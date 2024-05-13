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
            HStack {
                HStack {
                    Button {
                        self.selection = 0
                    } label: {
                        if selection == 0 {
                            Image(systemName: "calendar.day.timeline.left")
                                .foregroundStyle(.tint)
                                
                        } else {
                            Image(systemName: "calendar.day.timeline.left")
                                .foregroundStyle(.gray)
                        }
                        
                    }.frame(width: 52)
                    
                    Button {
                        self.selection = 1
                    } label: {
                        if selection == 1 {
                            Image(systemName: "envelope.fill")
                                .foregroundStyle(.tint)
                        } else {
                            Image(systemName: "envelope.fill")
                                .foregroundStyle(.gray)
                        }
                    }.frame(width: 52)
                    
                    Button {
                        self.selection = 2
                    } label: {
                        if selection == 2 {
                            Image(systemName: "person.fill")
                                .foregroundStyle(.tint)
                        } else {
                            Image(systemName: "person.fill")
                                .foregroundStyle(.gray)
                        }
                    }.frame(width: 52)
                }
                
                Spacer()
                
                Button {
                    self.showAddTaskSheet.toggle()
                } label: {
                    Image(systemName: "plus")
                        .frame(width: 36, height: 36)
                        .foregroundStyle(.white)
                        .padding(.all, 8)
                }.background(.tint).clipShape(Circle()).shadow(radius: 2)
                
            }.padding(.vertical, 8).padding(.horizontal)
        }.frame(minWidth: 0, maxWidth: .infinity).background(.thinMaterial)
    }
}
