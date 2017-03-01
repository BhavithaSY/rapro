//
//  TableViewCellHeader.swift
//  jj77
//
//  Created by Bhavithasai yendrathi on 2/28/17.
//  Copyright © 2017 Bhavithasai yendrathi. All rights reserved.
//

import UIKit
protocol showAlertOnCLick {
    
    func showAlertWithText()
    func showAlertWithTextforHeader()
    
}

class TableViewCellHeader: UITableViewCell {
    
    var delegate:showAlertOnCLick!
    
    var headerCellSection:Int?
    
    @IBOutlet weak var changenameonclick: UIButton!
    
    
    @IBOutlet weak var addColumnButton: UIButton!
    
    @IBAction func addRowButtonAction(_ sender: UIButton) {
        
        self.delegate.showAlertWithText()

    }
    
    @IBAction func changename(_ sender: UIButton) {
         self.delegate.showAlertWithTextforHeader()
    }
    
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
