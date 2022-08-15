//
//  CourseViewModel.swift
//  School_TimeTable
//
//  Created by Poter Pan on 2022/8/13.
//

import Foundation
import SwiftUI

class CourseViewModel: ObservableObject {
    @Published var courseData: [CourseModel] = []
    
    init() {
        getData()
    }
    
    func getData() {
        for _ in (1...40) {
            let newCourse = CourseModel(name: "未設定", place: "未輸入")
            courseData.append(newCourse)
        }
    }
    
    func editCourse(course: CourseModel, newName: String, newPlace: String) {
        print("target course: \(course.id)")
        if let index = courseData.firstIndex(where: { $0.id == course.id } ) {
            courseData[index] = CourseModel(name: newName, place: newPlace)
            print("Index: \(index)")
            print("Saved")
            print("New id: \(courseData[index].id)")
        }
        else {
            print("Data Error")
            print(course)
            print(courseData)
            }
        

    }
    
    func testCase(course: CourseModel) {
        if let index = courseData.firstIndex(where: { $0.id == course.id } ) {
            courseData[index] = CourseModel(name: "已編輯", place: "已編輯")
        }
    }
    
}
