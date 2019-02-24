//
//  TableViewController.swift
//  CustomTableView2
//
//  Created by Olivier Miserez on 07/06/2018.
//  Copyright © 2018 GhostApps. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    // Variables
    let numberOfSectionsInTableView: Int = 5
    var photosVar: [String] = ["1", "2", "3", "4", "5", "6"]
    var namesVar: [String] = ["Donald TRUMPed", "The ROCKed", "B. OBAMAyang", "Michel VDB", "Test"]
    
    var users = [User]()
    
    struct Storyboard {
        
        static let titleCell = "TitleTableViewCell"
        static let storiesCell = "StoriesTableViewCell"
        static let storiesCollectionCell = "StoriesCollectionCell"
        static let userCell = "UserTableViewCell"
        static let userDetail = "UserDetailViewController"
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let trump = User(userName: "Donald TRUMPed", profilePhotoName: "trump", uploadPhotoName: "post1", realName: "Donal Trump")
        users.append(trump)
        
        let rock = User(userName: "The ROCKed", profilePhotoName: "rock", uploadPhotoName: "post2", realName: "Dwayne Johnson")
        users.append(rock)
        
        let obama = User(userName: "B. OBAMAyang", profilePhotoName: "obama", uploadPhotoName: "post3", realName: "Barack Obama")
        users.append(obama)
        
        let michel = User(userName: "Michel VDB", profilePhotoName: "michel", uploadPhotoName: "post4", realName: "Michel Van Den Brande")
        users.append(michel)
    }

    


}


extension TableViewController {
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return numberOfSectionsInTableView
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.storiesCell, for: indexPath) as! StoriesTableViewCell
            cell.selectionStyle = .none
            
            return cell
            
        } else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.userCell, for: indexPath) as! UserTableViewCell
            
            cell.userNameLabel.text = "\(users[indexPath.row-1].userName)"
            cell.userPhoto.image = UIImage(named: "\(users[indexPath.row-1].profilePhotoName)")
            cell.userPhoto.layer.cornerRadius = cell.userPhoto.frame.size.width/2
            cell.userPhoto.clipsToBounds = true
            cell.photoPost.image = UIImage(named: "\(users[indexPath.row-1].uploadPhotoName)")
            cell.selectionStyle = .none
            
            return cell
            
            
        }
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            if let cell = cell as? StoriesTableViewCell {
                cell.collectionView.dataSource = self
                cell.collectionView.reloadData()
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 0 {
            return 120
        } else if indexPath.row >= 1 {
            return 283
        } else {
            return UITableViewAutomaticDimension
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: Storyboard.userDetail, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? UserDetailViewController {
            destination.currentUser = users[(tableView.indexPathForSelectedRow?.row)!-1]
        }
        
        let backItem = UIBarButtonItem()
        backItem.title = ""
        navigationItem.backBarButtonItem = backItem
    }
    
    
}


extension TableViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photosVar.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Storyboard.storiesCollectionCell, for: indexPath) as! StoriesCollectionViewCell
        cell.imageView.image = UIImage(named: photosVar[indexPath.row])
        cell.layer.cornerRadius = cell.frame.size.width/2
        
        return cell
    }
}


