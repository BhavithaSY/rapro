//
//  ObservationTakingViewController.swift
//  jj77
//
//  Created by Bhavithasai yendrathi on 2/23/17.
//  Copyright © 2017 Bhavithasai yendrathi. All rights reserved.
//

import UIKit

class ObservationTakingViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,showAlertOnCLick {

    @IBOutlet weak var table1: UITableView!
    
    @IBOutlet weak var table2: UITableView!
    
    
    
    
    var categories:[String]=["Usability Study ","Focus Groups","Dynamic systems observations"]
    var heightforHeader=44
    var widthforHeader=335
    var coloumns:[String]=["Errors","Content","Severity Level","Impact on User"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.table1.delegate=self
        self.table1.dataSource=self
        table1.layer.masksToBounds = true
       table1.layer.borderColor = UIColor( red:204/255, green:204/255, blue:204/255, alpha:1.0 ).cgColor
               table1.layer.borderWidth = 2.0

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfSections(in table1: UITableView) -> Int {
        return 1
    }
    func tableView(_ table1: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return categories.count
    }
    
    
    func tableView(_ table1: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell1 = table1.dequeueReusableCell(withIdentifier: "cell1", for: indexPath)
        cell1.textLabel?.text=categories[indexPath.row]
        
        
        return cell1
    }
    func tableView(_ table1: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(heightforHeader)
    }
    
    func tableView(_ table1: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header=Bundle.main.loadNibNamed("TableViewCellHeader", owner: self, options: nil)?.first as! TableViewCellHeader
        //        let contetnview=UIView(frame:header.frame)
        //        header.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        //        contetnview.addSubview(header)
        
        header.changenameonclick.setTitle("\(coloumns[1])", for: .normal)
        header.delegate=self
        header.headerCellSection=section
        
        return header
    }
    
    
    func tableView(_ table1: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete
        {
            categories.remove(at: indexPath.row)
            table1.reloadData()
        }
        
    }
    func showAlertWithText()
    {
        //create alert controller
        let alert=UIAlertController(title:"Error type",message:"Please enter the type of error",preferredStyle:.alert)
        //cancel action
        let cancel=UIAlertAction(title:"Cancel",style:UIAlertActionStyle.cancel,handler:nil)
        alert.addAction(cancel)
        
        //ok action
        let ok=UIAlertAction(title:"OK",style:UIAlertActionStyle.default){(_) in
            let alertTextField=alert.textFields?[0]
            
            
            self.categories.append((alertTextField?.text)!)
            self.table1.reloadData()
        }
        alert.addAction(ok)
        
        //add text field
        alert.addTextField { (textfield:UITextField) in
            //can customize the text field here
            textfield.placeholder="Enter Error name here"
        }
        
        //present on screen
        self.present(alert,animated:true,completion:nil)
        
        
    }
    //alert function for editing header
    func showAlertWithTextforHeader()
    {
       
        var changetext=""
        //create alert controller
        let alert=UIAlertController(title:"Error type",message:"Please enter the name",preferredStyle:.alert)
        //cancel action
        let cancel=UIAlertAction(title:"Cancel",style:UIAlertActionStyle.cancel,handler:nil)
        alert.addAction(cancel)
        
        //ok action
        let ok=UIAlertAction(title:"OK",style:UIAlertActionStyle.default){(_) in
            let alertTextField=alert.textFields?[0]
            
            print(alertTextField?.text)
            changetext=(alertTextField?.text)!
            print(changetext)
            self.coloumns[1]=changetext
            self.table1.reloadData()
            
            
        }
        alert.addAction(ok)
        
        //add text field
        alert.addTextField { (textfield:UITextField) in
            //can customize the text field here
            textfield.placeholder="Enter name here"
        }
        
        //present on screen
        self.present(alert,animated:true,completion:nil)
        print("the text to send: \(changetext)")
        //return changetext
        
        
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
