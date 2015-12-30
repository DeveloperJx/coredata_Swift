//
//  ViewController.swift
//  coredataTest
//
//  Created by Jx on 15/12/28.
//  Copyright © 2015年 Jx. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func insertTest() {
        let student0 = NSEntityDescription.insertNewObjectForEntityForName("Student", inManagedObjectContext: (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext) as! Student
        student0.name = "jx"
        student0.id = 0
        student0.gender = "male"
        
        (UIApplication.sharedApplication().delegate as! AppDelegate).saveContext()
        
        let student1 = NSEntityDescription.insertNewObjectForEntityForName("Student", inManagedObjectContext: (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext) as! Student
        student1.name = "cc"
        student1.id = 1
        student1.gender = "female"
        
        (UIApplication.sharedApplication().delegate as! AppDelegate).saveContext()
    }
    
    func fetchTest() {
        let fetchRequest = NSFetchRequest()
        let entity = NSEntityDescription.entityForName("Student", inManagedObjectContext: (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext)
        fetchRequest.entity = entity
        
        // Specify criteria for filtering which objects to fetch
        
        let predicate = NSPredicate(format: "name == %@", argumentArray: ["jx"])
        fetchRequest.predicate = predicate
        
        // Specify how the fetched objects should be sorted
        
        let sortDescriptor = NSSortDescriptor(key: "id", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        var result = []
        
        do {
             result = try (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext.executeFetchRequest(fetchRequest)
        } catch let error as NSError { //如果失败则进入catch代码块
            print(error)
            return
        }
        
        for student in result {
            print((student as! Student).name)
        }
    }
    
    func deleteTest() {
        let fetchRequest = NSFetchRequest()
        let entity = NSEntityDescription.entityForName("Student", inManagedObjectContext: (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext)
        fetchRequest.entity = entity
        let predicate = NSPredicate(format: "name == %@", argumentArray: ["jx"])
        fetchRequest.predicate = predicate
        
        var result = []
        
        do {
            result = try (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext.executeFetchRequest(fetchRequest)
        } catch let error as NSError { //如果失败则进入catch代码块
            print(error)
            return
        }
        
        if result.count != 0 {
            for student in result {
                (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext.deleteObject(student as! NSManagedObject)
            }
        }
    }
    
    func updateTest() {
        let fetchRequest = NSFetchRequest()
        let entity = NSEntityDescription.entityForName("Student", inManagedObjectContext: (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext)
        fetchRequest.entity = entity
        
        let predicate = NSPredicate(format: "name == %@", argumentArray: ["jx"])
        fetchRequest.predicate = predicate
        
        var result = []
        
        do {
            result = try (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext.executeFetchRequest(fetchRequest)
        } catch let error as NSError { //如果失败则进入catch代码块
            print(error)
            return
        }
        
        if result.count != 0 {
            for student in result {
                (student as! Student).name = "Jx"
            }
        }
        
        (UIApplication.sharedApplication().delegate as! AppDelegate).saveContext()
    }
    
    @IBAction func fecth(sender: AnyObject) {
        self.fetchTest()
    }
    
    @IBAction func insert(sender: AnyObject) {
        self.insertTest()
    }
    
    @IBAction func delete_Button(sender: AnyObject) {
        self.deleteTest()
    }
}

