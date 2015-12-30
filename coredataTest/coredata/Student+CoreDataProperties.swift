//
//  Student+CoreDataProperties.swift
//  coredataTest
//
//  Created by Jx on 15/12/28.
//  Copyright © 2015年 Jx. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Student {

    @NSManaged var id: NSNumber?
    @NSManaged var name: String?
    @NSManaged var birthDay: NSDate?
    @NSManaged var gender: String?
    @NSManaged var classInfo: NSManagedObject?

}
