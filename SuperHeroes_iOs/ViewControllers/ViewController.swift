//
//  ViewController.swift
//  SuperHeroes_iOs
//
//  Created by Tardes on 18/12/24.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
 
    

    
    
    //@IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    var list: [SuperHeroe] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
       // tableView.dataSource = self
        searchBy(name: "a")
        // Do any additional setup after loading the view.
        
        let searchController = UISearchController(searchResultsController: nil)
                searchController.searchBar.delegate = self
                navigationItem.searchController = searchController
        
       
       
    }
    
    // MARK: CollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SuperHeroCollectionViewCell
        
        let superHeroe = list[indexPath.row]
        
        cell.loadData(superheroe: superHeroe)
        
        return cell
    }
    

    //MARK: CollectionViewDelegatFlowLayout
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       
        let columns = 3
        let spacing = (collectionView.collectionViewLayout as! UICollectionViewFlowLayout).minimumInteritemSpacing
        let screenWidth = collectionView.frame.size.width
        let leftSpace = screenWidth - spacing * CGFloat(columns + 1)
        let width = leftSpace / CGFloat(columns) - 1//some width
        let height = width * 1.33 //ratio
        return CGSize(width: width, height: height)
        
    }
    
    
    

    // MARK: searchController
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let query = searchBar.text!
        
        if (query.isEmpty){
            searchBy(name: "a")
           
        } else {
            
            searchBy(name: query)}
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBy(name: "a")
    }
    //MARK: TableViewDataSource
    
 /*   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SuperHeroeViewCell
        //cell.indicatorView.startAnimating()
        let superHeroe = list[indexPath.row]
        
        cell.loadData(superheroe: superHeroe)
       
       // cell.indicatorView.stopAnimating()
        // implementar metodo render que pinte cada cell
        return cell
    }*/
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "navToDetail", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let detailViewController = segue.destination as! DeatailViewController
        let indexPath = collectionView.indexPathsForSelectedItems![0]
        let superHeroe = list[indexPath.row]
        
        detailViewController.superHeroe = superHeroe
     
        let cell = collectionView.cellForItem (at: indexPath) as? SuperHeroCollectionViewCell
        
        cell?.ImageView.saveImageToCache(forkey: superHeroe.name)
        collectionView.deselectItem(at: indexPath, animated: true)
       
       
    }
    
    
    func searchBy(name: String)
    {
        Task{
            
            do{
                list = try await SuperHeroesProvider.searchSuperHeroesBy(name: name)
                
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
                
            } catch{
                print(error)
            }
            
        }
        
    }
}

