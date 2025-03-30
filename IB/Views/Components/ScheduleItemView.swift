// Views/Components/ScheduleItemView.swift
import SwiftUI

struct ScheduleItemView: View {
    let schedule: Schedule

    var body: some View {
        HStack {
            // Placeholder for the square icon from Figma
            RoundedRectangle(cornerRadius: 10)
                .fill(schedule.status.color.opacity(0.2))
                .frame(width: 50, height: 50)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .fill(.white)
                        .frame(width: 30, height: 30)
                )

            VStack(alignment: .leading) {
                Text(schedule.timeRange)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Text(schedule.title)
                    .font(.headline)
                Text(schedule.subtitle)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 2)
        .padding(.horizontal)
    }
}

struct ScheduleItemView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleItemView(schedule: Schedule(
            day: "Friday",
            timeRange: "3:00 - 5:30",
            title: "Spanish Class",
            subtitle: "Economics Test 9th 10th",
            status: .flagged,
            morningTasks: [],
            afternoonTasks: [],
            eveningTasks: []
        ))
    }
}