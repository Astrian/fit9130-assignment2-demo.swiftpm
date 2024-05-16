//
//  Home.swift
//  fit9130-assignment2-demo
//
//  Created by Astrian Zheng on 13/5/2024.
//

import SwiftUI

struct Today: View {
    @Binding var showTab: Bool
    @State private var showDetail = false
    
    var body: some View {
        if #available(iOS 17.0, *) {
            NavigationStack {
                    ZStack {
                        Color("ListBackground").edgesIgnoringSafeArea(.all)
                        ScrollView {
                            VStack {
                                Group {
                                    HStack {
                                        Text("Upcoming Requests at Today")
                                            .textCase(.uppercase)
                                            .foregroundColor(.gray)
                                            .font(.caption)
                                            .padding(.horizontal)
                                        Spacer()
                                    }.padding(.horizontal).padding(.top)
                                    RequestCardAtToday(requestTitle: "Care sequence", requestTime: "11:00 am")
                                        .onTapGesture {
                                            self.showTab = false
                                            self.showDetail = true
                                        }
                                    RequestCardAtToday(requestTitle: "Face-to-face consultation", requestTime: "4:00 pm")
                                        .onTapGesture {
                                            self.showTab = false
                                            self.showDetail = true
                                        }
                                }
                                Divider().padding()
                                Group {
                                    HStack {
                                        Text("Future Requests")
                                            .textCase(.uppercase)
                                            .foregroundColor(.gray)
                                            .font(.caption)
                                            .padding(.horizontal)
                                        Spacer()
                                    }.padding(.horizontal)
                                    RequestCardAtToday(requestTitle: "Volunteer evaluating", requestTime: "3 days later")
                                        .onTapGesture {
                                            self.showTab = false
                                            self.showDetail = true
                                        }
                                    RequestCardAtToday(requestTitle: "Customize service", requestTime: "18th May")
                                        .onTapGesture {
                                            self.showTab = false
                                            self.showDetail = true
                                        }
                                    RequestCardAtToday(requestTitle: "Cooking", requestTime: "29th May")
                                        .onTapGesture {
                                            self.showTab = false
                                            self.showDetail = true
                                        }
                                    
                                    Button{} label: {
                                        HStack {
                                            Image(systemName: "list.bullet.below.rectangle")
                                            Text("See more upcoming requests")
                                            Spacer()
                                        }.padding().padding(.horizontal)
                                    }
                                }
                                
                            }
                        }
                    }
                    .onChange(of: self.showDetail) {
                        self.showTab = !self.showDetail
                    }
                    .navigationDestination(isPresented: self.$showDetail) {
                        ServiceDetail()
                    }
                    .navigationTitle("Today")
                }
        } else {
            // Fallback on earlier versions
            Text("placeholder")
        }
    }
}

