//
//  DetailViewController.swift
//  Alamofile_SwiftJson
//
//  Created by Hoàng Đức on 08/12/2022.
//

import UIKit

class DetailViewController: UIViewController {
    
    var detailData: Result?
    
    let descriptionLabel: UILabel = {
        let text = UILabel()
        text.textColor = .black
        text.font = .systemFont(ofSize: 16)
        text.numberOfLines = 0
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
 

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
      
        
        view.addSubview(descriptionLabel)
        descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        descriptionLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        descriptionLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        descriptionLabel.heightAnchor.constraint(equalToConstant: 200).isActive = true

        getData()
    }
    
   
    
    func getData() {
        let vc = ViewController()
        vc.handelBack = { result in
            
            self.detailData = result
            self.descriptionLabel.text = self.detailData!.description
            
        }
        
        
    }

    

}
