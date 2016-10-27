//
//  ViewController.swift
//  iLoveFido
//
//  Created by Eldon Chan on 9/28/16.
//  Copyright © 2016 Eldon. All rights reserved.
//

import UIKit
import SnapKit
import FirebaseDatabase


class ViewController: UIViewController {

    let canMyDogEatLabel = UILabel()
    let canMyDogEatTextField = UITextField()
    let searchButton = UIButton()
    var shared = FoodDatabase.sharedInstance

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        createLayout()
        view.backgroundColor = UIColor.yellow
        shared.getFoodDatabase()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createLayout(){
        
        navigationItem.titleView = UIImageView(image: UIImage(named: "paw"))
        let navigationBar = navigationController!.navigationBar
        navigationBar.tintColor = UIColor.black
        
        
        view.addSubview(canMyDogEatLabel)
        canMyDogEatLabel.text = "Can My Dog Eat:"
        canMyDogEatLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        canMyDogEatLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(view.snp.centerX)
            make.top.equalTo(view.snp.top).offset(150)
        }
        
        view.addSubview(canMyDogEatTextField)
        canMyDogEatTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 20))
        canMyDogEatTextField.leftViewMode = UITextFieldViewMode.always
        canMyDogEatTextField.backgroundColor = UIColor.white
        canMyDogEatTextField.placeholder = "Enter the food here"
        canMyDogEatTextField.font = UIFont(name: "HelveticaNeue-Bold", size: 16)
        canMyDogEatTextField.snp.makeConstraints { (make) in
            make.centerX.equalTo(canMyDogEatLabel.snp.centerX)
            make.top.equalTo(canMyDogEatLabel.snp.bottom).offset(20)
            make.left.equalTo(view.snp.left).offset(50)
            make.right.equalTo(view.snp.right).offset(-50)
            make.height.equalTo(view.snp.height).dividedBy(15)
        }
        
        view.addSubview(searchButton)
        searchButton.backgroundColor = UIColor.red
        searchButton.setTitle("Search", for: UIControlState())
        searchButton.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
        searchButton.snp.makeConstraints { (make) in
            make.top.equalTo(canMyDogEatTextField.snp.bottom).offset(20)
            make.centerX.equalTo(canMyDogEatTextField.snp.centerX)
            make.width.equalTo(canMyDogEatTextField.snp.width).dividedBy(4)
        }
    }
    
    func searchButtonTapped() {
        
        let searchResultVC = SearchResultViewController()
        searchResultVC.search = canMyDogEatTextField.text!
        navigationController?.pushViewController(searchResultVC, animated: true)
    }
    
    
}


