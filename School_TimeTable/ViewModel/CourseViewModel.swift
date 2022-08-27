//
//  CourseViewModel.swift
//  School_TimeTable
//
//  Created by Poter Pan on 2022/8/13.
//

import Foundation
import SwiftUI
import CoreData

class CourseViewModel: ObservableObject {
    
//    let courseDataService = CourseDataService()
    
    @Published var courseData: [CourseEntity] = []
    

    let dataKey: String = "course_list"
    
    
    init() {
        courseData = CourseDataService.shared.savedEntity
    }
    
    func remove() {
        courseData.removeAll()
    }
    
    func update() {
        courseData = CourseDataService.shared.savedEntity
        print("updating...")
//        print("new data: \(courseData)")
//        print(courseData)
    }
    
    private func createDefault() {
        print("Creating default data")
        for _ in (1...5) {
            CourseDataService.shared.createDefault()
        }
    }
    
    func resetData() {
        courseData.removeAll()
        CourseDataService.shared.resetAllData()
        createDefault()
        update()
    }
}
