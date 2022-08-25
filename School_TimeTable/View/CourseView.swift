//
//  CourseView.swift
//  School_TimeTable
//
//  Created by Poter Pan on 2022/8/13.
//

import SwiftUI

struct CourseView: View {
    let course: CourseModel
    var body: some View {
        ZStack {
            Rectangle()
                .aspectRatio(1, contentMode: .fit)
                .foregroundColor(.teal)
            
            VStack {
                Text(course.name)
                Text(course.place)
            }
            .lineLimit(1)
            .minimumScaleFactor(0.5)
            .foregroundColor(.black)
        }

    }
}

struct CourseView_Previews: PreviewProvider {
    static var previews: some View {
        CourseView(course: CourseModel.init(name: "測試", place: "123"))
            .previewLayout(.sizeThatFits)
        ContentView()
            .environmentObject(CourseViewModel())
    }
}
