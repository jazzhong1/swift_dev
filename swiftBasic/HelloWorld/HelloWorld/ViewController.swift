//
//  ViewController.swift
//  HelloWorld
//
//  Created by SungJin Hong on 2020/03/23.
//  Copyright © 2020 sungjin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func Click_moveBtn(_ sender: UIButton) {
        //StoryBoard finde Controller
        //optional Binding
        if let controller = self.storyboard?.instantiateViewController(withIdentifier: "DetailController"){
            //move Controller or push? add?
            self.navigationController?.pushViewController(controller, animated: true);
            print("ok");
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

