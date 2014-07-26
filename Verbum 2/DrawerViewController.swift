//
//  DrawerViewController.swift
//  Verbum
//
//  Created by Peter on 25/07/14.
//  Copyright (c) 2014 Peter Tikhomirov. All rights reserved.
//

import UIKit
import Realm

class DrawerViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
	
	@IBOutlet weak var tableView: UITableView!
	
	var array = RLMArray()
	var notificationToken: RLMNotificationToken?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
		notificationToken = RLMRealm.defaultRealm().addNotificationBlock { note, realm in
			self.reloadData()
		}
		reloadData()
	}
	
	func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
		return Int(array.count)
	}
	
	func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
		var cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell
		let object = array[UInt(indexPath!.row)] as Language
		cell.textLabel.text = object.title
		return cell
	}
	
	func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
		self.revealViewController().revealToggleAnimated(true)
		println("You selected cell #\(indexPath.row)!")
//		var alert = UIAlertView()
//		alert.title =  "Message"
//		alert.message = "This is to inform you that an action has been executed"
//		alert.addButtonWithTitle("Alright")
//		alert.show()
	}
	
	func reloadData() {
		array = Language.allObjects().arraySortedByProperty("position", ascending: true)
		tableView.reloadData()
	}
}

