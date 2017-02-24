//
//  CategoriesViewController.swift
//  jj77
//
//  Created by Bhavithasai yendrathi on 2/23/17.
//  Copyright © 2017 Bhavithasai yendrathi. All rights reserved.
//

import UIKit

class CategoriesViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    var categories:[String]=["Usability Study ","Focus Groups","Dynamic systems observations"]
    var categoriesSubtitle:[String]=["Testing the usage of each developed product","REquirements gathering observations","Testing the products in mobile environment"]
    var selectedCategory:String = ""
    
    
    @IBOutlet weak var CategoriesTable: UITableView!
    
    @IBOutlet weak var customizingView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CategoriesTable.delegate = self
        CategoriesTable.dataSource = self
        CategoriesTable.reloadData()
        customizingView.isHidden=true
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
    }
     func numberOfSections(CategoriesTable: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
     func tableView(_ CategoriesTable: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return categories.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Select Observation Type"
    }
    
     func tableView(_ CategoriesTable: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = CategoriesTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text=categories[indexPath.row]
       cell.detailTextLabel?.text=categoriesSubtitle[indexPath.row]
        
        // Configure the cell...
        
        return cell
    }

    func tableView(_ CategoriesTable: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        print("User selected table row \(indexPath.row) and item \(categories[indexPath.row])")
        let ac = UIAlertController(title: "Title", message: "please choose the observation type", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Customize", style: .default) { (_) in
            //presentViewController(yourSetupController, animated: true, completion: nil)
            self.customizingView.isHidden=false
            
        }
        ac.addAction(okAction)
        let cancelAction = UIAlertAction(title: "Default", style: .default) { (_) in
            self.performSegue(withIdentifier: "defaultObserverView", sender: self)
//            let storyboardid = UIStoryboard(name: "categoriesBoard1", bundle: nil)
//            let controller = storyboardid.instantiateViewController(withIdentifier: "observationtakingboard")
//            self.present(controller, animated: true, completion: nil)
        }
        
        
        ac.addAction(cancelAction)
        present(ac, animated: true, completion: nil)
        
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
