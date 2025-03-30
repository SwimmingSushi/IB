// Views/Main/MainView.swift
import SwiftUI

struct MainView: View {
    @State private var selectedTab: String = "Home"

    var body: some View {
        VStack {
            // Main content area
            if selectedTab == "Home" {
                HomeView()
            } else if selectedTab == "Calendar" {
                CalendarView()
            } else if selectedTab == "Profile" {
                ProfileView()
            }

            // Bottom navigation bar
            HStack {
                // Home button
                Button(action: {
                    selectedTab = "Home"
                }) {
                    VStack {
                        Image(systemName: selectedTab == "Home" ? "house.fill" : "house")
                            .foregroundColor(selectedTab == "Home" ? .black : .gray)
                        Text("Home")
                            .font(.caption)
                            .foregroundColor(selectedTab == "Home" ? .black : .gray)
                    }
                }
                .frame(maxWidth: .infinity)

                // Calendar button
                Button(action: {
                    selectedTab = "Calendar"
                }) {
                    VStack {
                        Image(systemName: selectedTab == "Calendar" ? "calendar.circle.fill" : "calendar.circle")
                            .foregroundColor(selectedTab == "Calendar" ? .black : .gray)
                        Text("Calendar")
                            .font(.caption)
                            .foregroundColor(selectedTab == "Calendar" ? .black : .gray)
                    }
                }
                .frame(maxWidth: .infinity)

                // Profile button
                Button(action: {
                    selectedTab = "Profile"
                }) {
                    VStack {
                        Image(systemName: selectedTab == "Profile" ? "person.fill" : "person")
                            .foregroundColor(selectedTab == "Profile" ? .black : .gray)
                        Text("Profile")
                            .font(.caption)
                            .foregroundColor(selectedTab == "Profile" ? .black : .gray)
                    }
                }
                .frame(maxWidth: .infinity)
            }
            .padding()
            .background(Color.gray.opacity(0.1))
            .clipShape(Capsule())
            .padding(.horizontal)
            .padding(.bottom, 10)
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}