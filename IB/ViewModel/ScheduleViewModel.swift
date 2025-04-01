// ViewModels/ScheduleViewModel.swift
import Foundation
import Combine

class ScheduleViewModel: ObservableObject {
    @Published var schedules: [Schedule] = [
        Schedule(
            day: "Friday",
            timeRange: "3:00 - 5:30",
            title: "Spanish Class",
            subtitle: "Economics Test 9th 10th",
            status: .flagged,
            morningTasks: [
                Task(title: "Review Spanish vocab", time: "8:00 AM", status: .inProgress)
            ],
            afternoonTasks: [
                Task(title: "Complete Economics revision", time: "2:00 PM", status: .flagged)
            ],
            eveningTasks: [
                Task(title: "Plan next day's schedule", time: "7:00 PM", status: .comfortable)
            ]
        )
    ]
}