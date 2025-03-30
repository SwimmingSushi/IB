// Views/Home/HomeView.swift
import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                // Header
                HStack {
                    Text("IB Scheduler")
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer()
                    Image(systemName: "line.3.horizontal")
                        .font(.title2)
                        .foregroundColor(.gray)
                }
                .padding(.horizontal)
                .padding(.top)

                // Tabbed View (only Schedules for now)
                TabView {
                    SchedulesView()
                        .tabItem {
                            Text("Schedules")
                        }
                }
                .padding(.top)

                Spacer()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}