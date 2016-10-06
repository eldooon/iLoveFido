//
//  FoodDatabase.swift
//  iLoveFido
//
//  Created by Eldon Chan on 9/28/16.
//  Copyright © 2016 Eldon. All rights reserved.
//

import Foundation
import UIKit

class FoodInformation: NSObject {
    
    var foodName = String()
    var foodStatus = String()
    var foodImage = UIImage()
    var foodRecommended = String()
    var foodSuggestion = String()
    var foodDescription = String()
    
    init(withName Name: String, Status: String, Image: UIImage, Recommended: String, Suggestion: String, Description: String) {
        
        foodName = Name
        foodStatus = Status
        foodImage = Image
        foodRecommended = Recommended
        foodSuggestion = Suggestion
        foodDescription = Description
        
        super.init()
    }
    
}

class database: NSObject {
    
    var foodData = [FoodInformation]()
    
    let almond = FoodInformation(withName: "Almond", Status: "No", Image: UIImage(named: "almond")!, Recommended: "Very Low", Suggestion: "Not recommended!", Description: "The general rule is avoid all nuts such as pecan, macadamia nuts, and walnuts. While Almond is not necessarily toxic to dogs, there has been reports of them blocking dog's esophagus and damaging their windpipe.")
    let apple = FoodInformation(withName: "Apple", Status: "Yes", Image: UIImage(named: "apple")!, Recommended: "Medium", Suggestion: "No seeds!", Description: "Apples are not naturally in a canine diet, but there is no harm in giving your dog a few as treats, just remember to remove all the seeds!")
    let appleJuice = FoodInformation(withName: "Apple Juice", Status: "Warning", Image: UIImage(named: "appleJuice")!, Recommended: "Low", Suggestion: "No added sugar!", Description: "Most apple juice brand tend to consist a lot sugar, and would recommend owners to avoid feeding to your dog. Side effects includes runny stool or bowel irregularity.")
    let apricot = FoodInformation(withName: "Apricot", Status: "Yes", Image: UIImage(named: "apricot")!, Recommended: "Medium", Suggestion: "No seeds or pits!", Description: "Like other popular fruits, apricots can be given as a small snack, but not too often. Remember, no seeds! Dried apricots are also fine.")
    let banana = FoodInformation(withName: "Banana", Status: "Yes", Image: UIImage(named: "banana")!, Recommended: "Very High", Suggestion: "Great for snacks.", Description: "Banana has high level of vitamins and minerals. They are great as treats!")
    let bread = FoodInformation(withName: "Bread", Status: "Yes", Image: UIImage(named: "bread")!, Recommended: "Low", Suggestion: "No bread with nuts or raisin", Description: "Bread tends to high in carbohydrates which can easily make your dog gain weight, so do not make it part of their daily diet. Some bread tends to be high in sugar as well, which is harmful to your dog.")
    let cantaloupe = FoodInformation(withName: "Cantaloupe", Status: "Yes", Image: UIImage(named: "cantaloupe")!, Recommended: "Low", Suggestion: "High in sugar, give once in a while.", Description: "Cantaloupes are a delicous treat in the hot summer, but they are high in sugar so limit the amount you give to your dog. Too much may cause an upset stomach")
    let cashew = FoodInformation(withName: "Cashew", Status: "Yes", Image: UIImage(named: "nuts")!, Recommended: "Medium", Suggestion: "Some nutritional benefit, but high in fat!", Description: "The general rule is avoid all nuts such as pecan, macadamia nuts, and walnuts. Cashew does have some benefits such as calcium, magnesium, antioxcidants, and proteins, but tends to contain fat content which can lead to weight gain.")
    let chocolate = FoodInformation(withName: "Chocolate", Status: "No", Image: UIImage(named: "chocolate")!, Recommended: "TOXIC", Suggestion: "Avoid at all cost!", Description: "Chocolate is toxic to your dog, if consumed, please contact your local vet immediately.")
    let coconut = FoodInformation(withName: "Coconut", Status: "Yes", Image: UIImage(named: "coconut")!, Recommended: "Very High", Suggestion: "Great benefits!", Description: "Coconut including other coconut product like coconut oil and milk helps strengthen immune system, fight bad breath and helps with skin irritation such as hot spots and itchy skin.")
    let cranberries = FoodInformation(withName: "Cranberries", Status: "Yes", Image: UIImage(named: "nuts")!, Recommended: "Low", Suggestion: "Dogs usually don't like them.", Description: "Cranberries tend to have a bitter taste which tends to be offputting to dogs anyway. There isn't really any benefits from cranberries. They are not harmful to dogs, but dried cranberries tend to be loaded with sugar which are bad for dogs.")
    let egg = FoodInformation(withName: "Egg", Status: "Yes", Image: UIImage(named: "egg")!, Recommended: "Very High", Suggestion: "Cooked Only!", Description: "Eggs are a great source of protein, vitamin D, and calcium. It is not recommended to feed your dog raw eggs.")
    let plum = FoodInformation(withName: "Plum", Status: "", Image: UIImage(named: "plum")!, Recommended: "Medium", Suggestion: "", Description: "")
    let shrimp = FoodInformation(withName: "Shrimp", Status: "Yes", Image: UIImage(named: "shrimp")!, Recommended: "Medium", Suggestion: "Cooked Only!", Description: "Make sure the shrimps are cooked. Uncooked shrimp may cause shellfish toxicity. Shrimp is high in antioxidants, and vitamin-b. Still, they should not be part of your dog's daily diet as they are high in cholesterol.")
    
    
    func generateData() {
        foodData.append(almond)
        foodData.append(apple)
        foodData.append(appleJuice)
        foodData.append(apricot)
        foodData.append(banana)
        foodData.append(bread)
        foodData.append(cantaloupe)
        foodData.append(cashew)
        foodData.append(chocolate)
        foodData.append(coconut)
        foodData.append(cranberries)
        foodData.append(egg)
        foodData.append(shrimp)
    }
    
}
