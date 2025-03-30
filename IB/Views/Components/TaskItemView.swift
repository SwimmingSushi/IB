// Views/Components/TaskItemView.swift
import SwiftUI

struct TaskItemView: View {
    let task: Task

    var body: some View {
        HStack {
            Circle()
                .fill(task.status.color)
                .frame(width: 10, height: 10)
            Text(task.title)
                .font(.body)
            Spacer()
            Text(task.time)
                .font(.caption)
                .foregroundColor(.gray)
        }
        .padding(.horizontal)
    }
}

struct TaskItemView_Previews: PreviewProvider {
    static var previews: some View {
        TaskItemView(task: Task(title: "Review Spanish vocab", time: "8:00 AM", status: .inProgress))
    }
}