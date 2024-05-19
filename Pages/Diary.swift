//
//  SwiftUIView.swift
//
//
//  Created by Astrian Zheng on 13/5/2024.
//

import SwiftUI
import Charts

enum DiaryType {
    case exercise
    case cooking
}

struct Diary: View {
    @State var diaryType: DiaryType
    @State private var heartbeats = heartbeatSim(startHeartbeat: 75, peakHeartbeat: 120, endHeartbeat: 86)
    
    var body: some View {
        ScrollView {
            VStack {
                Group {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Service").font(.system(.body, design: .rounded))
                            switch self.diaryType {
                            case .exercise:
                                Text("Excerise").font(.system(.title, design: .rounded)).bold()
                            case .cooking:
                                Text("Cooking").font(.system(.title, design: .rounded)).bold()
                            }
                            
                        }
                        Spacer()
                        
                        switch self.diaryType {
                        case .exercise:
                            Image(systemName: "figure.run.circle")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 60)
                                .foregroundColor(.accentColor)
                        case .cooking:
                            Image(systemName: "fork.knife.circle")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 60)
                                .foregroundColor(.accentColor)
                        }
                        
                    }
                    .padding(.vertical)
                    
                    VStack {
                        HStack {
                            Text("Overview")
                                .font(.callout)
                                .textCase(.uppercase)
                                .foregroundColor(.gray)
                                .padding(.horizontal)
                            Spacer()
                        }
                        
                        switch (self.diaryType) {
                        case .exercise:
                            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 2) {
                                HStack {
                                    VStack(alignment: .leading) {
                                        Text("12,723").font(.system(size: 26, design: .rounded)).foregroundStyle(Color.accentColor)
                                        Text("Steps").font(.caption)
                                    }
                                    Spacer()
                                }
                                HStack {
                                    VStack(alignment: .leading) {
                                        Text("1.2km").font(.system(size: 26, design: .rounded)).foregroundStyle(Color.accentColor)
                                        Text("Range").font(.caption)
                                    }
                                    Spacer()
                                }
                                HStack {
                                    VStack(alignment: .leading) {
                                        Text("75").font(.system(size: 26, design: .rounded)).foregroundStyle(Color.accentColor)
                                        Text("Avg. heart bpm").font(.caption)
                                    }
                                    Spacer()
                                }
                            }.padding()
                            .background()
                            .cornerRadius(4)
                        case .cooking:
                            VStack(spacing: 16) {
                                HStack {
                                    VStack(alignment: .leading) {
                                        Text("11 May 2024").font(.system(size: 26, design: .rounded)).foregroundStyle(Color.accentColor)
                                        Text("Time").font(.caption)
                                    }
                                    Spacer()
                                }
                                HStack {
                                    VStack(alignment: .leading) {
                                        Text("Launch").font(.system(size: 26, design: .rounded)).foregroundStyle(Color.accentColor)
                                        Text("Meal type").font(.caption)
                                    }
                                    Spacer()
                                }
                                HStack {
                                    VStack(alignment: .leading) {
                                        Text("15’ 24”").font(.system(size: 26, design: .rounded)).foregroundStyle(Color.accentColor)
                                        Text("Duration").font(.caption)
                                    }
                                    Spacer()
                                }
                            }.padding()
                                .background()
                                .cornerRadius(4)
                        }
                    }.padding(.bottom)
                    
                    switch (self.diaryType) {
                    case .exercise:
                        VStack {
                            HStack {
                                Text("Heart rate information")
                                    .font(.callout)
                                    .textCase(.uppercase)
                                    .foregroundColor(.gray)
                                    .padding(.horizontal)
                                Spacer()
                            }
                            
                            VStack {
                                Chart(self.heartbeats) {
                                    BarMark(
                                        x: .value("Minute after exercise", $0.id),
                                        yStart: .value("Max heart beats", $0.max),
                                        yEnd: .value("Min heart beats", $0.min)
                                    )
                                }
                            }
                            .padding()
                            .background()
                            .cornerRadius(4)
                        }.padding(.bottom)
                        
                    case .cooking:
                        EmptyView()
                    }
                    
                    VStack {
                        Button {} label: {
                            HStack {
                                Label("More insights", systemImage: "doc.text.magnifyingglass")
                                Spacer()
                            }
                        }.padding().background().cornerRadius(4)
                    }
                    
                }
                
                Divider().padding(.vertical)
                
                Group {
                    HStack {
                        Text("Comments & notes")
                            .font(.callout)
                            .textCase(.uppercase)
                            .foregroundColor(.gray)
                            .padding(.horizontal)
                        Spacer()
                    }
                    
                    VStack {
                        Comments(username: "Linda Sabastian", content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed dictum ipsum et lacinia finibus.", time: "3m", identity: "Volunteer", image: self.diaryType == .exercise ? "Service Image - exercise" : "Service Image - Cooking")
                        Divider().padding(.leading).padding(.leading, 40)
                        Comments(username: "Linda Sabastian", content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed dictum ipsum et lacinia finibus.", time: "3m", identity: "Family member", image: nil)
                        Divider().padding(.leading).padding(.leading, 40)
                        Comments(username: "Linda Sabastian", content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed dictum ipsum et lacinia finibus.", time: "3m", identity: "Senior", image: nil)
                    }.background().cornerRadius(4)
                    
                    HStack {
                        Image("Avatar").resizable().frame(width: 40, height: 40).clipShape(Circle())
                        TextField("Add comments...", text: .constant(""))
                    }.padding().background().cornerRadius(4)
                }
                
            }.padding(.horizontal)
            Spacer()
        }
        .background(Color("ListBackground"))
            .navigationTitle("Diary")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button{} label: {
                        Image(systemName: "square.and.arrow.up")
                    }
                }
            }
    }
}

#Preview {
    NavigationView{
        Diary(diaryType: .cooking)
    }
}
