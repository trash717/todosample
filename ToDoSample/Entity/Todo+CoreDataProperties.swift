//
//  Todo+CoreDataProperties.swift
//  
//
//  Created by onishi on 2016/06/01.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Todo {

    @NSManaged var title: String?
    @NSManaged var desc: String?
    @NSManaged var image: Data?

}
