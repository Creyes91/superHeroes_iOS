//
//  ViewController.swift
//  SuperHeroes_iOs
//
//  Created by Tardes on 18/12/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UISearchBarDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var list: [SuperHeroe] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.dataSource = self
        searchBy(name: "a")
        // Do any additional setup after loading the view.
        
        let searchController = UISearchController(searchResultsController: nil)
                searchController.searchBar.delegate = self
                navigationItem.searchController = searchController
        
       
       
    }
    

    // MARK searchController
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let query = searchBar.text!
        
        searchBy(name: query)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBy(name: "a")
    }
    //MARK TableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SuperHeroeViewCell
        
        let superHeroe = list[indexPath.row]
        
        cell.loadData(superheroe: superHeroe)
        cell.indicatorView.stopAnimating()
        // implementar metodo render que pinte cada cell
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let detailViewController = segue.destination as! DeatailViewController
        let indexPath = tableView.indexPathForSelectedRow!
        let superHeroe = list[indexPath.row]
        
        detailViewController.superHeroe = superHeroe
     
        let cell = tableView.cellForRow(at: indexPath) as? SuperHeroeViewCell
        
        cell?.superImageView.saveImageToCache(forkey: superHeroe.name)
       
    }
    
    
    func searchBy(name: String)
    {
        Task{
            
            do{
                list = try await SuperHeroesProvider.searchSuperHeroesBy(name: name)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            } catch{
                print(error)
            }
            
        }
        
    }
}

