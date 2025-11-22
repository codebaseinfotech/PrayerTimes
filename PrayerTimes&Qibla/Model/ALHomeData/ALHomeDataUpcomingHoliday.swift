//
//	ALHomeDataUpcomingHoliday.swift
//
//	Create by Ankit Gabani on 24/4/2024
//	Copyright © 2024. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class ALHomeDataUpcomingHoliday : NSObject, NSCoding{

	var georgianDate : String!
	var hijriDay : Int!
	var hijriMonth : String!
	var hijriYear : Int!
	var id : Int!
	var officialHoliday : String!


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
		georgianDate = dictionary["georgian_date"] as? String == nil ? "" : dictionary["georgian_date"] as? String
		hijriDay = dictionary["hijri_day"] as? Int == nil ? 0 : dictionary["hijri_day"] as? Int
		hijriMonth = dictionary["hijri_month"] as? String == nil ? "" : dictionary["hijri_month"] as? String
		hijriYear = dictionary["hijri_year"] as? Int == nil ? 0 : dictionary["hijri_year"] as? Int
		id = dictionary["id"] as? Int == nil ? 0 : dictionary["id"] as? Int
		officialHoliday = dictionary["official_holiday"] as? String == nil ? "" : dictionary["official_holiday"] as? String
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		let dictionary = NSMutableDictionary()
		if georgianDate != nil{
			dictionary["georgian_date"] = georgianDate
		}
		if hijriDay != nil{
			dictionary["hijri_day"] = hijriDay
		}
		if hijriMonth != nil{
			dictionary["hijri_month"] = hijriMonth
		}
		if hijriYear != nil{
			dictionary["hijri_year"] = hijriYear
		}
		if id != nil{
			dictionary["id"] = id
		}
		if officialHoliday != nil{
			dictionary["official_holiday"] = officialHoliday
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         georgianDate = aDecoder.decodeObject(forKey: "georgian_date") as? String
         hijriDay = aDecoder.decodeObject(forKey: "hijri_day") as? Int
         hijriMonth = aDecoder.decodeObject(forKey: "hijri_month") as? String
         hijriYear = aDecoder.decodeObject(forKey: "hijri_year") as? Int
         id = aDecoder.decodeObject(forKey: "id") as? Int
         officialHoliday = aDecoder.decodeObject(forKey: "official_holiday") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    public func encode(with aCoder: NSCoder) 
	{
		if georgianDate != nil{
			aCoder.encode(georgianDate, forKey: "georgian_date")
		}
		if hijriDay != nil{
			aCoder.encode(hijriDay, forKey: "hijri_day")
		}
		if hijriMonth != nil{
			aCoder.encode(hijriMonth, forKey: "hijri_month")
		}
		if hijriYear != nil{
			aCoder.encode(hijriYear, forKey: "hijri_year")
		}
		if id != nil{
			aCoder.encode(id, forKey: "id")
		}
		if officialHoliday != nil{
			aCoder.encode(officialHoliday, forKey: "official_holiday")
		}

	}

}
