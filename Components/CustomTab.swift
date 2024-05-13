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
                    Spacer()
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
                        
                    }
                    Spacer()
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
                    }
                    Spacer()
                }
                
                Button {
                    self.showAddTaskSheet.toggle()
                } label: {
                    Image(systemName: "plus")
                        .frame(width: 24, height: 24)
                        .foregroundStyle(.white)
                        .padding(.all, 8)
                }.background(.tint).clipShape(Circle())
                
                HStack {
                    Spacer()
                    Button {
                        self.selection = 2
                    } label: {
                        if selection == 2 {
                            Image(systemName: "list.bullet.rectangle.portrait.fill")
                                .foregroundStyle(.tint)
                        } else {
                            Image(systemName: "list.bullet.rectangle.portrait.fill")
                                .foregroundStyle(.gray)
                        }
                    }
                    Spacer()
                    Button {
                        self.selection = 3
                    } label: {
                        if selection == 3 {
                            Image(systemName: "person.fill")
                                .foregroundStyle(.tint)
                        } else {
                            Image(systemName: "person.fill")
                                .foregroundStyle(.gray)
                        }
                    }
                    Spacer()
                }
            }.padding(.vertical, 8)
        }.frame(minWidth: 0, maxWidth: .infinity).background(.thinMaterial)
    }
}
