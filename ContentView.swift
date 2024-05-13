import SwiftUI

struct ContentView: View {
    @State private var selection = 0
    @State private var showAddTaskSheet = false
    @State private var showTab = true
    
    var body: some View {
        ZStack {
            Group {
                switch (selection) {
                case 0:
                    Today(showTab: self.$showTab)
                case 1:
                    Notifications()
                case 2:
                    Text("Profile")
                default:
                    Text("error")
                }
            }
            
            VStack {
                Spacer()
                CustomTab(selection: $selection, showAddTaskSheet: $showAddTaskSheet)
                    .offset(y: self.showTab ? 0 : 100)
                    .animation(.easeInOut, value: self.showTab)
            }
        }
        .sheet(isPresented: $showAddTaskSheet) {
            AddTask()
                .presentationDetents([.medium])
        }
    }
}
