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
    
    @IBOutlet weak var table3: UITableView!
    
    @IBOutlet weak var table4: UITableView!
    
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var startTimerButton: UIButton!
    
    @IBOutlet weak var detailsTable: UITableView!
    
    @IBAction func DoneObservationTaking(_ sender: UIButton) {
       //save the selected table fields to array od dictionaries.
       
        self.noOfTimeDoneClciked = self.noOfTimeDoneClciked+1
        let endTime=self.timerLabel.text
        self.selectedData["End Time"]=endTime
        if(firstTimeDoneClick==true)
        {
            
            self.selectedData["Start Time"]="00:00:00"
        }
        else
        {
            //print(self.dataObserved[noOfTimeDoneClciked-2]["End Time"])
            self.selectedData["Start Time"]=self.dataObserved[noOfTimeDoneClciked-2]["End Time"]
        }
        dataObserved.append(self.selectedData)
        self.detailsTable.reloadData()
        self.selectedData.removeAll()
        
        self.firstTimeDoneClick=false
        print(dataObserved)
        print(selectedData)
            }
  
    
    
    @IBAction func stopTimerAction(_ sender: UIButton) {
        flagForTimerbeingpausedorstopped=true
        self.startTimerButton.setImage(UIImage(named : "Play Filled-50"), for: .normal)
        self.navigationController?.setNavigationBarHidden(false,animated: true)
        
        self.currenttime=0
        self.timerLabel.text="00:00:00"
        timer?.invalidate()
        //disabling table selection
        table4.allowsSelection=false
        table3.allowsSelection=false
        table2.allowsSelection=false
        table1.allowsSelection=false
    }
    
    @IBAction func starTimerAction(_ sender: UIButton) {
        //self.flagForTimer=true
        
        if timer != nil
        {
            flagForTimerbeingpausedorstopped=true
            self.navigationController?.setNavigationBarHidden(false,animated: true)
           self.startTimerButton.setImage(UIImage(named : "Play Filled-50"), for: .normal)
            timer?.invalidate()
            timer=nil
            //disabling tabe selection
            table4.allowsSelection=false
            table3.allowsSelection=false
            table2.allowsSelection=false
            table1.allowsSelection=false
            
            
        }
        else
        {
            
            flagForTimerbeingpausedorstopped=false
            self.navigationController?.setNavigationBarHidden(true,animated: true)
            self.startTimerButton.setImage(UIImage(named : "Pause Filled-50"), for: .normal)
            timer=Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true){ _ in
                self.currenttime += 1
                let hours = String(format:"%02d",self.currenttime / 3600)
                let minutes = String(format: "%02d", self.currenttime / 60)
                let seconds = String(format:"%02d",self.currenttime % 60)
                self.timerLabel.text="\(hours):\(minutes):\(seconds)"
                
                //enabling table selection
                self.table4.allowsSelection=true
                self.table3.allowsSelection=true
                self.table2.allowsSelection=true
                self.table1.allowsSelection=true
            }
            
        }
        
    }
    var noOfTimeDoneClciked:Int=0
    var firstTimeDoneClick:Bool=true
    var navTitle=String()
    var timer:Timer?
    var currenttime=0
   var flagForTimerbeingpausedorstopped:Bool?
    var rows1:[String]=["Errors of commission","Errors of Omission","Analysis Paralysis","Requesting Information","Error Recovery","User gets stuck","User express frustration"]
    var rows2:[String]=[" "]
    var rows3:[String]=["Low","Medium","Serious","Critical"]
    var rows4:[String]=["Emotional","Congnitive","physiological","Social(Trust)"]
    var heightforHeader=44
    var widthforHeader=335
    var coloumns:[String]=["Errors","Content","Severity Level","Impact on User"]
    var selectedData=[String:String]()
    var dataObserved=[[String: String]]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.startTimerButton.setImage(UIImage(named : "Play Filled-50"), for: .normal)
        //for table 1
        self.table1.delegate=self
        self.table1.dataSource=self
        table1.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table1.layer.masksToBounds = true
        table1.layer.borderColor = UIColor( red:204/255, green:204/255, blue:204/255, alpha:1.0 ).cgColor
        table1.layer.borderWidth = 2.0
        table1.allowsSelection=false
        //for table2
        self.table2.delegate=self
        self.table2.dataSource=self
        table2.register(UITableViewCell.self, forCellReuseIdentifier: "cell2")
        table2.layer.masksToBounds = true
        table2.layer.borderColor = UIColor( red:204/255, green:204/255, blue:204/255, alpha:1.0 ).cgColor
        table2.layer.borderWidth = 2.0
        table2.allowsSelection=false
        //for table3
        self.table3.delegate=self
        self.table3.dataSource=self
        table3.register(UITableViewCell.self, forCellReuseIdentifier: "cell3")
        table3.layer.masksToBounds = true
        table3.layer.borderColor = UIColor( red:204/255, green:204/255, blue:204/255, alpha:1.0 ).cgColor
        table3.layer.borderWidth = 2.0
        table3.allowsSelection=false
        //for table4
        self.table4.delegate=self
        self.table4.dataSource=self
        table4.register(UITableViewCell.self, forCellReuseIdentifier: "cell4")
        table4.layer.masksToBounds = true
        table4.layer.borderColor = UIColor( red:204/255, green:204/255, blue:204/255, alpha:1.0 ).cgColor
        table4.layer.borderWidth = 2.0
        table4.allowsSelection=false
        //details table
        self.detailsTable.delegate=self
        self.detailsTable.dataSource=self
        detailsTable.layer.masksToBounds = true
        detailsTable.layer.borderColor = UIColor( red:204/255, green:204/255, blue:204/255, alpha:1.0 ).cgColor
        detailsTable.layer.borderWidth = 2.0
        //detailsTable.allowsSelection=false
//        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        self.navigationItem.title=self.navTitle
        super.viewWillAppear(animated)
        //detailsTable.allowsSelection=false
        if(flagForTimerbeingpausedorstopped==true||flagForTimerbeingpausedorstopped==nil)
        {
        table4.allowsSelection=false
        table3.allowsSelection=false
        table2.allowsSelection=false
        table1.allowsSelection=false
            
        }
       else
        {
            table4.allowsSelection=true
            table3.allowsSelection=true
            table2.allowsSelection=true
            table1.allowsSelection=true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        var num:Int?
        if(tableView==self.table1||tableView==self.table2||tableView==self.table3||tableView==self.table4||tableView==self.detailsTable)
        {
            num=1
        }
        return num!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        var count:Int?
        if(tableView == self.table1)
        {
        count=self.rows1.count
        }
        if(tableView==self.table2)
        {
        count=self.rows2.count
        }
        if(tableView==self.table3)
        {
            count=self.rows3.count
        }
        if(tableView==self.table4)
        {
            count=self.rows4.count
        }
        if(tableView==self.detailsTable)
        {
            count=self.dataObserved.count
        }
        return count!
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       // var cell:UITableViewCell?
        if tableView==self.table1
        {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            //print("row is \(self.rows1[indexPath.row])")
        cell.textLabel?.text=self.rows1[indexPath.row]
            return cell
        }
        else if tableView==self.table2
        {
           let cell=tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath)
            cell.textLabel?.text=self.rows2[indexPath.row]
            return cell
        }
        else if tableView==self.table3
        {
           let cell=tableView.dequeueReusableCell(withIdentifier: "cell3", for: indexPath)
            cell.textLabel?.text=self.rows3[indexPath.row]
            return cell
        }
       else if tableView==self.table4
        {
           let cell=tableView.dequeueReusableCell(withIdentifier: "cell4", for: indexPath)
            cell.textLabel?.text=self.rows4[indexPath.row]
            return cell
        }
        else if tableView==self.detailsTable
        {
            print(indexPath.row)
            if(self.noOfTimeDoneClciked>0)
            {
//
            let cell=Bundle.main.loadNibNamed("ObservationTakingTableViewCell", owner: self, options: nil)?.first as! ObservationTakingTableViewCell
            cell.Headingstarttimemable.text="Start Time"
            cell.HeadingEndTimelabel.text="End Time"
            cell.HeadingLable1.text=self.coloumns[0]
            cell.Headinglabel2.text=self.coloumns[1]
            cell.HeadingLable3.text=self.coloumns[2]
            cell.HeadingLable4.text=self.coloumns[3]
            cell.StartTimeLable.text=self.dataObserved[indexPath.row]["Start Time"]!
                print(self.dataObserved[indexPath.row]["Start Time"]!)
            cell.EndTimeLable.text=self.dataObserved[indexPath.row]["End Time"]!
                print(self.dataObserved[indexPath.row]["End Time"]!)
                cell.Lable1.text=self.dataObserved[indexPath.row][coloumns[0]]! as String
                cell.Lable2.text=self.dataObserved[indexPath.row][coloumns[1]]! as String
                cell.Lable3.text=self.dataObserved[indexPath.row][coloumns[2]]! as String
                cell.Lable4.text=self.dataObserved[indexPath.row][coloumns[3]]! as String
                
            return cell
            }
            else
            {
                let cell=tableView.dequeueReusableCell(withIdentifier: "detailsCell", for: indexPath)
                return cell
            }
            
            
        }
        else
        {
            let cell=tableView.dequeueReusableCell(withIdentifier: "cell4", for: indexPath)
           
            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        var height:CGFloat?
        if(tableView==self.table1||tableView==self.table2||tableView==self.table3||tableView==self.table4)
        {
            height=CGFloat(self.heightforHeader)
        }
        if(tableView==self.detailsTable)
        {
            height=0
        }
        return height!
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let header=Bundle.main.loadNibNamed("TableViewCellHeader", owner: self, options: nil)?.first as! TableViewCellHeader
        //        let contetnview=UIView(frame:header.frame)
        //        header.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        //        contetnview.addSubview(header)
        if(tableView==self.table1)
        {
           
        header.changenameonclick.setTitle("\(coloumns[0])", for: .normal)
        header.delegate=self
        header.headerCellSection=section
        header.headerCellTable=1
        }
        if(tableView==self.table2)
        {
            
            header.changenameonclick.setTitle("\(coloumns[1])", for: .normal)
            header.delegate=self
            header.headerCellSection=section
            header.headerCellTable=2
        }
        if(tableView==self.table3)
        {
            
            header.changenameonclick.setTitle("\(coloumns[2])", for: .normal)
            header.delegate=self
            header.headerCellSection=section
            header.headerCellTable=3
        }
        if(tableView==self.table4)
        {
           
            header.changenameonclick.setTitle("\(coloumns[3])", for: .normal)
            header.delegate=self
            header.headerCellSection=section
            header.headerCellTable=4
        }
        
        return header
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(tableView==self.table1)
        {
            
            let indexPath=tableView.indexPathForSelectedRow
            let currentCell=tableView.cellForRow(at: indexPath!)! as UITableViewCell
            
            self.selectedData["\(self.coloumns[0])"] =  (currentCell.textLabel?.text!)! as String
            print("selected dat is \(selectedData)")
        }
        else if (tableView==self.table2)
        {
           
            let indexPath=tableView.indexPathForSelectedRow
            let currentCell=tableView.cellForRow(at: indexPath!)! as UITableViewCell
            self.selectedData["\(self.coloumns[1])"] = (currentCell.textLabel?.text!)! as String


        }
        else if (tableView==self.table3)
        {
          
            let indexPath=tableView.indexPathForSelectedRow
            let currentCell=tableView.cellForRow(at: indexPath!)! as UITableViewCell
            self.selectedData["\(self.coloumns[2])"] = (currentCell.textLabel?.text!)! as String

        }
        else if (tableView==self.table4)
        {
            
            let indexPath=tableView.indexPathForSelectedRow
            let currentCell=tableView.cellForRow(at: indexPath!)! as UITableViewCell
            self.selectedData["\(self.coloumns[3])"] = (currentCell.textLabel?.text!)! as String


        }
        else
        {
         print("not any table")
        }
       
        
        
        //selectedData.removeAll()
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if(tableView==self.table1)
        {
        if editingStyle == .delete
        {
            self.rows1.remove(at: indexPath.row)
            tableView.reloadData()
        }
        }
            if(tableView==self.table2)
            {
                if(rows2.count>0)
                {
                if editingStyle == .delete
                {
                    
                    
                    self.rows2.remove(at: indexPath.row)
                    tableView.reloadData()
                }
                }
            }
        if(tableView==self.table3)
        {
            if editingStyle == .delete
            {
                self.rows3.remove(at: indexPath.row)
                tableView.reloadData()
            }
        }
        if(tableView==self.table4)
        {
            if editingStyle == .delete
            {
                self.rows4.remove(at: indexPath.row)
                tableView.reloadData()
            }
        }
        if(tableView==self.detailsTable)
        {
            if editingStyle == .delete
            {
                //remove from dictionary of arrays
                
                
                tableView.reloadData()
            }
        }
        
        
    }
    func showAlertWithText(tableNum:Int)
    {
        let tablenum:Int=tableNum
        var alert:UIAlertController?
        var ok:UIAlertAction?
        if(tablenum==1)
        {
        //create alert controller
        alert=UIAlertController(title:"\(self.coloumns[0])",message:"Please enter the type of \(self.coloumns[0])",preferredStyle:.alert)
        
        //ok action
        ok=UIAlertAction(title:"OK",style:UIAlertActionStyle.default){(_) in
            let alertTextField=alert?.textFields?[0]
            
            
            self.rows1.append((alertTextField?.text)!)
            self.table1.reloadData()
        }
        //add text field
        alert?.addTextField { (textfield:UITextField) in
            //can customize the text field here
            textfield.placeholder="Enter \(self.coloumns[0]) type here"
        }
        alert?.addAction(ok!)
        //cancel action
        let cancel=UIAlertAction(title:"Cancel",style:UIAlertActionStyle.cancel,handler:nil)
        alert?.addAction(cancel)
        //present on screen
        self.present(alert!,animated:true,completion:nil)
        }
        if(tablenum==2)
        {
            //create alert controller
            alert=UIAlertController(title:"\(self.coloumns[1])",message:"Please enter the type of \(self.coloumns[1])",preferredStyle:.alert)
            
            //ok action
            ok=UIAlertAction(title:"OK",style:UIAlertActionStyle.default){(_) in
                let alertTextField=alert?.textFields?[0]
                
                if(self.rows2[0]==" ")
                {
                    self.rows2[0]=(alertTextField?.text)!
                
                }
                else
                {
                    self.rows2.append((alertTextField?.text)!)
                }
                self.table2.reloadData()
            }
            //add text field
            alert?.addTextField { (textfield:UITextField) in
                //can customize the text field here
                textfield.placeholder="Enter \(self.coloumns[1]) type here"
            }
            alert?.addAction(ok!)
            //cancel action
            let cancel=UIAlertAction(title:"Cancel",style:UIAlertActionStyle.cancel,handler:nil)
            alert?.addAction(cancel)
            //present on screen
            self.present(alert!,animated:true,completion:nil)
        }
        if(tablenum==3)
        {
            //create alert controller
            alert=UIAlertController(title:"\(self.coloumns[2])",message:"Please enter the type of \(self.coloumns[2])",preferredStyle:.alert)
            
            //ok action
            ok=UIAlertAction(title:"OK",style:UIAlertActionStyle.default){(_) in
                let alertTextField=alert?.textFields?[0]
                
                
                self.rows3.append((alertTextField?.text)!)
                self.table3.reloadData()
            }
            //add text field
            alert?.addTextField { (textfield:UITextField) in
                //can customize the text field here
                textfield.placeholder="Enter \(self.coloumns[2]) type here"
            }
            alert?.addAction(ok!)
            //cancel action
            let cancel=UIAlertAction(title:"Cancel",style:UIAlertActionStyle.cancel,handler:nil)
            alert?.addAction(cancel)
            //present on screen
            self.present(alert!,animated:true,completion:nil)
        }
        if(tablenum==4)
        {
            //create alert controller
            alert=UIAlertController(title:"\(self.coloumns[3])",message:"Please enter the type of \(self.coloumns[3])",preferredStyle:.alert)
            
            //ok action
            ok=UIAlertAction(title:"OK",style:UIAlertActionStyle.default){(_) in
                let alertTextField=alert?.textFields?[0]
                
                
                self.rows4.append((alertTextField?.text)!)
                self.table4.reloadData()
            }
            //add text field
            alert?.addTextField { (textfield:UITextField) in
                //can customize the text field here
                textfield.placeholder="Enter \(self.coloumns[3]) type here"
            }
            alert?.addAction(ok!)
            //cancel action
            let cancel=UIAlertAction(title:"Cancel",style:UIAlertActionStyle.cancel,handler:nil)
            alert?.addAction(cancel)
            //present on screen
            self.present(alert!,animated:true,completion:nil)
        }
        
        
    }
    //alert function for editing header
    func showAlertWithTextforHeader(tableNum:Int)
    {
        let tablenum:Int=tableNum
        var changetext=""
        var alert:UIAlertController?
        var ok:UIAlertAction?
        if(tablenum==1)
        {
        //create alert controller
         alert=UIAlertController(title:"\(coloumns[0])",message:"Please change \(coloumns[0]) name here)",preferredStyle:.alert)
        //ok action
       ok=UIAlertAction(title:"OK",style:UIAlertActionStyle.default){(_) in
            let alertTextField=alert?.textFields?[0]
            
            //print(alertTextField?.text)
            changetext=(alertTextField?.text)!
            print(changetext)
            self.coloumns[0]=changetext
            self.table1.reloadData()
        }
        alert?.addAction(ok!)
        
        //add text field
        alert?.addTextField { (textfield:UITextField) in
            //can customize the text field here
            textfield.placeholder="Enter new name here"
        }
        //cancel action
        let cancel=UIAlertAction(title:"Cancel",style:UIAlertActionStyle.cancel,handler:nil)
        alert?.addAction(cancel)
        //present on screen
        self.present(alert!,animated:true,completion:nil)
        print("the text to send: \(changetext)")
        //return changetext
        }
        if(tablenum==2)
        {
            //create alert controller
            alert=UIAlertController(title:"\(coloumns[1])",message:"Please change \(coloumns[1]) name here)",preferredStyle:.alert)
            //ok action
            ok=UIAlertAction(title:"OK",style:UIAlertActionStyle.default){(_) in
                let alertTextField=alert?.textFields?[0]
                
                //print(alertTextField?.text)
                changetext=(alertTextField?.text)!
                print(changetext)
                self.coloumns[1]=changetext
                self.table2.reloadData()
            }
            alert?.addAction(ok!)
            
            //add text field
            alert?.addTextField { (textfield:UITextField) in
                //can customize the text field here
                textfield.placeholder="Enter new name here"
            }
            //cancel action
            let cancel=UIAlertAction(title:"Cancel",style:UIAlertActionStyle.cancel,handler:nil)
            alert?.addAction(cancel)
            //present on screen
            self.present(alert!,animated:true,completion:nil)
            print("the text to send: \(changetext)")
            //return changetext
        }

        if(tablenum==3)
        {
            //create alert controller
            alert=UIAlertController(title:"\(coloumns[2])",message:"Please change \(coloumns[2]) name here)",preferredStyle:.alert)
            //ok action
            ok=UIAlertAction(title:"OK",style:UIAlertActionStyle.default){(_) in
                let alertTextField=alert?.textFields?[0]
                
                //print(alertTextField?.text)
                changetext=(alertTextField?.text)!
                print(changetext)
                self.coloumns[2]=changetext
                self.table3.reloadData()
            }
            alert?.addAction(ok!)
            
            //add text field
            alert?.addTextField { (textfield:UITextField) in
                //can customize the text field here
                textfield.placeholder="Enter new name here"
            }
            //cancel action
            let cancel=UIAlertAction(title:"Cancel",style:UIAlertActionStyle.cancel,handler:nil)
            alert?.addAction(cancel)
            //present on screen
            self.present(alert!,animated:true,completion:nil)
            print("the text to send: \(changetext)")
            //return changetext
        }

        if(tablenum==4)
        {
            //create alert controller
            alert=UIAlertController(title:"\(coloumns[3])",message:"Please change \(coloumns[3]) name here)",preferredStyle:.alert)
            //ok action
            ok=UIAlertAction(title:"OK",style:UIAlertActionStyle.default){(_) in
                let alertTextField=alert?.textFields?[0]
                
                //print(alertTextField?.text)
                changetext=(alertTextField?.text)!
                print(changetext)
                self.coloumns[3]=changetext
                self.table4.reloadData()
            }
            alert?.addAction(ok!)
            
            //add text field
            alert?.addTextField { (textfield:UITextField) in
                //can customize the text field here
                textfield.placeholder="Enter new name here"
            }
            //cancel action
            let cancel=UIAlertAction(title:"Cancel",style:UIAlertActionStyle.cancel,handler:nil)
            alert?.addAction(cancel)
            //present on screen
            self.present(alert!,animated:true,completion:nil)
            print("the text to send: \(changetext)")
            //return changetext
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
