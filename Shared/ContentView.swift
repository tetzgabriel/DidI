//
//  ContentView.swift
//  Shared
//
//  Created by Gabriel Tetzlaf on 17/05/21.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
    @State var didI: Bool = UserDefaults.standard.bool(forKey: "Did")
    
    var body: some View {
        VStack{
            if(didI){
                Button(
                    action: {
                        self.didI = false
                        UserDefaults.standard.set(self.didI, forKey: "Did")
                        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
                    },
                       label: {
                    Text("I Did 🥳").bold()
                }).buttonStyle(GreenButton())
            } else {
                Button(
                    action: {
                        self.didI = true
                        UserDefaults.standard.set(self.didI, forKey: "Did")
                        UNUserNotificationCenter.current()
                            .requestAuthorization(options: [.alert, .badge, .sound]) {success, error in
                                if success {
                                    print("All set!")
                                } else {
                                    print("Error")
                                }
                            }
                        let content = UNMutableNotificationContent()
                        content.title = "Hey, you didn't 🤡"
                        content.subtitle = "you have to do it 👻"
                        content.sound = UNNotificationSound.default

                        // show this notification five seconds from now
                        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 79200, repeats: false)

                        // choose a random identifier
                        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                        
                        UNUserNotificationCenter.current().add(request)
                    },
                       label: {
                    Text("I Didn't 😔").bold()
                }).buttonStyle(RedButton())
            }
        }
    }
}

struct RedButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(100)
            .background(Color(red: 0.8, green: 0, blue: 0))
            .foregroundColor(.white)
            .clipShape(Circle())
    }
}

struct GreenButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(100)
            .background(Color(red: 0, green: 0.5, blue: 0))
            .foregroundColor(.white)
            .clipShape(Circle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
