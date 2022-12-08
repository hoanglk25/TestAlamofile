//
//  ViewController.swift
//  Alamofile_SwiftJson
//
//  Created by Hoàng Đức on 08/12/2022.
//

import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher

class ViewController: UIViewController {
    
    var fetchData = [Result]()
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    let searchController = UISearchController()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.searchController = searchController
        searchController.searchBar.placeholder = "Enter Country Code e.g. US"
        searchController.searchBar.delegate = self

        setUpTableView()
        
        getItunes(text: "") { results in
            self.fetchData = results!
            self.tableView.reloadData()
        } _: { error in
            print(error)
        }

    }
    
    func setUpTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: "MovieTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "MovieTableViewCell")
        view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
    
    var handelBack:((Result) -> Void)?
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
//        vc.modalPresentationStyle = .overFullScreen
//        vc.modalTransitionStyle = .crossDissolve
        handelBack?(fetchData[indexPath.row])
//        present(vc, animated: true)
        navigationController?.pushViewController(vc, animated: true)
       
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell", for: indexPath) as! MovieTableViewCell
        let movies = fetchData[indexPath.row]
        cell.artistNameLable.text = movies.artistName
        cell.collectionNameLabel.text = movies.collectionName
        let url = URL(string: movies.artworkUrl100!)
        cell.thumbImageView.kf.setImage(with: url)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}

extension ViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
    }
}
