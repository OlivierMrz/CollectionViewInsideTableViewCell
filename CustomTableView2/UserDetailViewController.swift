//
//  UserDetailViewController.swift
//  CustomTableView2
//
//  Created by Olivier school on 11/06/2018.
//  Copyright © 2018 GhostApps. All rights reserved.
//

import UIKit

class UserDetailViewController: UIViewController {

    @IBOutlet weak var userPhoto: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var postedPhoto: UIImageView!
    
    var currentUser:User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "\((currentUser?.userName)!)"
        
        userPhoto.image = UIImage(named: "\((currentUser?.profilePhotoName)!)")
        userName.text = "\((currentUser?.realName)!)"
        postedPhoto.image = UIImage(named: "\((currentUser?.uploadPhotoName)!)")
        
    }

}











































