//
//  ViewControllerWithTasksUsabilityStudy.swift
//  jj77
//
//  Created by Bhavithasai yendrathi on 3/4/17.
//  Copyright © 2017 Bhavithasai yendrathi. All rights reserved.
//

import UIKit

class ViewControllerWithTasksUsabilityStudy: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
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
            destination.taskname=self.taskname
            }
        }
    }
    
    
    var navTitle=String()
    var tasksList=["Task1","Task2","Task3","Task4"]
    var taskname=String()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return self.tasksList.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
       return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TasksCell", for: indexPath)
        cell.textLabel?.text=self.tasksList[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let indexPath=tableView.indexPathForSelectedRow
        let currentCell=tableView.cellForRow(at: indexPath!)! as UITableViewCell
        self.taskname=(currentCell.textLabel?.text)!

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print(navTitle)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
        self.navigationItem.title=self.navTitle
        self.tableWithTasks.delegate=self
        self.tableWithTasks.dataSource=self

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
