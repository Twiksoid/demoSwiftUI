//
//  ContentView.swift
//  DemoSwiftUI
//
//  Created by Nikita Byzov on 12.01.2023.
//

import SwiftUI

struct ContentView: View {
    
    // тап-бар создаем
    
    var body: some View {
        TabView {
            FeedView()
                .tabItem {
                    Image(systemName: "note.text")
                    Text("Feed")
                }
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Profile")
                }
            
            PlayerView()
                .tabItem {
                    Image(systemName: "music.note.house")
                    Text("Player")
                }
            
            VideoView()
                .tabItem {
                    Image(systemName: "music.note.tv.fill")
                    Text("Video")
                }
            
            RecorderView()
                .tabItem {
                    Image(systemName: "mic.fill")
                    Text("Recorder")
                }
        }
    }
}

struct FeedView: View {
    var body: some View {
        VStack {
            Text("Some text")
                .fontWeight(.bold)
                .font(.largeTitle)
            
            Text("Another Text")
                .fontWeight(.regular)
        }
    }
}

struct ProfileView: View {
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        
        VStack(alignment: .center) {
            
            VStack(alignment: .center) {
                Image("vkLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                // поднять к верху
                // Spacer(minLength: 100)
            }
            // опустить вниз на
            .padding(50)
            
            VStack(spacing: 0) {
                TextField("Eemail or login", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button("Login") {
                    let _ = print("Button Pressed with \(email) and \(password) values")
                }
                .frame(width: 350, height: 50)
                .controlSize(.regular)
                .buttonStyle(.borderedProminent)
                .tint(Color(.systemBlue))
                
                .foregroundColor(.white)
            }
            .padding(20)
        }
    }
}

// код с лекции
struct Universe: Identifiable {
    @State var id: String
    @State var name: String
}

struct PlayerView: View {
    @State var universe: Universe?
    
    var body: some View {
        VStack(spacing: 16) {
            
            Button(action: { universe = .init(id: "1", name: "Marvel")}, label: { Text ("Marvel") })
            
            Button(action: { universe = .init(id: "2", name: "DC" )},
                   label: { Text ("DC") })}
        
        .alert(item: $universe) { universe in
            Alert(title: Text("Вы выбрали \(universe.name)"), dismissButton: .default(Text("OK")))
        }
    }
}

struct VideoView: View {
    var body: some View {
        Color.gray
    }
}

struct RecorderView: View {
    var body: some View {
        Color.gray
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
