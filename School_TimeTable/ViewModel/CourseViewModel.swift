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
    {
        // didSet 屬性觀察器（Property observers)
        didSet {
            saveData()
        }
    }
    
    let dataKey: String = "course_list"
    
    init() {
        getItems()
    }
    
    public func getItems() {
        guard
            let data = UserDefaults.standard.data(forKey: dataKey),
            let savedItems = try? JSONDecoder().decode([CourseModel].self, from: data)
        else {
            print("Fetching data failed")
            print("Creating default data")
            for _ in (1...40) {
                let newCourse = CourseModel(name: "未設定", place: "未輸入")
                self.courseData.append(newCourse)
            }
            return
        }

        self.courseData = savedItems
//        print("data loaded")
    }
    
//    func editCourse(course: CourseModel, newName: String, newPlace: String) {
//        print("target course: \(course.id)")
//        if let index = courseData.firstIndex(where: { $0.id == course.id } ) {
//            courseData[index] = CourseModel(name: newName, place: newPlace)
//            print("Index: \(index)")
//            print("Saved")
//            print("New id: \(courseData[index].id)")
//        }
//        else {
//            print("Data Error")
//            print(course)
//            print(courseData)
//            }
//    }
    
//    func testCase(course: CourseModel) {
//        if let index = courseData.firstIndex(where: { $0.id == course.id } ) {
//            courseData[index] = CourseModel(name: "已編輯", place: "已編輯")
//        }
//    }
    
    public func saveData() {
        if let encodedData = try? JSONEncoder().encode(courseData) {
            UserDefaults.standard.set(encodedData, forKey: dataKey)
        }
    }
    
    func resetData() {
        courseData.removeAll()
        UserDefaults.standard.removeObject(forKey: dataKey)
        getItems()
    }
    
    
}
