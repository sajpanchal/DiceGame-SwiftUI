//
//  Summary+CoreDataProperties.swift
//  DiceGame
//
//  Created by saj panchal on 2021-09-10.
//
//

import Foundation
import CoreData


extension Summary {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Summary> {
        return NSFetchRequest<Summary>(entityName: "Summary")
    }

    @NSManaged public var date: String?
    @NSManaged public var score: Int16
    public var currentDate: String {
        get {
            return (date ?? "N/A")
        }
        set {
            date = newValue
        }
    }

}

extension Summary : Identifiable {

}
