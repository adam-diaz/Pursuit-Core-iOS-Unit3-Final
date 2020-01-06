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
    
    func configureCell(for element: Element) {
        nameLabel.text = element.name
        detailLabel.text = " \(element.symbol)(\(element.number)) \(element.atomicMass)"
        elementImage.getImage(with: periodicImage(num: element.number)) {  [weak self](result) in
            switch result {
            case .failure:
                DispatchQueue.main.async {
                    self?.elementImage.image = nil
                }
            case .success(let image):
                DispatchQueue.main.async {
                    self?.elementImage.image = image
                }
            }
        }
    }
    func periodicImage(num: Int) -> String {
        switch num {
        case 1...9:
            return "http://www.theodoregray.com/periodictable/Tiles/00\(num)/s7.JPG"
        case 10...99:
            return "http://www.theodoregray.com/periodictable/Tiles/0\(num)/s7.JPG"
        default:
            return "there are 18 other elements missing."
        }
    }
}
