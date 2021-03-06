//
//  Shoes.swift
//  RaceRunner
//
//  Created by Joshua Adams on 1/14/16.
//  Copyright © 2016 Josh Adams. All rights reserved.
//

import Foundation
import CoreData

class Shoes: NSManagedObject {
  static let defaultKilometers: Float = 0.0
  static let defaultMaxKilometers: Float = 644.0
  static let defaultThumbnail = UIImage(named: "shoe")!
  static let defaultName = ""
  static let defaultIsCurrent = true
  static let maxNumberLength: Int = 3
  static let checked = UIImage(named: "checked")
  static let unchecked = UIImage(named: "unchecked")
  static let shoesWarning = "%@ have %@ on them. Their limit is %@. Please consider replacement."
  static let warningTitle = "Warning"
  static let gotIt = "Got It"
  static let shoesAreOkay = "shoes are okay"
  
  class func addMeters(meters: Double) -> String {
    let fetchRequest = NSFetchRequest()
    let context = CDManager.sharedCDManager.context
    fetchRequest.entity = NSEntityDescription.entityForName("Shoes", inManagedObjectContext: context)
    let sortDescriptor = NSSortDescriptor(key: "name", ascending: false)
    fetchRequest.sortDescriptors = [sortDescriptor]
    let pairs = (try? context.executeFetchRequest(fetchRequest)) as! [Shoes]
    for shoes in pairs {
      if shoes.isCurrent.boolValue {
        let currentKilometers = shoes.kilometers.doubleValue
        let newKilometers = currentKilometers + (meters / Converter.metersInKilometer)
        shoes.kilometers = newKilometers
        CDManager.saveContext()
        if newKilometers > shoes.maxKilometers.doubleValue {
          //UIAlertController.showMessage(NSString(format: Shoes.shoesWarning, shoes.name, Converter.stringifyKilometers(Float(newKilometers), includeUnits: true), Converter.stringifyKilometers(shoes.maxKilometers.floatValue, includeUnits: true)) as String, title: Shoes.warningTitle, okTitle: Shoes.gotIt)

          return NSString(format: Shoes.shoesWarning, shoes.name, Converter.stringifyKilometers(Float(newKilometers), includeUnits: true), Converter.stringifyKilometers(shoes.maxKilometers.floatValue, includeUnits: true)) as String
        }
      }
    }
    return Shoes.shoesAreOkay
  }
}