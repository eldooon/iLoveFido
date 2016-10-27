//  SearchResultViewController.swift
//  iLoveFido
//
//  Created by Eldon Chan on 9/28/16.
//  Copyright © 2016 Eldon. All rights reserved.
//

import UIKit
import FirebaseDatabase

class SearchResultViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let searchResultLabel = UILabel()
    let searchResultTableView = UITableView()
    var data = [FoodInformation]()
    var filteredDatabase = [FoodInformation]()
    var search = String()
    let ref = FIRDatabase.database().reference(withPath: "FoodDatabase")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        searchResultTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        searchResultTableView.delegate = self
        searchResultTableView.dataSource = self
        
        getFoodDatabase()
//        searchQuery()
        createLayout()
        
        view.backgroundColor = UIColor.white
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getFoodDatabase() {
        
//        let childref = ref.child(search)
//        print("CHILD REF \(childref.key)")
        ref.observe(.value, with: { snapshot in
            var newItems: [FoodInformation] = []
            for item in snapshot.children {
                print("ITEM \(item)")
                let foodItem = FoodInformation(snapshot: item as! FIRDataSnapshot)
                newItems.append(foodItem)
            }
            
            self.data = newItems
            self.searchQuery()
        })

        
    
    }
    
    func searchQuery() {
        
        if search != "" {
            
            var nonPlural : String {
                
                if self.search.characters.last == Character.init("s") {
                    return search.substring(to: search.characters.index(before: search.endIndex))
                }
                
                return search
            }
            
            for food in data {
                
                if food.foodName.lowercased().contains(nonPlural.lowercased()) {
                    filteredDatabase.append(food)
                }
            }
        }
            
        else {
            
            filteredDatabase = data
        }
        
        self.searchResultTableView.reloadData()
    }
    
    func createLayout(){
        
        navigationItem.titleView = UIImageView(image: UIImage(named: "paw"))
        let navigationBar = navigationController!.navigationBar
        navigationBar.tintColor = UIColor.black
        
        
        view.addSubview(searchResultLabel)
        searchResultLabel.text = "Results for: '\(search)'"
        searchResultLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        searchResultLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(view.snp.centerX)
            make.top.equalTo(view.snp.top).offset(100)
        }
        
        view.addSubview(searchResultTableView)
        searchResultTableView.snp.makeConstraints { (make) in
            make.top.equalTo(searchResultLabel.snp.bottom).offset(20)
            make.centerX.equalTo(view.snp.centerX)
            make.width.equalTo(view.snp.width)
            make.bottom.equalTo(view.snp.bottom)
        }
    }
    
    func tableView(_ tableView:UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return filteredDatabase.count
    }
    
    func numberOfSections(in tableView:UITableView) -> Int {
        
        return 1
    }
    
    
    func tableView(_ tableView:UITableView, cellForRowAt indexPath:IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = filteredDatabase[(indexPath as NSIndexPath).row].foodName
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let foodVC = FoodDetailViewController()
        foodVC.foodNameLabel.text = filteredDatabase[(indexPath as NSIndexPath).row].foodName
        foodVC.foodImageView.image = filteredDatabase[(indexPath as NSIndexPath).row].foodImage
        foodVC.foodStatus = filteredDatabase[(indexPath as NSIndexPath).row].foodStatus
        foodVC.foodRecommend = filteredDatabase[(indexPath as NSIndexPath).row].foodRecommended
        foodVC.foodSuggestion = filteredDatabase[(indexPath as NSIndexPath).row].foodSuggestion
        foodVC.foodDescriptionTextView.text = filteredDatabase[(indexPath as NSIndexPath).row].foodDescription
        
        
        self.navigationController?.pushViewController(foodVC, animated: true)
    }



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
