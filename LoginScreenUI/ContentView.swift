import SwiftUI

struct ContentView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var wrongUserName = 0
    @State private var wrongPassword = 0
    @State private var showingLoginScreen = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.blue
                    .ignoresSafeArea()
                
                Circle()
                    .scale(1.7)
                    .foregroundStyle(.white.opacity(0.15))
                
                Circle()
                    .scale(1.35)
                    .foregroundStyle(.white)
                
                VStack {
                    Text("Login")
                        .font(.largeTitle.bold())
                        .padding()
                    
                    TextField("Username", text: $username)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.06))
                        .cornerRadius(10)
                        .border(.yellow, width: CGFloat(wrongUserName))
                    
                    SecureField("Password", text: $password)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.06))
                        .cornerRadius(10)
                        .border(.yellow, width: CGFloat(wrongPassword))
                    
                    Button("Login") {
                        
                        authenticateUser(username: username, password: password)
                        
                    }
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(.blue)
                    .cornerRadius(10)
                    
                    NavigationLink(
                        destination: HomeView(username: username),
                        isActive: $showingLoginScreen
                    ) {
                        EmptyView()
                    }
                }
            }
        }
        .navigationBarHidden(true)
    }
    
    func authenticateUser(username: String, password: String) {
        
        // Example credentials
        if username.lowercased() == "admin" {
            wrongUserName = 0
        } else {
            wrongUserName = 2
        }
        
        if password.lowercased() == "1234" {
            wrongPassword = 0
        } else {
            wrongPassword = 2
        }
        
        if username.lowercased() == "admin" &&
            password.lowercased() == "1234" {
            
            showingLoginScreen = true
        }
    }
}

struct HomeView: View {
    var username: String
    
    var body: some View {
        ZStack {
            Color.green
                .ignoresSafeArea()
            
            Text("Welcome, \(username) 🎉")
                .font(.largeTitle)
                .foregroundColor(.white)
        }
    }
}

#Preview {
    ContentView()
}
