// Views/Calendar/CalendarView.swift
import SwiftUI

struct CalendarView: View {
    @StateObject private var viewModel = CalendarViewModel()
    @State private var tabOffset: CGFloat = 0 // Controls the position of the slideable tab
    @State private var selectedDate: Date? // Tracks the selected date
    
    private let tabHeight: CGFloat = 500 // Height of the slideable tab
    private let minTabOffset: CGFloat = 0 // Tab fully down
    private let maxTabOffset: CGFloat = -400 // Tab fully up (adjust based on your design)
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                // Background gradient (approximating your Figma design)
                LinearGradient(gradient: Gradient(colors: [Color.green.opacity(0.5), Color.pink.opacity(0.5)]),
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                
                VStack {
                    // Calendar Section
                    VStack {
                        // Month Header with Arrows
                        HStack {
                            Button(action: {
                                viewModel.previousMonth()
                            }) {
                                Image(systemName: "chevron.left")
                                    .font(.title2)
                                    .foregroundColor(.gray)
                            }
                            
                            Text(viewModel.monthName)
                                .font(.title)
                                .fontWeight(.bold)
                            
                            Button(action: {
                                viewModel.nextMonth()
                            }) {
                                Image(systemName: "chevron.right")
                                    .font(.title2)
                                    .foregroundColor(.gray)
                            }
                        }
                        .padding(.horizontal)
                        
                        // Days of the Week
                        HStack {
                            ForEach(viewModel.daysOfWeek, id: \.self) { day in
                                Text(day)
                                    .font(.caption)
                                    .foregroundColor(.gray)
                                    .frame(maxWidth: .infinity)
                            }
                        }
                        .padding(.horizontal)
                        
                        // Calendar Grid
                        LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 7), spacing: 10) {
                            ForEach(viewModel.daysInMonth) { day in
                                if day.number == 0 {
                                    // Empty padding day
                                    Text("")
                                        .frame(width: 40, height: 40)
                                } else {
                                    // Actual day
                                    Text("\(day.number)")
                                        .font(.body)
                                        .frame(width: 40, height: 40)
                                        .background(day.isToday ? Circle().fill(Color.black) : nil)
                                        .foregroundColor(day.isToday ? .white : .black)
                                        .onTapGesture {
                                            selectedDate = day.date
                                        }
                                }
                            }
                        }
                        .padding()
                    }
                    .background(Color.white.opacity(0.9))
                    .cornerRadius(20)
                    .padding(.horizontal)
                    .padding(.top)
                    
                    Spacer()
                }
                
                // Slideable Tab
                VStack {
                    Spacer()
                    
                    VStack {
                        // Tab Header (Daily Tasks with Date Tabs)
                        HStack {
                            Text("Daily Tasks")
                                .font(.headline)
                            Spacer()
                            HStack(spacing: 10) {
                                ForEach(-3...3, id: \.self) { offset in
                                    let date = Calendar.current.date(byAdding: .day, value: offset, to: Date())!
                                    let day = Calendar.current.component(.day, from: date)
                                    let weekday = Calendar.current.component(.weekday, from: date)
                                    let weekdaySymbol = Calendar.current.shortWeekdaySymbols[weekday - 1]
                                    
                                    Button(action: {
                                        selectedDate = date
                                    }) {
                                        VStack {
                                            Text(weekdaySymbol)
                                                .font(.caption)
                                                .foregroundColor(.gray)
                                            Text("\(day)")
                                                .font(.body)
                                                .frame(width: 30, height: 30)
                                                .background(Calendar.current.isDate(date, inSameDayAs: Date()) ? Circle().fill(Color.black) : nil)
                                                .foregroundColor(Calendar.current.isDate(date, inSameDayAs: Date()) ? .white : .black)
                                        }
                                    }
                                }
                            }
                        }
                        .padding()
                        
                        // Placeholder for Tab Content (Morning, Afternoon, Evening)
                        VStack {
                            Text("Tab Content Placeholder")
                                .foregroundColor(.gray)
                                .padding()
                            Spacer()
                        }
                        .frame(maxHeight: .infinity)
                    }
                    .frame(height: tabHeight)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.white)
                            .opacity(0.95 - Double(tabOffset / maxTabOffset) * 0.3) // Opacity changes as tab slides
                    )
                    .offset(y: tabOffset)
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                let newOffset = tabOffset + value.translation.height
                                tabOffset = min(max(newOffset, maxTabOffset), minTabOffset)
                            }
                            .onEnded { _ in
                                // Snap to either fully up or fully down
                                if tabOffset < (maxTabOffset + minTabOffset) / 2 {
                                    withAnimation {
                                        tabOffset = maxTabOffset
                                    }
                                } else {
                                    withAnimation {
                                        tabOffset = minTabOffset
                                    }
                                }
                            }
                    )
                }
            }
            .navigationBarItems(leading: Button(action: {
                // Back button action (if needed)
            }) {
                Image(systemName: "chevron.left")
                    .foregroundColor(.gray)
            })
        }
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}