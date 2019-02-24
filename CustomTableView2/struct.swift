//
//  struct.swift
//  CustomTableView2
//
//  Created by Olivier school on 11/06/2018.
//  Copyright © 2018 GhostApps. All rights reserved.
//

import Foundation
import UIKit

struct User {
    var userName: String
    var profilePhotoName: String
    var uploadPhotoName: String
    var realName: String
    
    init(userName: String, profilePhotoName: String, uploadPhotoName: String, realName: String) {
        self.userName = userName
        self.profilePhotoName = profilePhotoName
        self.uploadPhotoName = uploadPhotoName
        self.realName = realName
    }
}
