//
//	AlGetPlayerTime.swift
//
//	Create by Ankit Gabani on 25/4/2024
//	Copyright © 2024. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class AlGetPlayerTime : NSObject, NSCoding{

	var code : Int!
	var items : [AlGetPlayerTimeItem]!
	var message : String!
	var status : Bool!


	/**
	 * Overiding init method
	 */
	init(fromDictionary dictionary: NSDictionary)
	{
		super.init()
		parseJSONData(fromDictionary: dictionary)
	}

	/**
	 * Overiding init method
	 */
	override init(){
	}

	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	@objc func parseJSONData(fromDictionary dictionary: NSDictionary)
	{
		code = dictionary["code"] as? Int == nil ? 0 : dictionary["code"] as? Int
		items = [AlGetPlayerTimeItem]()
		if let itemsArray = dictionary["items"] as? [NSDictionary]{
			for dic in itemsArray{
				let value = AlGetPlayerTimeItem(fromDictionary: dic)
				items.append(value)
			}
		}
		message = dictionary["message"] as? String == nil ? "" : dictionary["message"] as? String
		status = dictionary["status"] as? Bool == nil ? false : dictionary["status"] as? Bool
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		let dictionary = NSMutableDictionary()
		if code != nil{
			dictionary["code"] = code
		}
		if items != nil{
			var dictionaryElements = [NSDictionary]()
			for itemsElement in items {
				dictionaryElements.append(itemsElement.toDictionary())
			}
			dictionary["items"] = dictionaryElements
		}
		if message != nil{
			dictionary["message"] = message
		}
		if status != nil{
			dictionary["status"] = status
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         code = aDecoder.decodeObject(forKey: "code") as? Int
         items = aDecoder.decodeObject(forKey: "items") as? [AlGetPlayerTimeItem]
         message = aDecoder.decodeObject(forKey: "message") as? String
         status = aDecoder.decodeObject(forKey: "status") as? Bool

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    public func encode(with aCoder: NSCoder) 
	{
		if code != nil{
			aCoder.encode(code, forKey: "code")
		}
		if items != nil{
			aCoder.encode(items, forKey: "items")
		}
		if message != nil{
			aCoder.encode(message, forKey: "message")
		}
		if status != nil{
			aCoder.encode(status, forKey: "status")
		}

	}

}