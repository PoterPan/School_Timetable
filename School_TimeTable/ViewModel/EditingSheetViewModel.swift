//
//  EditingSheetViewModel.swift
//  School_TimeTable
//
//  Created by Poter Pan on 2022/8/26.
//

import Foundation

final class EditingSheetViewModel: ObservableObject {
    
//    private let courseDataService = CourseDataService()

    @Published var courseData: [CourseEntity] = []
        

    init() {
        
    }

    
    func editCourse(course: CourseEntity, newName: String, newPlace: String) {
        print("target course: \(course.id!)")
        CourseDataService.shared.edit(entity: course, newName: newName, newPlace: newPlace)
    }
    
}
