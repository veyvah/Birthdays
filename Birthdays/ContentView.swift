//
//  ContentView.swift
//  Birthdays
//
//  Created by Scholar on 8/8/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var friends: [friend] = [
        friend(name: "Joan", birthday: .now),
        friend(name: "Maya", birthday:
                Date(timeIntervalSince1970: 0))
    ]
    @State private var newName = ""
    @State private var newBirthday = Date.now
    var body: some View {
        NavigationStack {
            
            
            List(friends, id: \.name) {friend in
                HStack {
                    Text(friend.name)
                    Spacer()
                    Text(friend.birthday, format:
                            .dateTime.month(.wide)
                            .day().year())
                }
            }
            
        }.navigationTitle("Birthdays")
            .safeAreaInset(edge: .bottom) {
                VStack(alignment: .center, spacing:20) {
                    Text("New Birthday")
                        .font(.headline)
                    DatePicker(displayComponents, selection:
                                $newBirthday,
                               in: Date.distantPast...Date
                        .now, displayedComponents:
                            .date,selection,;
                               $newBirthday;,
                               in: Date.distantPast...Date
                        .now,
                               TextField("Name", text: $newName)
                        .textFieldStyle(.roundedBorder)
                    )
                    Button("save") {
                        let newFriend = friend(name: newName, birthday: newBirthday)
                        friends.append(newFriend)
                    }
                    .bold()
                }
            }
    }
    
    
    #Preview {
        ContentView()
    }
    
    
}
