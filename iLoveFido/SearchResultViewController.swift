//  SearchResultViewController.swift
//  iLoveFido
//
//  Created by Eldon Chan on 9/28/16.
//  Copyright © 2016 Eldon. All rights reserved.
//

import UIKit

class SearchResultViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let searchResultLabel = UILabel()
    let searchResultTableView = UITableView()
    let data = database()
    var filteredDatabase = [FoodInformation]()
    var search = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        searchResultTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        searchResultTableView.delegate = self
        searchResultTableView.dataSource = self
        
        searchQuery()
        createLayout()
        data.generateData()
        
        view.backgroundColor = UIColor.whiteColor()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func searchQuery() {
        
        if search != "" {
            
            var nonPlural : String {
                
                if self.search.characters.last == Character.init("s") {
                    return search.substringToIndex(search.endIndex.predecessor())
                }
                
                return search
            }
            
            for food in data.foodData {
                
                if food.foodName.lowercaseString.containsString(nonPlural.lowercaseString) {
                    filteredDatabase.append(food)
                }
            }
        }
            
        else {
            
            filteredDatabase = data.foodData
        }
    }
    
    func createLayout(){
        
        navigationItem.titleView = UIImageView(image: UIImage(named: "paw"))
        let navigationBar = navigationController!.navigationBar
        navigationBar.tintColor = UIColor.blackColor()
        
        
        view.addSubview(searchResultLabel)
        searchResultLabel.text = "Results for: '\(search)'"
        searchResultLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        searchResultLabel.snp_makeConstraints { (make) in
            make.centerX.equalTo(view.snp_centerX)
            make.top.equalTo(view.snp_top).offset(100)
        }
        
        view.addSubview(searchResultTableView)
        searchResultTableView.snp_makeConstraints { (make) in
            make.top.equalTo(searchResultLabel.snp_bottom).offset(20)
            make.centerX.equalTo(view.snp_centerX)
            make.width.equalTo(view.snp_width)
            make.bottom.equalTo(view.snp_bottom)
        }
    }
    
    func tableView(tableView:UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return filteredDatabase.count
    }
    
    func numberOfSectionsInTableView(tableView:UITableView) -> Int {
        
        return 1
    }
    
    
    func tableView(tableView:UITableView, cellForRowAtIndexPath indexPath:NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        cell.textLabel?.text = filteredDatabase[indexPath.row].foodName
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let foodVC = FoodDetailViewController()
        foodVC.foodNameLabel.text = filteredDatabase[indexPath.row].foodName
        foodVC.foodImageView.image = filteredDatabase[indexPath.row].foodImage
        foodVC.foodStatus = filteredDatabase[indexPath.row].foodStatus
        foodVC.foodRecommend = filteredDatabase[indexPath.row].foodRecommended
        foodVC.foodSuggestion = filteredDatabase[indexPath.row].foodSuggestion
        foodVC.foodDescriptionTextView.text = filteredDatabase[indexPath.row].foodDescription
        
        
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
