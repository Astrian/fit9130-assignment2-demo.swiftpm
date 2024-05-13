//
//  Home.swift
//  fit9130-assignment2-demo
//
//  Created by Astrian Zheng on 13/5/2024.
//

import SwiftUI

struct Today: View {
    var body: some View {
        NavigationView {
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
                            NavigationLink(destination: ServiceDetail()) {
                                RequestCardAtToday(requestTitle: "Care sequence", requestTime: "11:00 am")
                            }
                            NavigationLink(destination: ServiceDetail()) {
                                RequestCardAtToday(requestTitle: "Face-to-face consultation", requestTime: "4:00 pm")
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
                            NavigationLink(destination: ServiceDetail()) {
                                RequestCardAtToday(requestTitle: "Volunteer evaluating", requestTime: "3 days later")
                            }
                            NavigationLink(destination: ServiceDetail()) {
                                RequestCardAtToday(requestTitle: "Customize service", requestTime: "18th May")
                            }
                            NavigationLink(destination: ServiceDetail()) {
                                RequestCardAtToday(requestTitle: "Cooking", requestTime: "29th May")
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
                .navigationTitle("Today")
        }
    }
}

#Preview {
    Today()
}
