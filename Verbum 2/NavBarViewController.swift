//
//  NavBarViewController.swift
//  Verbum 2
//
//  Created by Peter on 28/07/14.
//  Copyright (c) 2014 Peter Tikhomirov. All rights reserved.
//

import UIKit

let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate

class NavBarViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
		self.navigationBar.barTintColor = UIColor.colorWithRGBHex(appDelegate.navBarTint, alpha: 1)
		self.navigationBar.tintColor = UIColor.colorWithRGBHex(0xffffff, alpha: 1)
		self.navigationBar.barStyle = .Black

    }

}
