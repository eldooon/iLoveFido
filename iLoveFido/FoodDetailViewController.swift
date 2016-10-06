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
        view.backgroundColor = UIColor.whiteColor()
        createLayout()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        
    }
    
    func createLayout(){
        
        navigationItem.titleView = UIImageView(image: UIImage(named: "paw"))
        let navigationBar = navigationController!.navigationBar
        navigationBar.tintColor = UIColor.blackColor()
        
        view.addSubview(scrollView)
        scrollView.scrollEnabled = true
        scrollView.showsVerticalScrollIndicator = true
        scrollView.userInteractionEnabled = true
        scrollView.backgroundColor = UIColor.whiteColor()
        scrollView.snp_makeConstraints { (make) in
            make.top.equalTo(view.snp_top)
            make.left.equalTo(view.snp_left)
            make.right.equalTo(view.snp_right)
            make.bottom.equalTo(view.snp_bottom).offset(-100)
        }
        
        
        scrollView.addSubview(foodImageView)
        foodImageView.snp_makeConstraints { (make) in
            make.top.equalTo(scrollView.snp_top)
            make.left.equalTo(view.snp_left)
            make.right.equalTo(view.snp_right)
            make.height.equalTo(view.snp_height).dividedBy(2.5)
        }
        
        scrollView.addSubview(darkenView)
        darkenView.backgroundColor = UIColor.blackColor()
        darkenView.layer.opacity = 0.5
        darkenView.snp_makeConstraints { (make) in
            make.centerX.equalTo(foodImageView.snp_centerX)
            make.centerY.equalTo(foodImageView.snp_centerY)
            make.width.equalTo(foodImageView.snp_width)
            make.height.equalTo(foodImageView.snp_height)
        }
        
        scrollView.addSubview(foodNameLabel)
        foodNameLabel.textAlignment = NSTextAlignment.Center
        foodNameLabel.textColor = UIColor.whiteColor()
        foodNameLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 32)
        foodNameLabel.snp_makeConstraints { (make) in
            make.centerX.equalTo(view.snp_centerX)
            make.top.equalTo(foodImageView.snp_centerY).offset(20)
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
        foodStatusImageView.snp_makeConstraints { (make) in
            make.bottom.equalTo(foodNameLabel.snp_top).offset(-10)
            make.centerX.equalTo(foodNameLabel.snp_centerX)
            make.width.equalTo(foodImageView.snp_width).dividedBy(5)
            make.height.equalTo(foodImageView.snp_width).dividedBy(5)
        }
    
        
        view.addSubview(boneImageView3)
        boneImageView3.image = UIImage(named: "bone")
        boneImageView3.snp_makeConstraints { (make) in
            make.top.equalTo(foodNameLabel.snp_bottom).offset(10)
            make.centerX.equalTo(foodNameLabel.snp_centerX)
            make.width.equalTo(view.snp_width).dividedBy(18)
            make.height.equalTo(view.snp_width).dividedBy(18)
        }
        
        view.addSubview(boneImageView2)
        boneImageView2.image = UIImage(named: "bone")
        boneImageView2.snp_makeConstraints { (make) in
            make.top.equalTo(boneImageView3.snp_top)
            make.right.equalTo(boneImageView3.snp_left).offset(1)
            make.width.equalTo(boneImageView3.snp_width)
            make.height.equalTo(boneImageView3.snp_width)
        }
        
        view.addSubview(boneImageView1)
        boneImageView1.image = UIImage(named: "bone")
        boneImageView1.snp_makeConstraints { (make) in
            make.top.equalTo(boneImageView2.snp_top)
            make.right.equalTo(boneImageView2.snp_left).offset(1)
            make.width.equalTo(boneImageView2.snp_width)
            make.height.equalTo(boneImageView2.snp_width)
        }
        
        view.addSubview(boneImageView4)
        boneImageView4.image = UIImage(named: "bone")
        boneImageView4.snp_makeConstraints { (make) in
            make.top.equalTo(boneImageView3.snp_top)
            make.left.equalTo(boneImageView3.snp_right).offset(1)
            make.width.equalTo(boneImageView3.snp_width)
            make.height.equalTo(boneImageView3.snp_width)
        }
        
        view.addSubview(boneImageView5)
        boneImageView5.image = UIImage(named: "bone")
        boneImageView5.snp_makeConstraints { (make) in
            make.top.equalTo(boneImageView4.snp_top)
            make.left.equalTo(boneImageView4.snp_right).offset(1)
            make.width.equalTo(boneImageView4.snp_width)
            make.height.equalTo(boneImageView4.snp_width)
        }
        
        view.addSubview(informationLabel)
        informationLabel.text = "Information"
        informationLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        informationLabel.snp_makeConstraints { (make) in
            make.centerX.equalTo(view.snp_centerX)
            make.top.equalTo(foodImageView.snp_bottom).offset(20)
        }
        
        view.addSubview(seperatorLineImageView)
        seperatorLineImageView.backgroundColor = UIColor.grayColor()
        seperatorLineImageView.snp_makeConstraints { (make) in
            make.top.equalTo(informationLabel.snp_bottom).offset(10)
            make.centerX.equalTo(view.snp_centerX)
            make.height.equalTo(1)
            make.width.equalTo(view.snp_width).offset(-100)
        }
        
        view.addSubview(safeLabel)
        safeLabel.text = "Is it Safe:"
        safeLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 14)
        safeLabel.snp_makeConstraints { (make) in
            make.top.equalTo(seperatorLineImageView.snp_bottom).offset(20)
            make.left.equalTo(view.snp_left).offset(20)
        }
        
        view.addSubview(safeStatusLabel)
        safeStatusLabel.text = "\(foodStatus)"
        safeStatusLabel.font = UIFont(name: "HelveticaNeue", size: 14)
        if foodStatus == "Yes" {
            safeStatusLabel.textColor = UIColor.greenColor()
        }
        else if foodStatus == "Warning" {
            safeStatusLabel.textColor = UIColor.orangeColor()
        }
        else {
            safeStatusLabel.textColor = UIColor.redColor()
        }
        safeStatusLabel.snp_makeConstraints { (make) in
            make.top.equalTo(safeLabel.snp_top)
            make.left.equalTo(safeLabel.snp_right).offset(5)
        }
        
        view.addSubview(recommendedLabel)
        recommendedLabel.text = "Recommended:"
        recommendedLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 14)
        recommendedLabel.snp_makeConstraints { (make) in
            make.top.equalTo(safeLabel.snp_bottom).offset(5)
            make.left.equalTo(view.snp_left).offset(20)
        }
        
        view.addSubview(recommendedStatusLabel)
        recommendedStatusLabel.text = "\(foodRecommend)"
        recommendedStatusLabel.font = UIFont(name: "HelveticaNeue", size: 14)
        recommendedStatusLabel.snp_makeConstraints { (make) in
            make.top.equalTo(recommendedLabel.snp_top)
            make.left.equalTo(recommendedLabel.snp_right).offset(5)
        }
        
        view.addSubview(suggestionLabel)
        suggestionLabel.text = "Suggestion:"
        suggestionLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 14)
        suggestionLabel.snp_makeConstraints { (make) in
            make.top.equalTo(recommendedLabel.snp_bottom).offset(5)
            make.left.equalTo(recommendedLabel.snp_left)
        }
        
        view.addSubview(suggestionStatusLabel)
        suggestionStatusLabel.text = "\(foodSuggestion)"
        suggestionStatusLabel.font = UIFont(name: "HelveticaNeue", size: 14)
        suggestionStatusLabel.snp_makeConstraints { (make) in
            make.top.equalTo(suggestionLabel.snp_top)
            make.left.equalTo(suggestionLabel.snp_right).offset(5)
        }
        
        view.addSubview(foodDescriptionLabel)
        foodDescriptionLabel.text = "Description:"
        foodDescriptionLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 14)
        foodDescriptionLabel.snp_makeConstraints { (make) in
            make.top.equalTo(suggestionLabel.snp_bottom).offset(5)
            make.left.equalTo(suggestionLabel.snp_left)
        }
        
        view.addSubview(foodDescriptionTextView)
        foodDescriptionTextView.editable = false
        foodDescriptionTextView.font = UIFont(name: "HelveticaNeue", size: 14)
        foodDescriptionTextView.snp_makeConstraints { (make) in
            make.top.equalTo(foodDescriptionLabel.snp_bottom).offset(5)
            make.left.equalTo(foodDescriptionLabel.snp_left)
            make.right.equalTo(view.snp_right).offset(-20)
            make.height.equalTo(view.snp_width) //NEEDS TO BE CHANGED
            
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

