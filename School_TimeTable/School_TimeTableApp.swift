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
    @StateObject var editingSheetVM: EditingSheetViewModel = EditingSheetViewModel()
    
    let courseDataService = CourseDataService.shared
    

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(courseVM)
                .environmentObject(editingSheetVM)
                .environment(\.managedObjectContext, courseDataService.container.viewContext)

        }
    }
}
