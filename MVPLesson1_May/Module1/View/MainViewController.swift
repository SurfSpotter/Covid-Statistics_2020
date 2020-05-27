//
//  ViewController.swift
//  MVPLesson1_May
//
//  Created by Алексей Чигарских on 27.05.2020.
//  Copyright © 2020 Алексей Чигарских. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {


 // не забывааем в сториборде протянуть связи от таблицы  к Owner ( DataSource, Delegate ), Иначе нихрена работать е будет!
    @IBOutlet weak var tableView: UITableView!
    

    
    
// Инициализируем Presenter в этом View
    
    var presenter: MainViewPresetnterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // регистрируем таблицу
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
   
    
}


extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        let comment = presenter.comments?.count ?? 0
        return comment
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let comments = presenter.comments?[indexPath.row]
        cell.textLabel?.text = comments?.body
        return cell
    }
    
    
}


extension MainViewController: MainViewProtocol {
    func success() {
        tableView.reloadData()
    }
    
    func failure(error: Error) {
        print(error.localizedDescription)
    }
    
    
}
