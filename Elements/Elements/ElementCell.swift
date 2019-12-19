//
//  ElementCell.swift
//  Elements
//
//  Created by Adam Diaz on 12/19/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class ElementCell: UITableViewCell {
    
    @IBOutlet weak var elementImage: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var detailLabel: UILabel!
    
    var elements: Element?
    
    func configuereCell(for element: Element) {
        nameLabel.text = element.name
        detailLabel.text = "Details should be here"
        
    }
    
}
