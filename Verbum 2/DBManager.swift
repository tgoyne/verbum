//
//  DBManager.swift
//  Verbum 2
//
//  Created by Peter on 26/07/14.
//  Copyright (c) 2014 Peter Tikhomirov. All rights reserved.
//

import Realm

class Language: RLMObject {
	var title = ""
	var position:Int?
}



extension RLMObject {

//	class func colorWithRGBHex(hex: Int, alpha: Float = 1.0) -> UIColor {
//		let r = Float((hex >> 16) & 0xFF)
//		let g = Float((hex >> 8) & 0xFF)
//		let b = Float((hex) & 0xFF)
//		
//		return UIColor(red: CGFloat(r / 255.0), green: CGFloat(g / 255.0), blue:CGFloat(b / 255.0), alpha: CGFloat(alpha))
//	}
}

class DBManager {
	
	func deleteRealmFile() -> Void {
		let documentsPaths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
		var path = documentsPaths.stringByAppendingPathComponent("default.realm")
		NSFileManager.defaultManager().removeItemAtPath(path, error: nil)
	}
	
//	func add(realm:RLMRealm, table:RLMObject, data:NSArray) -> Bool {
//		
//		realm.beginWriteTransaction()
//		table.createInRealm(realm, withObject: data)
//		realm.commitWriteTransaction()
//		
//		return true
//	}
	
}
