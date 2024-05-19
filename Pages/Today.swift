//
//  Home.swift
//  fit9130-assignment2-demo
//
//  Created by Astrian Zheng on 13/5/2024.
//

import SwiftUI

struct Today: View {
    @Binding var showTab: Bool
    @State private var showDetailExercise = false
    @State private var showDetailCooking = false
    @State private var showQuickSettings = false
    @State private var aer = false
    
    var body: some View {
        if #available(iOS 17.0, *) {
            NavigationStack {
                    ZStack {
                        Color("ListBackground").edgesIgnoringSafeArea(.all)
                        ScrollView {
                            VStack {
                                VStack {
                                    HStack {
                                        Text("Quick Settings")
                                            .textCase(.uppercase)
                                            .foregroundColor(.gray)
                                            .font(.caption)
                                            .padding(.horizontal)
                                        Spacer()
                                    }
                                    Toggle("Automatally entry requests", isOn: self.$aer)
                                        .padding()
                                        .background()
                                        .cornerRadius(4)
                                        .shadow(color: Color.black.opacity(0.2), radius: 2, x:0, y:1)
                                    HStack {
                                        Text("When this toggle on, your requests will be autmatcally entried.")
                                            .foregroundColor(.gray)
                                            .font(.caption)
                                            .padding(.horizontal)
                                        Spacer()
                                    }
                                }.padding(.horizontal)
                                Divider().padding()
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
                                            self.showDetailExercise = true
                                        }
                                    RequestCardAtToday(requestTitle: "Face-to-face consultation", requestTime: "4:00 pm")
                                        .onTapGesture {
                                            self.showTab = false
                                            self.showDetailExercise = true
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
                                            self.showDetailExercise = true
                                        }
                                    RequestCardAtToday(requestTitle: "Customize service", requestTime: "18th May")
                                        .onTapGesture {
                                            self.showTab = false
                                            self.showDetailExercise = true
                                        }
                                    RequestCardAtToday(requestTitle: "Cooking", requestTime: "29th May")
                                        .onTapGesture {
                                            self.showTab = false
                                            self.showDetailCooking = true
                                        }
                                    
                                    Button{} label: {
                                        HStack {
                                            Image(systemName: "list.bullet.below.rectangle")
                                            Text("See more upcoming requests")
                                            Spacer()
                                        }.padding().padding(.horizontal)
                                    }
                                }
                                
                            }.padding(.bottom, 80)
                        }
                    }
                    .onChange(of: self.showDetailExercise) {
                        self.showTab = !self.showDetailExercise
                    }
                    .onChange(of: self.showDetailCooking) {
                        self.showTab = !self.showDetailCooking
                    }
                    .navigationDestination(isPresented: self.$showDetailExercise) {
                        ServiceDetail(sericeType: .exercise)
                    }
                    .navigationDestination(isPresented: self.$showDetailCooking) {
                        ServiceDetail(sericeType: .cooking)
                    }
                    .navigationTitle("Today")
                }
        } else {
            // Fallback on earlier versions
            Text("placeholder")
        }
    }
}
