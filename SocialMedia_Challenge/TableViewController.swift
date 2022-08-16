//
//  TableViewController.swift
//  SocialMedia_Challenge
//
//  Created by Caio Soares on 16/08/22.
//

import Foundation

import UIKit

class TableViewController: UIViewController {
    
    //test animals
    //let animalNames = ["Dogs", "Cats"]
    
    //abublabeibe
    
    //spacePosts
    let spacePosts = [Post]
    
    //definindo table view
    var tableView: PostListViewModel!
    
    //did load
    override func viewDidLoad() {
        //super
        super.viewDidLoad()
        
        //puxar os posts
        Task {
            await populatePosts()
        }
        
        //resto da view
        setupTableView()
        
    }
    
    func setupTableView() {
        
        //definindo
        tableView = PostListViewModel(frame: view.bounds)
        view.addSubview(tableView)
        
        //constraints
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        
        //chamando células
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "AnimalCell")
        
        //dataSource
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func populatePosts() async -> [PostViewModel] {
        await tableView.populatePosts(url: Constants.URLs.posts)
        return tableView.posts
    }
    
}

extension TableViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return spacePosts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SpacePosts")! as UITableViewCell
        cell.textLabel?.text = spacePosts[indexPath.row]
        return cell
    }
}

extension TableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print(spacePosts[indexPath.row])
    }
}
