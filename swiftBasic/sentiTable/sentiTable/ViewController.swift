//
//  ViewController.swift
//  sentiTable
//
//  Created by SungJin Hong on 2020/03/24.
//  Copyright © 2020 stentiTable. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var TableViewMain: UITableView!
    
    var newsData :  Array<Dictionary<String,Any>>?;
    var index : Int?;
    // 1.Http 통신 방법 -urlSession
    // 2.Json 통신 규격
    // 3.Table View Data 매칭 callback 쏴줘야지;;
    
    // 비동기
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) ->Int {
    //데이터 몇개...(2)
        if let news = self.newsData{
            return news.count;
        }
        else{
            return 1;
        }
    }
    func getNews(){
       let task = URLSession.shared.dataTask(with: URL(string:"http://newsapi.org/v2/top-headlines?country=kr&apiKey=afbce1b4cd664afabaa954b95a0db2d0")!) { (data, response, error) in
        //print("response : \(String(describing: response))");
        if let dataJson=data{
               //json Parsing...
                do{
                    let jsonData = try JSONSerialization.jsonObject(with: data!, options: []) as! Dictionary<String,Any >;
                    
                    let articles = jsonData["articles"] as! Array<Dictionary<String,Any>>;
                    self.newsData = articles;
                    DispatchQueue.main.async {
                        self.TableViewMain.reloadData();

                    }
                }
                catch{
                    print("Got an error: \(error)")
                }
        
            }
        }
   
        task.resume();
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->
        //데이터 무엇? ..(1)
        UITableViewCell {
            //let cell = UITableViewCell.init(style: .default, reuseIdentifier: "TableCellType1");
            
            //cell을 재활용 하지 않으면..뻣음...
            //특정한 cell을 재사용함...naming?같은 느낌?
            //cell.textLabel?.text = "cell\(indexPath.row)";
            
            let cell = TableViewMain.dequeueReusableCell(withIdentifier: "Type1", for: indexPath) as! Type1 //바인딩...ㄷㄷ
            let idx = indexPath.row;
            if let news = self.newsData{
                let row = news[idx];
                if let v = row as? Dictionary<String,Any>{
                    if let title = v["title"] as? String{
                        cell.LabelText.text = "\(String(describing: title))";
                    }
                }
                else{
                    cell.LabelText.text = "안들어옴";
                }
            }
            return cell;
    }
    //1. 옵션 클릭감지
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil);
        let controller = storyBoard.instantiateViewController(identifier:"NewsController") as! NewsDetailController;
        if parseJsonData(controller){
           //showDetailViewController(controller, sender: nil);
        }
        
    }
    
    //2. segueWay 방법
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let id = segue.identifier, "NewsDetail" == id{
            if let controller = segue.destination as? NewsDetailController{
                parseJsonData(controller);
            }
        }
        //자동으로 됨...
    }
    
    //1.Detail 상세 화면을 만듬
    //2.값을 보내기
    
    //1.tableView Delegate, 2.storyBoard (segueWay)
    //2.값을 이동... (이동하기전에 값을 미리 셋팅 해야한다.)
    func parseJsonData(_ controller:NewsDetailController) -> Bool {
        var result : Bool = false;
        if let news = self.newsData{
            if let indexPath = TableViewMain.indexPathForSelectedRow{
                let row = news[indexPath.row];
                    if let v = row as? Dictionary<String,Any>{
                        if let imageURL = v["urlToImage"] as? String{
                            controller.imageURL = imageURL;
                            result = true;
                        }
                            result = false;
                        if let des = v["description"] as? String{
                            controller.des = des;
                            result = true;
                        }
                               
                    }
                }
            }
        
        return true;
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        TableViewMain.delegate = self;
        TableViewMain.dataSource = self;
        getNews();
        // Do any additional setup after loading the view.
    }
    
    
    /*tableView 로 된 뷰 - 여러개의 행이 모여있는 View
    tableView 로 된 뷰 - 여러개의 행이 모여있는 View 1
    ...
    정갈하게 보여주기위해... 전화번호부?
    1. 데이터가 무엇?
    2. 데이터가 몇개?
    3.(옵션) 데이터 행을 눌렀을때
    */

}

