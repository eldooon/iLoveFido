//
//  FoodDatabase.swift
//  iLoveFido
//
//  Created by Eldon Chan on 9/28/16.
//  Copyright © 2016 Eldon. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase

class FoodInformation: NSObject {
    
    var foodName = String()
    var foodStatus = String()
    var foodImage = UIImage()
    var foodRecommended = String()
    var foodSuggestion = String()
    var foodDescription = String()
    let ref: FIRDatabaseReference?
    
    init(withName Name: String, Status: String, Image: UIImage, Recommended: String, Suggestion: String, Description: String) {
        
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
        let imgURL = NSURL(string: snapshotValue["Image"] as! String)
        let imgData = NSData(contentsOf: imgURL as! URL)
        if let image = UIImage(data: imgData as! Data) {
            foodImage =  image
        }
        foodRecommended = snapshotValue["Recommended"] as! String
        foodSuggestion = snapshotValue["Suggestion"] as! String
        foodDescription = snapshotValue["Description"] as! String
        ref = snapshot.ref
    }
    
}
