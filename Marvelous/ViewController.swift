//
//  ViewController.swift
//  Marvelous
//
//  Created by Mark Turner on 11/9/18.
//  Copyright © 2018 Mark Turner. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource {
    
    @IBOutlet weak var marvellousTableView: UITableView!
    var marvellousData = [Character](){
        didSet{
            DispatchQueue.main.async { [unowned self] in
                self.marvellousTableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        marvellousTableView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
}
    override func viewWillAppear(_ animated: Bool) {
        let marvelAPI = MarvelAPI()
        marvelAPI.loadCharacters(offset: 1, limit: 50, success: { (responce) in
            self.marvellousData = responce.results
        }) { (error) in
            print("\(error)")
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return marvellousData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = marvellousTableView.dequeueReusableCell(withIdentifier: "mainCell") as! ViewControllerTableViewCell
        cell.configureCell(cell, atIndexPath: indexPath, withDataSource : marvellousData[indexPath.row])
        return cell
        
    }
    
    

}


