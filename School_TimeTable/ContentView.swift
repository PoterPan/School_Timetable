//
//  ContentView.swift
//  School_TimeTable
//
//  Created by Poter Pan on 2022/8/8.
//

import SwiftUI

struct ContentView: View {
    let titles = ["週一", "週二", "週三", "週四", "週五"]
    
    let cols = Array(repeating: GridItem(), count: 5)
    
    @EnvironmentObject var courseVM: CourseViewModel
    @State private var isPresentingCourse: CourseModel? = nil


    
    var body: some View {
        ZStack {
            Color.mint
                .ignoresSafeArea()
            VStack {
                Text("我的課表")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                
//                Text(courseVM.courseData[0].name)
//                ForEach(courseVM.courseData) { course in
//                    Text(course.id)
//                }
                
                HStack {
                    ForEach(titles, id: \.self) { title in
                        Text(title)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                        Divider()
                    }
                }
                .frame(height: 30)
                .padding()
                
                ScrollView{
                    LazyVGrid(columns: cols, spacing: 20) {
                        ForEach(courseVM.courseData) { course in
                            Button {
//                                courseVM.testCase(course: course)
//                                courseVM.editCourse(course: course, newName: "123", newPlace: "123")
                                print("selected course: \(course.id)")
                                isPresentingCourse = course
                            } label: {
                                CourseView(course: course)
                            }
                            


                        }
                        .sheet(item: $isPresentingCourse) { course in
                            EditingSheetView(course: course)
                        }
                    }
                    .padding()
                    
                }
                
            }
            // FAB
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button {
                        courseVM.resetData()
                    } label: {
                        Image(systemName: "exclamationmark.arrow.triangle.2.circlepath")
                            .font(.largeTitle)
                            .frame(width: 50, height: 50)
                            .background(Color.accentColor)
                            .clipShape(Circle())
                            .foregroundColor(.white)
                            .padding(20)
                    }

                }
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(CourseViewModel())
    }
}


