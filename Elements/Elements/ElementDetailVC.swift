//
//  ElementDetailVC.swift
//  Elements
//
//  Created by Adam Diaz on 12/19/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class ElementDetailVC: UIViewController {
    
    var elements: Element?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var symbolLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var atomicLabel: UILabel!
    @IBOutlet weak var meltingLabel:
    UILabel!
    @IBOutlet weak var boilingLabel: UILabel!
    @IBOutlet weak var discoverLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        update()
    }
    
    func update() {
        guard let elements = elements else {
            return
        }
        navigationItem.title = elements.name
        nameLabel.text = elements.name
        symbolLabel.text = elements.symbol
        numberLabel.text = "(\(elements.number))"
        atomicLabel.text = "(\(elements.atomicMass))"
        meltingLabel.text = "\(elements.meltingPoint ?? 0.0 )"
        boilingLabel.text = "\(elements.boilingPoint ?? 0.0)"
        discoverLabel.text = "\(elements.discoveredBy ?? "unknown")"
        
        imageView.getImage(with: "http://images-of-elements.com/\(elements.name.lowercased()).jpg") { [weak self] (result) in
            switch result {
            case .failure:
                DispatchQueue.main.async {
                    self?.imageView.image = nil
                }
            case .success(let image):
                DispatchQueue.main.async {
                    self?.imageView.image = image
                }
            }
        }
    }
    
   @IBAction func favorited(_ sender: UIBarButtonItem) {
   guard let elements = elements else {
       return
   }
    
}
}
