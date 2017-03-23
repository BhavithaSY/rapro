//
//  SetttingsViewController.swift
//  jj77
//
//  Created by Bhavithasai yendrathi on 3/19/17.
//  Copyright © 2017 Bhavithasai yendrathi. All rights reserved.
//

import UIKit

class SetttingsViewController: UIViewController {
    
    @IBAction func addingCategoryAction(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "addcategory", sender: self)
        
        
    }
    
    
    
    @IBAction func logoutAction(_ sender: UIButton) {
    }
    
    
    
    
    
    
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
self.navigationItem.title="SETTINGS"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
