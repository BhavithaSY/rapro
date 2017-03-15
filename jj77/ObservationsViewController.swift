//
//  ObservationsViewController.swift
//  jj77
//
//  Created by Bhavithasai yendrathi on 2/23/17.
//  Copyright © 2017 Bhavithasai yendrathi. All rights reserved.
//

import UIKit

class ObservationsViewController: UIViewController {
    
    @IBOutlet weak var addNewObservation: UIButton!
    
    @IBAction func addnewobservationaction(_ sender: UIButton) {
        
        tabBarController?.selectedIndex=1
        
        
        
    }
    
  
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
        self.tabBarController?.navigationItem.setHidesBackButton(true, animated: true)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "\(UserDefaults.standard.string(forKey: "UserName")!)", style: .plain, target: self, action: #selector(nameTapped))
        

    }

    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        self.tabBarController?.navigationItem.setHidesBackButton(true, animated: true)
        let right = UIBarButtonItem(title: "\(UserDefaults.standard.string(forKey: "UserName")!)", style: .plain, target: self, action: #selector(nameTapped))
        self.tabBarController?.navigationItem.setRightBarButton(right, animated: true)
        self.navigationController?.title="Observations"
       
        
        
        

        // Do any additional setup after loading the view.
    }

    func nameTapped()
    {
        tabBarController?.selectedIndex=2
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
