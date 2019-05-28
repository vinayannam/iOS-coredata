//
//  ViewController.swift
//  Databases
//
//  Created by A.S.D.Vinay on 28/03/17.
//  Copyright © 2017 A.S.D.Vinay. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let student:Student = NSEntityDescription.insertNewObject(forEntityName: "Student", into: DatabaseController.getContext()) as! Student
        student.firstName = "Vinay"
        student.lastName = "Annam"
        student.age = 19
        DatabaseController.saveContext()
        
        let course:Course = NSEntityDescription.insertNewObject(forEntityName: "Course", into: DatabaseController.getContext()) as! Course
        course.courseName = "CSC"
        
        student.addToCourses(course)
        
        let fetchRequest:NSFetchRequest<Student> = student.fetchRequest()
        do{
            let searchResults = try DatabaseController.getContext().fetch(fetchRequest)
            print("number of results : \(searchResults.count)")
            for results in searchResults as [Student]{
                print("\(results.firstName!) \(results.lastName!) is \(results.age) years old and undergoing \(results.courses).")
            }
        }
        catch{
            print("Error \(error)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

