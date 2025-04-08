import SwiftUI

struct ProfileView: View {
    var body: some View {
        ZStack {
            // Background Gradient
            LinearGradient(gradient: Gradient(colors: [Color.purple, Color.black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                // Close and Edit buttons
                HStack {
                    Button(action: {
                        // Close action
                    }) {
                        Image(systemName: "xmark")
                            .foregroundColor(.white)
                            .padding()
                    }
                    Spacer()
                    Button(action: {
                        // Edit action
                    }) {
                        Image(systemName: "pencil")
                            .foregroundColor(.white)
                            .padding()
                    }
                }
                
                Spacer()
                
                // Avatar Image
                Image("profileAvatar") // Add your asset here
                    .resizable()
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                    .shadow(radius: 10)
                
                // Name and Username
                VStack {
                    Text("Christy Lam")
                        .font(.title)
                        .foregroundColor(.white)
                        .bold()
                    
                    Text("@christylam459")
                        .foregroundColor(.gray)
                }
                
                // Profile Options Cards
                HStack(spacing: 16) {
                    ProfileCard(icon: "creditcard", title: "Standard", subtitle: "Your plan")
                    ProfileCard(icon: "person.badge.plus", title: "Invite Friends", subtitle: "Enjoy revolt together", isNew: true)
                }
                .padding(.top)
                
                // Other Options
                VStack(spacing: 16) {
                    ProfileRow(icon: "questionmark.circle", title: "Help")
                    ProfileRow(icon: "person.crop.circle", title: "Account", subtitle: "In review", subtitleColor: .purple)
                    ProfileRow(icon: "megaphone", title: "Inbox")
                }
                
                Spacer()
            }
            .padding()
        }
    }
}

struct ProfileCard: View {
    var icon: String
    var title: String
    var subtitle: String
    var isNew: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: icon)
                    .font(.title)
                    .foregroundColor(.white)
                Spacer()
                if isNew {
                    Text("New")
                        .font(.caption)
                        .foregroundColor(.white)
                        .padding(4)
                        .background(Color.purple)
                        .cornerRadius(5)
                }
            }
            Text(title)
                .foregroundColor(.white)
                .bold()
            Text(subtitle)
                .foregroundColor(.gray)
                .font(.caption)
        }
        .padding()
        .background(Color.black.opacity(0.3))
        .cornerRadius(15)
    }
}

struct ProfileRow: View {
    var icon: String
    var title: String
    var subtitle: String? = nil
    var subtitleColor: Color = .gray
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.white)
                .frame(width: 30)
            VStack(alignment: .leading) {
                Text(title)
                    .foregroundColor(.white)
                if let subtitle = subtitle {
                    Text(subtitle)
                        .font(.caption)
                        .foregroundColor(subtitleColor)
                }
            }
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color.black.opacity(0.3))
        .cornerRadius(15)
    }
}

struct ContentView: View {
    var body: some View {
        ProfileView()
    }
}

#Preview {
    ContentView()
}
