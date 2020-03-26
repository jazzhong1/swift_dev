//
//  ViewController.swift
//  SampleWebView
//
//  Created by SungJin Hong on 2020/03/23.
//  Copyright © 2020 sungjin. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController,WKNavigationDelegate {

    @IBOutlet weak var WebViewMain: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let urlString = "https://www.google.com";
        if let url = URL(string: urlString){ //unwrap optional binding
            let request = URLRequest(url: url);
            WebViewMain.load(request);
            
        }
    }


}

