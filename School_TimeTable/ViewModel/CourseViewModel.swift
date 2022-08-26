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
    {   // didSet 屬性觀察器（Property observers)
        didSet { saveData() }
    }
    
    let dataKey: String = "course_list"
    
    init() {
        getItems()
    }
    
    func getItems() {
        guard
            let data = UserDefaults.standard.data(forKey: dataKey),
            let savedItems = try? JSONDecoder().decode([CourseModel].self, from: data)
        else {
            print("Fetching data failed")
            createDefault()
            return
        }

        self.courseData = savedItems
//        print("data loaded")
    }
    
    private func createDefault() {
        print("Creating default data")
        for _ in (1...40) {
            let newCourse = CourseModel(name: "未設定", place: "未輸入")
            self.courseData.append(newCourse)
        }
    }
    
    private func saveData() {
        if let encodedData = try? JSONEncoder().encode(courseData) {
            UserDefaults.standard.set(encodedData, forKey: dataKey)
        }
    }
    
    func resetData() {
        courseData.removeAll()
        print(UserDefaults.standard.data(forKey: dataKey))
        UserDefaults.standard.removeObject(forKey: dataKey)
        print(UserDefaults.standard.data(forKey: dataKey))
        getItems()
    }
    
    
}
