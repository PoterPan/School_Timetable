//
//  School_TimeTableApp.swift
//  School_TimeTable
//
//  Created by Poter Pan on 2022/8/8.
//

import SwiftUI

@main
struct School_TimeTableApp: App {
    @StateObject var courseVM: CourseViewModel = CourseViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(courseVM)
        }
    }
}
