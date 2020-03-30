//
//  NewsDetailController.swift
//  sentiTable
//
//  Created by SungJin Hong on 2020/03/29.
//  Copyright © 2020 stentiTable. All rights reserved.
//


import UIKit

class NewsDetailController: UIViewController {
    @IBOutlet weak var ImageMain: UIImageView!
    @IBOutlet weak var LabelMain: UILabel!
    
    //1.imageURL,
    //2.descryption
    
    var imageURL:String?;
    var des:String?;
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        //체크
        if let img = imageURL{
            //이미지를 가져와 서 뿌린다.
            //Data.init 백그라운드...
            if let data  = try? Data.init(contentsOf: URL(string:img)!) { 
                DispatchQueue.main.async {
                    self.ImageMain.image = UIImage(data: data);
                }
            }
        }
        
        if let d = des{
            //정보를 가져온다
            self.LabelMain.text = d;
        }
    }
}
