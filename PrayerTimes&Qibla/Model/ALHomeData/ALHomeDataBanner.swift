//
//	ALHomeDataBanner.swift
//
//	Create by Ankit Gabani on 24/4/2024
//	Copyright © 2024. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class ALHomeDataBanner : NSObject, NSCoding{

	var createdAt : String!
	var id : Int!
	var image : String!
	var ordering : Int!
	var status : String!
	var webImage : String!


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
		createdAt = dictionary["created_at"] as? String == nil ? "" : dictionary["created_at"] as? String
		id = dictionary["id"] as? Int == nil ? 0 : dictionary["id"] as? Int
		image = dictionary["image"] as? String == nil ? "" : dictionary["image"] as? String
		ordering = dictionary["ordering"] as? Int == nil ? 0 : dictionary["ordering"] as? Int
		status = dictionary["status"] as? String == nil ? "" : dictionary["status"] as? String
		webImage = dictionary["web_image"] as? String == nil ? "" : dictionary["web_image"] as? String
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		let dictionary = NSMutableDictionary()
		if createdAt != nil{
			dictionary["created_at"] = createdAt
		}
		if id != nil{
			dictionary["id"] = id
		}
		if image != nil{
			dictionary["image"] = image
		}
		if ordering != nil{
			dictionary["ordering"] = ordering
		}
		if status != nil{
			dictionary["status"] = status
		}
		if webImage != nil{
			dictionary["web_image"] = webImage
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         createdAt = aDecoder.decodeObject(forKey: "created_at") as? String
         id = aDecoder.decodeObject(forKey: "id") as? Int
         image = aDecoder.decodeObject(forKey: "image") as? String
         ordering = aDecoder.decodeObject(forKey: "ordering") as? Int
         status = aDecoder.decodeObject(forKey: "status") as? String
         webImage = aDecoder.decodeObject(forKey: "web_image") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    public func encode(with aCoder: NSCoder) 
	{
		if createdAt != nil{
			aCoder.encode(createdAt, forKey: "created_at")
		}
		if id != nil{
			aCoder.encode(id, forKey: "id")
		}
		if image != nil{
			aCoder.encode(image, forKey: "image")
		}
		if ordering != nil{
			aCoder.encode(ordering, forKey: "ordering")
		}
		if status != nil{
			aCoder.encode(status, forKey: "status")
		}
		if webImage != nil{
			aCoder.encode(webImage, forKey: "web_image")
		}

	}

}
