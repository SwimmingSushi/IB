// ViewModels/CalendarViewModel.swift
import Foundation
import Combine

class CalendarViewModel: ObservableObject {
    @Published var currentDate: Date
    @Published var daysInMonth: [Day] = []
    
    private let calendar = Calendar.current
    private let dateFormatter: DateFormatter
    
    struct Day: Identifiable {
        let id = UUID()
        let number: Int
        let isToday: Bool
        let date: Date
    }
    
    init() {
        self.currentDate = Date()
        self.dateFormatter = DateFormatter()
        self.dateFormatter.dateFormat = "MMMM"
        updateDaysInMonth()
    }
    
    var monthName: String {
        dateFormatter.string(from: currentDate)
    }
    
    var daysOfWeek: [String] {
        ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
    }
    
    func previousMonth() {
        if let newDate = calendar.date(byAdding: .month, value: -1, to: currentDate) {
            currentDate = newDate
            updateDaysInMonth()
        }
    }
    
    func nextMonth() {
        if let newDate = calendar.date(byAdding: .month, value: 1, to: currentDate) {
            currentDate = newDate
            updateDaysInMonth()
        }
    }
    
    private func updateDaysInMonth() {
        daysInMonth.removeAll()
        
        // Get the first day of the month
        let components = calendar.dateComponents([.year, .month], from: currentDate)
        guard let firstDayOfMonth = calendar.date(from: components) else { return }
        
        // Get the range of days in the month
        guard let range = calendar.range(of: .day, in: .month, for: firstDayOfMonth) else { return }
        let numberOfDays = range.count
        
        // Get the weekday of the first day (to determine padding)
        let firstWeekday = calendar.component(.weekday, from: firstDayOfMonth)
        let paddingDays = (firstWeekday - 1) % 7
        
        // Add padding days (empty slots before the first day)
        for _ in 0..<paddingDays {
            daysInMonth.append(Day(number: 0, isToday: false, date: Date()))
        }
        
        // Add actual days
        for day in 1...numberOfDays {
            let dateComponents = DateComponents(year: calendar.component(.year, from: currentDate),
                                                month: calendar