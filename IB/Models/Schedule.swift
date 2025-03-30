// Models/Schedule.swift
struct Schedule: Identifiable {
    let id = UUID()
    let day: String
    let timeRange: String
    let title: String
    let subtitle: String
    let status: TaskStatus
    let morningTasks: [Task]
    let afternoonTasks: [Task]
    let eveningTasks: [Task]
}