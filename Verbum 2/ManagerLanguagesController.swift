//
//  ManagerLanguagesController.swift
//  Verbum 2
//
//  Created by Peter on 25/07/14.
//  Copyright (c) 2014 Peter Tikhomirov. All rights reserved.
//

import UIKit
import Realm

class Cell: UITableViewCell {
	
	init(style: UITableViewCellStyle, reuseIdentifier: String!) {
		super.init(style: .Subtitle, reuseIdentifier: reuseIdentifier)
	}
}

class ManagerLanguagesController: UITableViewController {

	var array = RLMArray()
	var notificationToken: RLMNotificationToken?
	
    override func viewDidLoad() {
        super.viewDidLoad()
		//DBManager().deleteRealmFile()
		setupUI()
		notificationToken = RLMRealm.defaultRealm().addNotificationBlock { note, realm in
			self.reloadData()
		}
		reloadData()
    }

	override func tableView(tableView: UITableView?, numberOfRowsInSection section: Int) -> Int {
		return Int(array.count)
	}
	
	func setupUI() {
		tableView.registerClass(Cell.self, forCellReuseIdentifier: "cell")
		self.title = "Languages"
		//self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "BG Add", style: .Plain, target: self, action: "backgroundAdd")
		//self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "add")
	}
	
	override func tableView(tableView: UITableView?, cellForRowAtIndexPath indexPath: NSIndexPath?) -> UITableViewCell? {
		let cell = tableView!.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as Cell
		
		let object = array[UInt(indexPath!.row)] as Language
		cell.textLabel.text = object.title
		//cell.detailTextLabel.text = Stringobject.position
		
		return cell
	}
	
	override func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!) {
		if editingStyle == .Delete {
			let realm = RLMRealm.defaultRealm()
			realm.beginWriteTransaction()
			realm.deleteObject(array[UInt(indexPath.row)] as RLMObject)
			realm.commitWriteTransaction()
		}
	}
	
	func reloadData() {
		array = Language.allObjects().arraySortedByProperty("position", ascending: true)
		tableView.reloadData()
	}
	
//	func backgroundAdd() {
//		let queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
//		// Import many items in a background thread
//		dispatch_async(queue) {
//			// Get new realm and table since we are in a new thread
//			let realm = RLMRealm.defaultRealm()
//			realm.beginWriteTransaction()
//			for index in 0..<5 {
//				// Add row via dictionary. Order is ignored.
//				Language.createInRealm(realm, withObject: ["title": self.randomString(), "position": self.randomInt()])
//			}
//			realm.commitWriteTransaction()
//		}
//	}
	
	func add() {
		let realm = RLMRealm.defaultRealm()
		realm.beginWriteTransaction()
		Language.createInRealm(realm, withObject: [self.randomString(), self.randomInt()])
		realm.commitWriteTransaction()
	}
	
	// Helpers
	
	func randomString() -> String {
		return "Title \(arc4random())"
	}
	
	func randomInt() -> Int {
		return Int(arc4random_uniform(150))
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}

}
