//
//  ViewController.swift
//  Elements
//
//  Created by Alex Paul on 12/31/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ElementVC: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableview: UITableView!

    
    private var elements = [Element]() {
        didSet {
            DispatchQueue.main.async {
                self.tableview.reloadData()
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
    
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let elementDetail = segue.destination as? ElementDetailVC, let indexPath = tableview.indexPathForSelectedRow else {
            fatalError("Could Not Segue")
        }
        elementDetail.elements = elements[indexPath.row]
    }
    
    private func loadData(for search: String) {
        ElementsAPIClient.fetchElements(for: search) { [weak self](result) in
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

extension ElementVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return elements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "elementCell", for: indexPath) as? ElementCell else {
            fatalError("Issue with cell connection.")
        }
        
        let element = elements[indexPath.row]
        
//        cell.configureCell(for: elements) 
        
        return cell
    }
    
    
}



extension ElementVC: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchQuery = searchText
    }
}
