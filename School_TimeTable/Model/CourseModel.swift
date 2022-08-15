//
//  Course.swift
//  School_TimeTable
//
//  Created by Poter Pan on 2022/8/13.
//

import Foundation

struct CourseModel: Identifiable {
    var id = UUID().uuidString
    var name: String
    var place: String
}
