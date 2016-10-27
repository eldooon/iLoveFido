//
//  FoodInformation.swift
//  iLoveFido
//
//  Created by Eldon Chan on 9/28/16.
//  Copyright © 2016 Eldon. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase
import SDWebImage

class FoodInformation: NSObject {
    
    var foodName = String()
    var foodStatus = String()
    var foodImage = String()
    var foodRecommended = String()
    var foodSuggestion = String()
    var foodDescription = String()
    let ref: FIRDatabaseReference?
    
    init(withName Name: String, Status: String, Image: String, Recommended: String, Suggestion: String, Description: String) {
        
        foodName = Name
        foodStatus = Status
        foodImage = Image
        foodRecommended = Recommended
        foodSuggestion = Suggestion
        foodDescription = Description
        ref = nil
        
        super.init()
    }
    
    init(snapshot: FIRDataSnapshot) {
        let snapshotValue = snapshot.value as! [String: AnyObject]
        foodName = snapshotValue["Name"] as! String
        foodStatus = snapshotValue["Status"] as! String
        foodImage = snapshotValue["Image"] as! String
        foodRecommended = snapshotValue["Recommended"] as! String
        foodSuggestion = snapshotValue["Suggestion"] as! String
        foodDescription = snapshotValue["Description"] as! String
        ref = snapshot.ref
    }
    
}
