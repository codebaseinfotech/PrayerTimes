//
//	ALHomeDataNearestMosque.swift
//
//	Create by Ankit Gabani on 24/4/2024
//	Copyright © 2024. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class ALHomeDataNearestMosque : NSObject, NSCoding{

	var area : ALHomeDataArea!
	var areaId : Int!
	var createdAt : String!
	var distance : String!
	var id : Int!
	var isDefault : Int!
	var latitude : String!
	var longitude : String!
	var name : String!
	var status : String!


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
		if let areaData = dictionary["area"] as? NSDictionary{
			area = ALHomeDataArea(fromDictionary: areaData)
		}
		else
		{
			area = ALHomeDataArea(fromDictionary: NSDictionary.init())
		}
		areaId = dictionary["area_id"] as? Int == nil ? 0 : dictionary["area_id"] as? Int
		createdAt = dictionary["created_at"] as? String == nil ? "" : dictionary["created_at"] as? String
		distance = dictionary["distance"] as? String == nil ? "" : dictionary["distance"] as? String
		id = dictionary["id"] as? Int == nil ? 0 : dictionary["id"] as? Int
		isDefault = dictionary["is_default"] as? Int == nil ? 0 : dictionary["is_default"] as? Int
		latitude = dictionary["latitude"] as? String == nil ? "" : dictionary["latitude"] as? String
		longitude = dictionary["longitude"] as? String == nil ? "" : dictionary["longitude"] as? String
		name = dictionary["name"] as? String == nil ? "" : dictionary["name"] as? String
		status = dictionary["status"] as? String == nil ? "" : dictionary["status"] as? String
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		let dictionary = NSMutableDictionary()
		if area != nil{
			dictionary["area"] = area.toDictionary()
		}
		if areaId != nil{
			dictionary["area_id"] = areaId
		}
		if createdAt != nil{
			dictionary["created_at"] = createdAt
		}
		if distance != nil{
			dictionary["distance"] = distance
		}
		if id != nil{
			dictionary["id"] = id
		}
		if isDefault != nil{
			dictionary["is_default"] = isDefault
		}
		if latitude != nil{
			dictionary["latitude"] = latitude
		}
		if longitude != nil{
			dictionary["longitude"] = longitude
		}
		if name != nil{
			dictionary["name"] = name
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
         area = aDecoder.decodeObject(forKey: "area") as? ALHomeDataArea
         areaId = aDecoder.decodeObject(forKey: "area_id") as? Int
         createdAt = aDecoder.decodeObject(forKey: "created_at") as? String
         distance = aDecoder.decodeObject(forKey: "distance") as? String
         id = aDecoder.decodeObject(forKey: "id") as? Int
         isDefault = aDecoder.decodeObject(forKey: "is_default") as? Int
         latitude = aDecoder.decodeObject(forKey: "latitude") as? String
         longitude = aDecoder.decodeObject(forKey: "longitude") as? String
         name = aDecoder.decodeObject(forKey: "name") as? String
         status = aDecoder.decodeObject(forKey: "status") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    public func encode(with aCoder: NSCoder) 
	{
		if area != nil{
			aCoder.encode(area, forKey: "area")
		}
		if areaId != nil{
			aCoder.encode(areaId, forKey: "area_id")
		}
		if createdAt != nil{
			aCoder.encode(createdAt, forKey: "created_at")
		}
		if distance != nil{
			aCoder.encode(distance, forKey: "distance")
		}
		if id != nil{
			aCoder.encode(id, forKey: "id")
		}
		if isDefault != nil{
			aCoder.encode(isDefault, forKey: "is_default")
		}
		if latitude != nil{
			aCoder.encode(latitude, forKey: "latitude")
		}
		if longitude != nil{
			aCoder.encode(longitude, forKey: "longitude")
		}
		if name != nil{
			aCoder.encode(name, forKey: "name")
		}
		if status != nil{
			aCoder.encode(status, forKey: "status")
		}

	}

}
