//
//  FoodDatabase.swift
//  iLoveFido
//
//  Created by Eldon Chan on 10/27/16.
//  Copyright © 2016 Eldon. All rights reserved.
//

import Foundation
import FirebaseDatabase

class FoodDatabase {
    
    static let sharedInstance = FoodDatabase()
    var database = [FoodInformation]()
    let ref = FIRDatabase.database().reference(withPath: "FoodDatabase")
    
    func getFoodDatabase() {
        
        ref.observe(.value, with: { snapshot in

            for item in snapshot.children {
                print("ITEM \(item)")
                let foodItem = FoodInformation(snapshot: item as! FIRDataSnapshot)
                self.database.append(foodItem)
            }
            
        })
        
    }
}
