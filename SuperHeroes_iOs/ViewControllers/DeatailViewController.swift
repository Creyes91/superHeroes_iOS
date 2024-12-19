//
//  DeatailViewController.swift
//  SuperHeroes_iOs
//
//  Created by Tardes on 19/12/24.
//

import UIKit

class DeatailViewController: UIViewController {
    
    var superHeroe: SuperHeroe!

    @IBOutlet weak var superImageView: UIImageView!
    override func viewDidLoad() {
        
        navigationItem.title = superHeroe.name
        super.viewDidLoad()
        superImageView.loadImageOfCache(forKey: superHeroe.name)

        // Do any additional setup after loading the view.
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
