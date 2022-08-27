//
//  CourseDataServices.swift
//  School_TimeTable
//
//  Created by Poter Pan on 2022/8/26.
//

import Foundation
import CoreData

class CourseDataService {
    
    static let shared = CourseDataService()
    
    let container: NSPersistentContainer
    @Published var savedEntity: [CourseEntity] = []
    
    init() {
        container = NSPersistentContainer(name: "CourseContainer")
        container.loadPersistentStores { _, error in
            if let error = error {
                print("Error Loading Core Data \(error)")
            } else {
                print("Successfully loaded core data")
            }
        }
        fetchCourse()
    }
    
    func fetchCourse() {
        let request = NSFetchRequest<CourseEntity>(entityName: "CourseEntity")
        do {
            savedEntity = try container.viewContext.fetch(request)
        } catch let error {
            print("Error fetching CourseEntity \(error)")
        }
        
    }
    
    func createDefault() {
        let newCourse = CourseEntity(context: container.viewContext)
        newCourse.id = UUID().uuidString
        newCourse.name = "未輸入"
        newCourse.place = "未輸入"
        applyChanges()
    }
    
    func edit(entity: CourseEntity, newName: String, newPlace: String) {
        entity.name = newName
        entity.place = newPlace
        applyChanges()
        print(entity)
    }
    
    private func save() {
        do {
            try container.viewContext.save()
            
        } catch let error {
            print("Error saving \(error)")
        }
        print("saved")
    }
    
    private func applyChanges() {
        save()
        fetchCourse()
    }
    
    func resetAllData() {
        // List of multiple objects to delete
        let objects: [NSManagedObject] = savedEntity

        // Get a reference to a managed object context
        let context = container.viewContext

        // Delete multiple objects
        for object in objects {
            context.delete(object)
        }

        // Save the deletions to the persistent store
        applyChanges()
        
    }
    
    
}
