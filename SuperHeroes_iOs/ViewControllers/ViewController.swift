//
//  ViewController.swift
//  SuperHeroes_iOs
//
//  Created by Tardes on 18/12/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var list: [SuperHeroe] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }


    //MARK TableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as SuperHeroeViewCell
        
        let SuperHeroe = list[indexPath.row]
        
        // implementar metodo render que pinte cada cell
        return cell
    }
}

