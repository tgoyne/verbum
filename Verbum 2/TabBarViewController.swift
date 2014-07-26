//
//  TabBarViewController.swift
//  Verbum 2
//
//  Created by Peter on 26/07/14.
//  Copyright (c) 2014 Peter Tikhomirov. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
		super.viewDidLoad()
		self.tabBar.tintColor = UIColor.colorWithRGBHex(0xff0000, alpha: 1)
    }
}
