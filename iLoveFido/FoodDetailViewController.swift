//
//  FoodDetailViewController.swift
//  iLoveFido
//
//  Created by Eldon Chan on 9/28/16.
//  Copyright © 2016 Eldon. All rights reserved.
//

import UIKit

class FoodDetailViewController: UIViewController {
    
    let foodNameLabel = UILabel()
    let foodImageView = UIImageView()
    let darkenView = UIView()
    var foodStatus = String()
    var foodRecommend = String()
    var foodSuggestion = String()
    let foodStatusImageView = UIImageView()
    let foodDescriptionLabel = UILabel()
    let foodDescriptionTextView = UITextView()
    var boneImageView1 = UIImageView()
    var boneImageView2 = UIImageView()
    var boneImageView3 = UIImageView()
    var boneImageView4 = UIImageView()
    var boneImageView5 = UIImageView()
    var scrollView = UIScrollView()
    let informationLabel = UILabel()
    let seperatorLineImageView = UIImageView()
    let safeLabel = UILabel()
    let safeStatusLabel = UILabel()
    let recommendedLabel = UILabel()
    let recommendedStatusLabel = UILabel()
    let suggestionLabel = UILabel()
    let suggestionStatusLabel = UILabel()



    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.white
        createLayout()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    func createLayout(){
        
        navigationItem.titleView = UIImageView(image: UIImage(named: "paw"))
        let navigationBar = navigationController!.navigationBar
        navigationBar.tintColor = UIColor.black
        
        view.addSubview(scrollView)
        scrollView.isScrollEnabled = true
        scrollView.showsVerticalScrollIndicator = true
        scrollView.isUserInteractionEnabled = true
        scrollView.backgroundColor = UIColor.white
        scrollView.snp.makeConstraints { (make) in
            make.top.equalTo(view.snp.top)
            make.left.equalTo(view.snp.left)
            make.right.equalTo(view.snp.right)
            make.bottom.equalTo(view.snp.bottom).offset(-100)
        }
        
        
        scrollView.addSubview(foodImageView)
        foodImageView.snp.makeConstraints { (make) in
            make.top.equalTo(scrollView.snp.top)
            make.left.equalTo(view.snp.left)
            make.right.equalTo(view.snp.right)
            make.height.equalTo(view.snp.height).dividedBy(2.5)
        }
        
        scrollView.addSubview(darkenView)
        darkenView.backgroundColor = UIColor.black
        darkenView.layer.opacity = 0.5
        darkenView.snp.makeConstraints { (make) in
            make.centerX.equalTo(foodImageView.snp.centerX)
            make.centerY.equalTo(foodImageView.snp.centerY)
            make.width.equalTo(foodImageView.snp.width)
            make.height.equalTo(foodImageView.snp.height)
        }
        
        scrollView.addSubview(foodNameLabel)
        foodNameLabel.textAlignment = NSTextAlignment.center
        foodNameLabel.textColor = UIColor.white
        foodNameLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 32)
        foodNameLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(view.snp.centerX)
            make.top.equalTo(foodImageView.snp.centerY).offset(20)
        }
        
        view.addSubview(foodStatusImageView)
        if foodStatus == "Yes" {
            foodStatusImageView.image = UIImage(named: "good")
        }
            
        else if foodStatus == "Warning" {
            foodStatusImageView.image = UIImage(named: "warning")
        }
            
        else {
            foodStatusImageView.image = UIImage(named: "bad")
        }
        foodStatusImageView.snp.makeConstraints { (make) in
            make.bottom.equalTo(foodNameLabel.snp.top).offset(-10)
            make.centerX.equalTo(foodNameLabel.snp.centerX)
            make.width.equalTo(foodImageView.snp.width).dividedBy(5)
            make.height.equalTo(foodImageView.snp.width).dividedBy(5)
        }
    
        
        view.addSubview(boneImageView3)
        boneImageView3.image = UIImage(named: "bone")
        boneImageView3.snp.makeConstraints { (make) in
            make.top.equalTo(foodNameLabel.snp.bottom).offset(10)
            make.centerX.equalTo(foodNameLabel.snp.centerX)
            make.width.equalTo(view.snp.width).dividedBy(18)
            make.height.equalTo(view.snp.width).dividedBy(18)
        }
        
        view.addSubview(boneImageView2)
        boneImageView2.image = UIImage(named: "bone")
        boneImageView2.snp.makeConstraints { (make) in
            make.top.equalTo(boneImageView3.snp.top)
            make.right.equalTo(boneImageView3.snp.left).offset(1)
            make.width.equalTo(boneImageView3.snp.width)
            make.height.equalTo(boneImageView3.snp.width)
        }
        
        view.addSubview(boneImageView1)
        boneImageView1.image = UIImage(named: "bone")
        boneImageView1.snp.makeConstraints { (make) in
            make.top.equalTo(boneImageView2.snp.top)
            make.right.equalTo(boneImageView2.snp.left).offset(1)
            make.width.equalTo(boneImageView2.snp.width)
            make.height.equalTo(boneImageView2.snp.width)
        }
        
        view.addSubview(boneImageView4)
        boneImageView4.image = UIImage(named: "bone")
        boneImageView4.snp.makeConstraints { (make) in
            make.top.equalTo(boneImageView3.snp.top)
            make.left.equalTo(boneImageView3.snp.right).offset(1)
            make.width.equalTo(boneImageView3.snp.width)
            make.height.equalTo(boneImageView3.snp.width)
        }
        
        view.addSubview(boneImageView5)
        boneImageView5.image = UIImage(named: "bone")
        boneImageView5.snp.makeConstraints { (make) in
            make.top.equalTo(boneImageView4.snp.top)
            make.left.equalTo(boneImageView4.snp.right).offset(1)
            make.width.equalTo(boneImageView4.snp.width)
            make.height.equalTo(boneImageView4.snp.width)
        }
        
        view.addSubview(informationLabel)
        informationLabel.text = "Information"
        informationLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        informationLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(view.snp.centerX)
            make.top.equalTo(foodImageView.snp.bottom).offset(20)
        }
        
        view.addSubview(seperatorLineImageView)
        seperatorLineImageView.backgroundColor = UIColor.gray
        seperatorLineImageView.snp.makeConstraints { (make) in
            make.top.equalTo(informationLabel.snp.bottom).offset(10)
            make.centerX.equalTo(view.snp.centerX)
            make.height.equalTo(1)
            make.width.equalTo(view.snp.width).offset(-100)
        }
        
        view.addSubview(safeLabel)
        safeLabel.text = "Is it Safe:"
        safeLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 14)
        safeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(seperatorLineImageView.snp.bottom).offset(20)
            make.left.equalTo(view.snp.left).offset(20)
        }
        
        view.addSubview(safeStatusLabel)
        safeStatusLabel.text = "\(foodStatus)"
        safeStatusLabel.font = UIFont(name: "HelveticaNeue", size: 14)
        if foodStatus == "Yes" {
            safeStatusLabel.textColor = UIColor.green
        }
        else if foodStatus == "Warning" {
            safeStatusLabel.textColor = UIColor.orange
        }
        else {
            safeStatusLabel.textColor = UIColor.red
        }
        safeStatusLabel.snp.makeConstraints { (make) in
            make.top.equalTo(safeLabel.snp.top)
            make.left.equalTo(safeLabel.snp.right).offset(5)
        }
        
        view.addSubview(recommendedLabel)
        recommendedLabel.text = "Recommended:"
        recommendedLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 14)
        recommendedLabel.snp.makeConstraints { (make) in
            make.top.equalTo(safeLabel.snp.bottom).offset(5)
            make.left.equalTo(view.snp.left).offset(20)
        }
        
        view.addSubview(recommendedStatusLabel)
        recommendedStatusLabel.text = "\(foodRecommend)"
        recommendedStatusLabel.font = UIFont(name: "HelveticaNeue", size: 14)
        recommendedStatusLabel.snp.makeConstraints { (make) in
            make.top.equalTo(recommendedLabel.snp.top)
            make.left.equalTo(recommendedLabel.snp.right).offset(5)
        }
        
        view.addSubview(suggestionLabel)
        suggestionLabel.text = "Suggestion:"
        suggestionLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 14)
        suggestionLabel.snp.makeConstraints { (make) in
            make.top.equalTo(recommendedLabel.snp.bottom).offset(5)
            make.left.equalTo(recommendedLabel.snp.left)
        }
        
        view.addSubview(suggestionStatusLabel)
        suggestionStatusLabel.text = "\(foodSuggestion)"
        suggestionStatusLabel.numberOfLines = 0
        suggestionStatusLabel.lineBreakMode = .byWordWrapping
        suggestionStatusLabel.font = UIFont(name: "HelveticaNeue", size: 14)
        suggestionStatusLabel.snp.makeConstraints { (make) in
            make.top.equalTo(suggestionLabel.snp.top)
            make.left.equalTo(suggestionLabel.snp.right).offset(5)
            make.width.equalTo(view.snp.width).dividedBy(1.5)
        }
        
        view.addSubview(foodDescriptionLabel)
        foodDescriptionLabel.text = "Description:"
        foodDescriptionLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 14)
        foodDescriptionLabel.snp.makeConstraints { (make) in
            make.top.equalTo(suggestionStatusLabel.snp.bottom).offset(5)
            make.left.equalTo(suggestionLabel.snp.left)
        }
        
        view.addSubview(foodDescriptionTextView)
        foodDescriptionTextView.isEditable = false
        foodDescriptionTextView.font = UIFont(name: "HelveticaNeue", size: 14)
        foodDescriptionTextView.snp.makeConstraints { (make) in
            make.top.equalTo(foodDescriptionLabel.snp.bottom)
            make.left.equalTo(foodDescriptionLabel.snp.left)
            make.right.equalTo(view.snp.right).offset(-20)
            make.height.equalTo(view.snp.width) //NEEDS TO BE CHANGED
            
        }
        
        calculateRecommendedBone()
        
        
        
//        calculateScrollViewHeight()
//        
//        scrollView.contentSize = CGSize(width: 300, height: totalHeight)
        
        
    }
    
    func calculateRecommendedBone() {
        
        if foodRecommend == "Very Low" {
            boneImageView1.image = UIImage(named: "filledBone")
        }
        
        if foodRecommend == "Low" {
            boneImageView1.image = UIImage(named: "filledBone")
            boneImageView2.image = UIImage(named: "filledBone")
        }
        
        if foodRecommend == "Medium" {
            boneImageView1.image = UIImage(named: "filledBone")
            boneImageView2.image = UIImage(named: "filledBone")
            boneImageView3.image = UIImage(named: "filledBone")
        }
        
        if foodRecommend == "High" {
            boneImageView1.image = UIImage(named: "filledBone")
            boneImageView2.image = UIImage(named: "filledBone")
            boneImageView3.image = UIImage(named: "filledBone")
            boneImageView4.image = UIImage(named: "filledBone")
        }
        
        if foodRecommend == "Very High" {
            boneImageView1.image = UIImage(named: "filledBone")
            boneImageView2.image = UIImage(named: "filledBone")
            boneImageView3.image = UIImage(named: "filledBone")
            boneImageView4.image = UIImage(named: "filledBone")
            boneImageView5.image = UIImage(named: "filledBone")
        }
        
        
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

