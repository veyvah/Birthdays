//
//  ContentView.swift
//  Birthdays
//
//  Created by Scholar on 8/8/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Query private var friends: [friend]
    @Environment(\.modelContext) private var context
    @State private var newName = ""
    @State private var newBirthday = Date.now
    
    
    
    var body: some View {
        NavigationStack {
            
            
            List(friends) {friend in
                HStack {
                    Text(friend.name)
                    Spacer()
                    Text(friend.birthday, format:
                            .dateTime.month(.wide)
                            .day().year())
                }
            }
            
            .navigationTitle("Birthdays")
            .safeAreaInset(edge: .bottom) {
                VStack {
                    Text("New Birthday")
                        .font(.headline)
                    DatePicker(selection: $newBirthday, in: Date.distantPast...Date.now, displayedComponents: .date) {
                        TextField("Name", text: $newName)
                            .textFieldStyle(.roundedBorder)
                    }
                    Button("save") {
                        let newFriend = friend(name: newName, birthday: newBirthday)
                        context.insert(newFriend)
                    }
                    .bold()
                }
                .padding()
                .background(.bar)
                
            }
        }
        
    }
}
    
    #Preview {
        ContentView()
            .modelContainer(for: friend.self,
            inMemory: true)
    }
    
    

