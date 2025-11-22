//
//	ALHomeDataWeather.swift
//
//	Create by Ankit Gabani on 24/4/2024
//	Copyright © 2024. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class ALHomeDataWeather : NSObject, NSCoding{

	var dAY1 : ALHomeDataDAY1!
	var dAY2 : ALHomeDataDAY1!
	var dAY3 : ALHomeDataDAY1!
	var dAY4 : ALHomeDataDAY1!
	var dAY5 : ALHomeDataDAY1!
	var fCASTTYPE : String!


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
		if let dAY1Data = dictionary["DAY1"] as? NSDictionary{
			dAY1 = ALHomeDataDAY1(fromDictionary: dAY1Data)
		}
		else
		{
			dAY1 = ALHomeDataDAY1(fromDictionary: NSDictionary.init())
		}
		if let dAY2Data = dictionary["DAY2"] as? NSDictionary{
			dAY2 = ALHomeDataDAY1(fromDictionary: dAY2Data)
		}
		else
		{
			dAY2 = ALHomeDataDAY1(fromDictionary: NSDictionary.init())
		}
		if let dAY3Data = dictionary["DAY3"] as? NSDictionary{
			dAY3 = ALHomeDataDAY1(fromDictionary: dAY3Data)
		}
		else
		{
			dAY3 = ALHomeDataDAY1(fromDictionary: NSDictionary.init())
		}
		if let dAY4Data = dictionary["DAY4"] as? NSDictionary{
			dAY4 = ALHomeDataDAY1(fromDictionary: dAY4Data)
		}
		else
		{
			dAY4 = ALHomeDataDAY1(fromDictionary: NSDictionary.init())
		}
		if let dAY5Data = dictionary["DAY5"] as? NSDictionary{
			dAY5 = ALHomeDataDAY1(fromDictionary: dAY5Data)
		}
		else
		{
			dAY5 = ALHomeDataDAY1(fromDictionary: NSDictionary.init())
		}
		fCASTTYPE = dictionary["FCAST_TYPE"] as? String == nil ? "" : dictionary["FCAST_TYPE"] as? String
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		let dictionary = NSMutableDictionary()
		if dAY1 != nil{
			dictionary["DAY1"] = dAY1.toDictionary()
		}
		if dAY2 != nil{
			dictionary["DAY2"] = dAY2.toDictionary()
		}
		if dAY3 != nil{
			dictionary["DAY3"] = dAY3.toDictionary()
		}
		if dAY4 != nil{
			dictionary["DAY4"] = dAY4.toDictionary()
		}
		if dAY5 != nil{
			dictionary["DAY5"] = dAY5.toDictionary()
		}
		if fCASTTYPE != nil{
			dictionary["FCAST_TYPE"] = fCASTTYPE
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         dAY1 = aDecoder.decodeObject(forKey: "DAY1") as? ALHomeDataDAY1
         dAY2 = aDecoder.decodeObject(forKey: "DAY2") as? ALHomeDataDAY1
         dAY3 = aDecoder.decodeObject(forKey: "DAY3") as? ALHomeDataDAY1
         dAY4 = aDecoder.decodeObject(forKey: "DAY4") as? ALHomeDataDAY1
         dAY5 = aDecoder.decodeObject(forKey: "DAY5") as? ALHomeDataDAY1
         fCASTTYPE = aDecoder.decodeObject(forKey: "FCAST_TYPE") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    public func encode(with aCoder: NSCoder) 
	{
		if dAY1 != nil{
			aCoder.encode(dAY1, forKey: "DAY1")
		}
		if dAY2 != nil{
			aCoder.encode(dAY2, forKey: "DAY2")
		}
		if dAY3 != nil{
			aCoder.encode(dAY3, forKey: "DAY3")
		}
		if dAY4 != nil{
			aCoder.encode(dAY4, forKey: "DAY4")
		}
		if dAY5 != nil{
			aCoder.encode(dAY5, forKey: "DAY5")
		}
		if fCASTTYPE != nil{
			aCoder.encode(fCASTTYPE, forKey: "FCAST_TYPE")
		}

	}

}
