//
//  FavElementVC.swift
//  Elements
//
//  Created by Adam Diaz on 12/19/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class FavElementVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
   private var elements = [Element]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    var searchQuery = "" {
        didSet {
            loadData(for: searchQuery)
        }
    }
    
    override func viewDidLoad() {
      super.viewDidLoad()
      loadData(for: searchQuery)
      tableView.dataSource = self
      tableView.delegate = self
      searchBar.delegate = self
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let elementDetail = segue.destination as? ElementDetailVC, let indexPath = tableView.indexPathForSelectedRow else {
            fatalError("Could Not Segue")
        }
        elementDetail.elements = elements[indexPath.row]
    }
    
    private func loadData(for search: String) {
        ElementsAPIClient.getFavorites() { [weak self](result) in
            switch result {
            case .failure(let appError):
                DispatchQueue.main.async {
                    self?.showAlert(title: "App Error", message: "\(appError)")
                }
            case .success(let elements):
                DispatchQueue.main.async {
                    self?.elements = elements.sorted { $0.number < $1.number }
                }
            }
        }
    }
    
}

extension FavElementVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return elements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "favCell", for: indexPath) as? ElementCell else {
            fatalError("Issue with cell connection.")
        }
        
        let element = elements[indexPath.row]
        
        cell.configureCell(for: element)
        
        return cell
    }
    
    
}


extension FavElementVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}



extension FavElementVC: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchQuery = searchText
    }
}
