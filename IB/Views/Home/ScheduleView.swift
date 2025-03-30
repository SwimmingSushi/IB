// Views/Home/SchedulesView.swift
import SwiftUI

struct SchedulesView: View {
    @StateObject private var viewModel = ScheduleViewModel()

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Day Schedule Section
                Text("Day Schedule")
                    .font(.headline)
                    .padding(.horizontal)

                ForEach(viewModel.schedules) { schedule in
                    ScheduleItemView(schedule: schedule)

                    // Morning Task Section
                    Text("Morning Task")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.horizontal)
                    ForEach(schedule.morningTasks) { task in
                        TaskItemView(task: task)
                    }

                    // Afternoon Task Section
                    Text("Afternoon Task")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.horizontal)
                    ForEach(schedule.afternoonTasks) { task in
                        TaskItemView(task: task)
                    }

                    // Evening Task Section
                    Text("Evening Task")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.horizontal)
                    ForEach(schedule.eveningTasks) { task in
                        TaskItemView(task: task)
                    }
                }
            }
            .padding(.vertical)
        }
    }
}

struct SchedulesView_Previews: PreviewProvider {
    static var previews: some View {
        SchedulesView()
    }
}