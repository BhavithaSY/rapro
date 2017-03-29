//
//  CategoriesViewController.swift
//  jj77
//
//  Created by Bhavithasai yendrathi on 2/23/17.
//  Copyright © 2017 Bhavithasai yendrathi. All rights reserved.
//

import UIKit

class CategoriesViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    var catDb=[String]()
    var catsubsDb=[String]()
    var email=String()
    var firstTimeLoaded=Bool()
    var firstTimeLogin=Int()
    //var categories:[String]=["Usability Study ","Focus Groups","Dynamic systems observations"]
   // var categoriesSubtitle:[String]=["Testing the usage of each developed product","REquirements gathering observations","Testing the products in mobile environment"]
    var selectedCategory:String = ""
    
    
    @IBOutlet weak var CategoriesTable: UITableView!
    
    @IBOutlet weak var customizingView: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        self.tabBarController?.navigationItem.title="CATEGORIES"
        self.tabBarController?.navigationItem.setHidesBackButton(true, animated: true)
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
        
            super.viewWillAppear(animated)
            self.navigationController?.isNavigationBarHidden = false
        self.tabBarController?.navigationItem.title="CATEGORIES"
        self.tabBarController?.navigationItem.setHidesBackButton(true, animated: true)
        email=UserDefaults.standard.string(forKey: "Email")!
        firstTimeLogin=UserDefaults.standard.integer(forKey: "FirstTimeLogin")
        //print(email)
        //print(firstTimeLogin)
//        if firstTimeLogin == 1
//        {
            // here fetch the categories and subtitle form database categories default table
            let request = NSMutableURLRequest(url:NSURL(string:"http://localhost:8888/PHP/DataCollection/categoriesData.php")! as URL)
            request.httpMethod="POST"
            print(self.firstTimeLogin)
            let postString = "email=\(self.email)&firstLogin=\(self.firstTimeLogin)"
            request.httpBody = postString.data(using: String.Encoding.utf8)
            let task = URLSession.shared.dataTask(with: request as URLRequest){
                data, response, error in
                if error == nil
                    
                {
                    print("entered error is nil")
                    DispatchQueue.main.async (execute: { () -> Void in
                        
                        do {
                            //get json result
                            //print("entered do")
                            let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? [[String:String]]
                            //assign json to new var parsejson in secured way
                            guard json != nil else
                            {
                                print("error")
                                return
                            }
                            
                            //print(json)
                            //print(json?.count)
                            
                            for var i in 0 ..< (json?.count)!
                            {
                                self.catDb.append((json?[i]["CName"]!)!)
                            }
                            for var i in 0 ..< (json?.count)!
                            {
                                self.catsubsDb.append((json?[i]["Csubtitle"]!)!)
                            }
                            self.CategoriesTable.reloadData()
                            
                            
                        }catch
                        {
                            print("error: \(error)")
                        }
                        //print("response = \(response)")
                        let responseString = NSString(data: data!,encoding:String.Encoding.utf8.rawValue)
                        print("response string = \(responseString!)")
                    
                    })
                    
                    
                }
                else
                {
                    
                    return
                }
            }//task closing
            task.resume()
     }
    override func viewWillDisappear(_ animated: Bool) {
        self.catDb.removeAll()
        self.catsubsDb.removeAll()
    }
     func numberOfSections(CategoriesTable: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
     func tableView(_ CategoriesTable: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //return categories.count
        return self.catDb.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Select Observation Type"
    }
    
     func tableView(_ CategoriesTable: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = CategoriesTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        //cell.textLabel?.text=categories[indexPath.row]
        cell.textLabel?.text=self.catDb[indexPath.row]
       //cell.detailTextLabel?.text=categoriesSubtitle[indexPath.row]
        cell.detailTextLabel?.text=self.catsubsDb[indexPath.row]
        
        // Configure the cell...
        
        return cell
    }

    func tableView(_ CategoriesTable: UITableView, didSelectRowAt indexPath: IndexPath)
    {
       // print("User selected table row \(indexPath.row) and item \(categories[indexPath.row])")
        //selectedCategory=categories[indexPath.row]
        self.selectedCategory=self.catDb[indexPath.row]
        let ac = UIAlertController(title: "Title", message: "please choose the observation type", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Customize", style: .default) { (_) in
            //presentViewController(yourSetupController, animated: true, completion: nil)
            self.customizingView.isHidden=false
            
        }
        ac.addAction(okAction)
        let cancelAction = UIAlertAction(title: "Default", style: .default) { (_) in
            self.performSegue(withIdentifier: "pageWithTasks", sender: self)
            //print("Hello")
//            let storyboardid = UIStoryboard(name: "categoriesBoard1", bundle: nil)
//            let controller = storyboardid.instantiateViewController(withIdentifier: "observationtakingboard")
//            self.present(controller, animated: true, completion: nil)
        }
        
        
        ac.addAction(cancelAction)
        present(ac, animated: true, completion: nil)
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "pageWithTasks"
        {
            if let destinName=segue.destination as? ViewControllerWithTasksUsabilityStudy
            {
               destinName.navTitle=self.selectedCategory
            }
        }
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
