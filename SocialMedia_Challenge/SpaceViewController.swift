//
//  SpaceViewController.swift
//  Network_Challege
//
//  Created by Caio Soares on 09/08/22.
//

import Foundation
import UIKit

final class SpaceViewController: UIViewController {
    
    private let viewModel = PostListViewModel()
    
    //viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        Task {
            await populatePosts()
        }
        
        //Propriedades escritas
        
        titleLabel.text = "ADA Space API Tester"
        titleLabel.textAlignment = .center
        
        updateButton.setTitle("Update", for: .normal)
        updateButton.backgroundColor = .red
        
        //Chamar as subviews
        
        view.addSubview(titleLabel)
        view.addSubview(postContent)
        view.addSubview(updateButton)
        
        //Constraints
        
        titleLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10).isActive = true
        
        postContent.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 600).isActive = true
        postContent.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10).isActive = true
        postContent.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10).isActive = true
        
        updateButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -100).isActive = true
        updateButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10).isActive = true
        updateButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10).isActive = true
        
    }
    
    //definindo os elementos
    
    private lazy var titleLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var postContent: UILabel = {
        let view = UILabel(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var updateButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //chamando
    
    private func populatePosts() async -> [PostViewModel] {
        await viewModel.populatePosts(url: Constants.URLs.posts)
        return viewModel.posts
    }
    
}
