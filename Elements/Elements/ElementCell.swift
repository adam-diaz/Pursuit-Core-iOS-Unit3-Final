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
        detailLabel.text = "Details should be here"
        elementImage.getImage(with: "http://www.theodoregray.com/periodictable/Tiles/018/s7.JPG") {  [weak self ](result) in
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
    
}
