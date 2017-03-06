//
//  ViewControllerWithTasksUsabilityStudy.swift
//  jj77
//
//  Created by Bhavithasai yendrathi on 3/4/17.
//  Copyright © 2017 Bhavithasai yendrathi. All rights reserved.
//

import UIKit

class ViewControllerWithTasksUsabilityStudy: UIViewController {
    
    @IBOutlet weak var tableWithTasks: UITableView!
    
    @IBOutlet weak var instructionsDisplay: UITextView!
    
    @IBAction func startObservingAction(_ sender: Any) {
        
      self.performSegue(withIdentifier: "defaultObservationTaking", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "defaultObservationTaking"
        
        {
           if let destination = segue.destination as? ObservationTakingViewController
           {
            destination.navTitle=self.navTitle
            }
        }
    }
    
    
    var navTitle=String()
    var tasksList=["Level1","Level2","Level3","Level4"]
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        print(navTitle)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
        self.navigationItem.title=self.navTitle

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
