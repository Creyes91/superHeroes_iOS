//
//  DeatailViewController.swift
//  SuperHeroes_iOs
//
//  Created by Tardes on 19/12/24.
//

import UIKit

class DeatailViewController: UIViewController {
    
    var superHeroe: SuperHeroe!
    //MARK views
    @IBOutlet weak var superImageView: UIImageView!
    @IBOutlet weak var detailView: UIView!
    
    //MARK Biography
    
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var alterEgoLabel: UILabel!
    
    //MARK Views
    
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var statsView: UIView!
    
    // MARK Stats
    
    @IBOutlet weak var inteligenceLabel: UILabel!
    @IBOutlet weak var inteligenceBar: UIProgressView!
    @IBOutlet weak var inteligenceStat: UILabel!
    
    
    @IBOutlet weak var strengthLabel: UILabel!
    @IBOutlet weak var strengthBar: UIProgressView!
    @IBOutlet weak var strengthStat: UILabel!
    
    //MARK segmentedControl
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        
        navigationItem.title = superHeroe.name
        super.viewDidLoad()
        superImageView.loadImageOfCache(forKey: superHeroe.name)
        detailView.layer.cornerRadius = 16
        
        setData()
       

        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func selectDetail(_ sender: UISegmentedControl) {
        
        let index = sender.selectedSegmentIndex
        if (index == 0)
        {
            infoView.isHidden = false
            statsView.isHidden = true
            
        }else{
            infoView.isHidden = true
            statsView.isHidden = false
            
        }
        
    }
    
    func setData()
    {
        inteligenceStat.text = superHeroe.powerstats.intelligence
        inteligenceBar.progress = (Float(inteligenceStat.text!)!)/100
        
        let aux = superHeroe.biography.realName
        
        if (aux == "")
        {
            
            fullNameLabel.text! += " No Real Name"
        }else{
            fullNameLabel.text! += " \(aux)"
        }
        
        
        alterEgoLabel.text! += superHeroe.biography.placeOfBirth
        
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
