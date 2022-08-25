//
//  EditingSheetViewModel.swift
//  School_TimeTable
//
//  Created by Poter Pan on 2022/8/26.
//

import Foundation

class EditingSheetViewModel: ObservableObject {
    
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
            return
        }

        self.courseData = savedItems
//        print("data loaded")
    }
    
    func editCourse(course: CourseModel, newName: String, newPlace: String) {
        print("target course: \(course.id)")
        if let index = courseData.firstIndex(where: { $0.id == course.id } ) {
            courseData[index] = CourseModel(name: newName, place: newPlace)
        }
    }
    
    public func saveData() {
        if let encodedData = try? JSONEncoder().encode(courseData) {
            UserDefaults.standard.set(encodedData, forKey: dataKey)
        }
    }
}
