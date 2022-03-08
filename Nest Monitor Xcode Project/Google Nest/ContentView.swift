//
//  ContentView.swift
//  Google Nest
//
//

import SwiftUI
import GoogleSignIn

let signInConfig = GIDConfiguration(clientID: "")
let projectID = ""

var googleUser = GIDGoogleUser()

struct ContentView: View {
    
    @State var push = false
    
    var body: some View {
        NavigationView {
            VStack {
                
                Text("Google Nest")
                    .font(.largeTitle)
                    .padding()
                
                Text("for")
                    .font(.footnote)
                    .padding([.leading, .trailing, .bottom])
                
                Text("Device State")
                    .font(.headline)
                    .foregroundColor(.green)
                
                Spacer()
                    .frame(height: 200)
                
                NavigationLink(isActive: $push) {
                    DevicesView()
                } label: {
                    Button {
                        let scenes = UIApplication.shared.connectedScenes
                        guard let windowScene = scenes.first as? UIWindowScene, let window = windowScene.windows.first, let rootVC = window.rootViewController else { return }
                        
                        GIDSignIn.sharedInstance.signIn(with: signInConfig, presenting: rootVC) { user, error in
                            guard error == nil else { return }
                            
                            if let gUser = user {
                                googleUser = gUser
                                self.push = true
                            }
                        }
                    } label: {
                        HStack {
                            Image(systemName: "g.circle")
                                .resizable()
                                .frame(width: 25, height: 25)
                            Text("Sign in")
                                .padding([.leading], 0)
                                .font(.headline)
                        }
                        .clipShape(Rectangle())
                    }
                }

            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
