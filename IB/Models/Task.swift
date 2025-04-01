// Models/Task.swift
import Foundation
import SwiftUI

struct Task: Identifiable {
    let id = UUID()  
    let title: String
    let time: String
    let status: TaskStatus
}

enum TaskStatus {
    case flagged  // Red
    case inProgress  // Yellow
    case comfortable  // Green

    var color: Color {
        switch self {
        case .flagged:
            return .red
        case .inProgress:
            return .yellow
        case .comfortable:
            return .green
        }
    }
}