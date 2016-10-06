//
//  ViewController.swift
//  iLoveFido
//
//  Created by Eldon Chan on 9/28/16.
//  Copyright © 2016 Eldon. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    let canMyDogEatLabel = UILabel()
    let canMyDogEatTextField = UITextField()
    let searchButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        createLayout()
        view.backgroundColor = UIColor.yellowColor()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createLayout(){
        
        navigationItem.titleView = UIImageView(image: UIImage(named: "paw"))
        let navigationBar = navigationController!.navigationBar
        navigationBar.tintColor = UIColor.blackColor()
        
        
        view.addSubview(canMyDogEatLabel)
        canMyDogEatLabel.text = "Can My Dog Eat:"
        canMyDogEatLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        canMyDogEatLabel.snp_makeConstraints { (make) in
            make.centerX.equalTo(view.snp_centerX)
            make.top.equalTo(view.snp_top).offset(150)
        }
        
        view.addSubview(canMyDogEatTextField)
        canMyDogEatTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 20))
        canMyDogEatTextField.leftViewMode = UITextFieldViewMode.Always
        canMyDogEatTextField.backgroundColor = UIColor.whiteColor()
        canMyDogEatTextField.placeholder = "Enter the food here"
        canMyDogEatTextField.font = UIFont(name: "HelveticaNeue-Bold", size: 16)
        canMyDogEatTextField.snp_makeConstraints { (make) in
            make.centerX.equalTo(canMyDogEatLabel.snp_centerX)
            make.top.equalTo(canMyDogEatLabel.snp_bottom).offset(20)
            make.left.equalTo(view.snp_left).offset(50)
            make.right.equalTo(view.snp_right).offset(-50)
            make.height.equalTo(view.snp_height).dividedBy(15)
        }
        
        view.addSubview(searchButton)
        searchButton.backgroundColor = UIColor.redColor()
        searchButton.setTitle("Search", forState: .Normal)
        searchButton.addTarget(self, action: #selector(searchButtonTapped), forControlEvents: .TouchUpInside)
        searchButton.snp_makeConstraints { (make) in
            make.top.equalTo(canMyDogEatTextField.snp_bottom).offset(20)
            make.centerX.equalTo(canMyDogEatTextField.snp_centerX)
            make.width.equalTo(canMyDogEatTextField.snp_width).dividedBy(4)
        }
    }
    
    func searchButtonTapped() {
        
        let searchResultVC = SearchResultViewController()
        searchResultVC.search = canMyDogEatTextField.text!
        navigationController?.pushViewController(searchResultVC, animated: true)
    }
    
    
}


