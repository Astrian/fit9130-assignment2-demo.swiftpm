import SwiftUI

struct ContentView: View {
    @State private var selection = 0
    @State private var showAddTaskSheet = false
  
    var body: some View {
        ZStack {
            Group {
                switch (selection) {
                case 0:
                    Today()
                case 1:
                    Text("message")
                case 2:
                    Text("Profile")
                default:
                    Text("error")
                }
            }
            
            VStack {
                Spacer()
                CustomTab(selection: $selection, showAddTaskSheet: $showAddTaskSheet)
            }
        }
        .sheet(isPresented: $showAddTaskSheet) {
            AddTask()
                .presentationDetents([.medium])
        }
    }
}
