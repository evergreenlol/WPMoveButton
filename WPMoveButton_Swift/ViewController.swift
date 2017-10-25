//
//  ViewController.swift
//  WPMoveButton_Swift
//
//  Created by wp on 2017/10/20.
//  Copyright © 2017年 wp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        creatMoveButton()
    }

    func creatMoveButton(){
        
        let buttonW : CGFloat  = 50
        let buttonH = buttonW
        let buttonX : CGFloat = UIScreen.main.bounds.size.width - buttonW
        let buttonY : CGFloat = UIScreen.main.bounds.size.width - buttonW * 2
        
        let movableButton = WPMoveButton(type:.custom)
        movableButton.frame = CGRect(x:buttonX,y:buttonY,width:buttonW,height:buttonH)
        movableButton.addTarget(self, action: #selector(buttonClick), for: .touchUpInside)
        
        movableButton.layer.cornerRadius = buttonW/2
        movableButton.layer.masksToBounds = true
        
        movableButton.setImage(UIImage.init(named:"float"), for:.normal)
        self.view.addSubview(movableButton)
    }
    
    @objc func buttonClick() {
        let alert:UIAlertController = UIAlertController(title: "", message: "随便写", preferredStyle:.alert)
        let action1:UIAlertAction = UIAlertAction(title: "是", style: .default) { (action) in
            // 在这个回调里实现点击
        }
        let action2:UIAlertAction = UIAlertAction(title: "否", style: .cancel) { (action) in
            // 在这个回调里实现点击
        }
        alert.addAction(action1)
        alert.addAction(action2)
        self.present(alert, animated: false, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

