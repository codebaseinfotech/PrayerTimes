//
//	ALHomeDataCalendar.swift
//
//	Create by Ankit Gabani on 24/4/2024
//	Copyright © 2024. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class ALHomeDataCalendar : NSObject, NSCoding{

	var alAhmediHighTide1Height : Double!
	var alAhmediHighTide1Time : String!
	var alAhmediHighTide2Height : Double!
	var alAhmediHighTide2Time : String!
	var alAhmediLowTide1Height : Double!
	var alAhmediLowTide1Time : String!
	var alAhmediLowTide2Height : Double!
	var alAhmediLowTide2Time : String!
	var asrPrayer : String!
	var createdAt : String!
	var duhurPrayer : String!
	var fajrPrayer : String!
	var georgianDate : String!
	var happenedOnThisDate : String!
	var hijriDay : Int!
	var hijriMonth : String!
	var hijriYear : Int!
	var id : Int!
	var ishaaPrayer : String!
	var maghribPrayer : String!
	var officialHoliday : String!
	var ojeiriat : String!
	var seaCurrent : String!
	var shuwaikhPortHighTide1Height : Double!
	var shuwaikhPortHighTide1Time : String!
	var shuwaikhPortHighTide2Height : Double!
	var shuwaikhPortHighTide2Time : String!
	var shuwaikhPortLowTide1Height : Double!
	var shuwaikhPortLowTide1Time : String!
	var shuwaikhPortLowTide2Height : Double!
	var shuwaikhPortLowTide2Time : String!
	var sunrise : String!


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
		alAhmediHighTide1Height = dictionary["al_ahmedi_high_tide1_height"] as? Double == nil ? 0 : dictionary["al_ahmedi_high_tide1_height"] as? Double
		alAhmediHighTide1Time = dictionary["al_ahmedi_high_tide1_time"] as? String == nil ? "" : dictionary["al_ahmedi_high_tide1_time"] as? String
		alAhmediHighTide2Height = dictionary["al_ahmedi_high_tide2_height"] as? Double == nil ? 0 : dictionary["al_ahmedi_high_tide2_height"] as? Double
		alAhmediHighTide2Time = dictionary["al_ahmedi_high_tide2_time"] as? String == nil ? "" : dictionary["al_ahmedi_high_tide2_time"] as? String
		alAhmediLowTide1Height = dictionary["al_ahmedi_low_tide1_height"] as? Double == nil ? 0 : dictionary["al_ahmedi_low_tide1_height"] as? Double
		alAhmediLowTide1Time = dictionary["al_ahmedi_low_tide1_time"] as? String == nil ? "" : dictionary["al_ahmedi_low_tide1_time"] as? String
		alAhmediLowTide2Height = dictionary["al_ahmedi_low_tide2_height"] as? Double == nil ? 0 : dictionary["al_ahmedi_low_tide2_height"] as? Double
		alAhmediLowTide2Time = dictionary["al_ahmedi_low_tide2_time"] as? String == nil ? "" : dictionary["al_ahmedi_low_tide2_time"] as? String
		asrPrayer = dictionary["asr_prayer"] as? String == nil ? "" : dictionary["asr_prayer"] as? String
		createdAt = dictionary["created_at"] as? String == nil ? "" : dictionary["created_at"] as? String
		duhurPrayer = dictionary["duhur_prayer"] as? String == nil ? "" : dictionary["duhur_prayer"] as? String
		fajrPrayer = dictionary["fajr_prayer"] as? String == nil ? "" : dictionary["fajr_prayer"] as? String
		georgianDate = dictionary["georgian_date"] as? String == nil ? "" : dictionary["georgian_date"] as? String
		happenedOnThisDate = dictionary["happened_on_this_date"] as? String == nil ? "" : dictionary["happened_on_this_date"] as? String
		hijriDay = dictionary["hijri_day"] as? Int == nil ? 0 : dictionary["hijri_day"] as? Int
		hijriMonth = dictionary["hijri_month"] as? String == nil ? "" : dictionary["hijri_month"] as? String
		hijriYear = dictionary["hijri_year"] as? Int == nil ? 0 : dictionary["hijri_year"] as? Int
		id = dictionary["id"] as? Int == nil ? 0 : dictionary["id"] as? Int
		ishaaPrayer = dictionary["ishaa_prayer"] as? String == nil ? "" : dictionary["ishaa_prayer"] as? String
		maghribPrayer = dictionary["maghrib_prayer"] as? String == nil ? "" : dictionary["maghrib_prayer"] as? String
		officialHoliday = dictionary["official_holiday"] as? String == nil ? "" : dictionary["official_holiday"] as? String
		ojeiriat = dictionary["ojeiriat"] as? String == nil ? "" : dictionary["ojeiriat"] as? String
		seaCurrent = dictionary["sea_current"] as? String == nil ? "" : dictionary["sea_current"] as? String
		shuwaikhPortHighTide1Height = dictionary["shuwaikh_port_high_tide1_height"] as? Double == nil ? 0 : dictionary["shuwaikh_port_high_tide1_height"] as? Double
		shuwaikhPortHighTide1Time = dictionary["shuwaikh_port_high_tide1_time"] as? String == nil ? "" : dictionary["shuwaikh_port_high_tide1_time"] as? String
		shuwaikhPortHighTide2Height = dictionary["shuwaikh_port_high_tide2_height"] as? Double == nil ? 0 : dictionary["shuwaikh_port_high_tide2_height"] as? Double
		shuwaikhPortHighTide2Time = dictionary["shuwaikh_port_high_tide2_time"] as? String == nil ? "" : dictionary["shuwaikh_port_high_tide2_time"] as? String
		shuwaikhPortLowTide1Height = dictionary["shuwaikh_port_low_tide1_height"] as? Double == nil ? 0 : dictionary["shuwaikh_port_low_tide1_height"] as? Double
		shuwaikhPortLowTide1Time = dictionary["shuwaikh_port_low_tide1_time"] as? String == nil ? "" : dictionary["shuwaikh_port_low_tide1_time"] as? String
		shuwaikhPortLowTide2Height = dictionary["shuwaikh_port_low_tide2_height"] as? Double == nil ? 0 : dictionary["shuwaikh_port_low_tide2_height"] as? Double
		shuwaikhPortLowTide2Time = dictionary["shuwaikh_port_low_tide2_time"] as? String == nil ? "" : dictionary["shuwaikh_port_low_tide2_time"] as? String
		sunrise = dictionary["sunrise"] as? String == nil ? "" : dictionary["sunrise"] as? String
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		let dictionary = NSMutableDictionary()
		if alAhmediHighTide1Height != nil{
			dictionary["al_ahmedi_high_tide1_height"] = alAhmediHighTide1Height
		}
		if alAhmediHighTide1Time != nil{
			dictionary["al_ahmedi_high_tide1_time"] = alAhmediHighTide1Time
		}
		if alAhmediHighTide2Height != nil{
			dictionary["al_ahmedi_high_tide2_height"] = alAhmediHighTide2Height
		}
		if alAhmediHighTide2Time != nil{
			dictionary["al_ahmedi_high_tide2_time"] = alAhmediHighTide2Time
		}
		if alAhmediLowTide1Height != nil{
			dictionary["al_ahmedi_low_tide1_height"] = alAhmediLowTide1Height
		}
		if alAhmediLowTide1Time != nil{
			dictionary["al_ahmedi_low_tide1_time"] = alAhmediLowTide1Time
		}
		if alAhmediLowTide2Height != nil{
			dictionary["al_ahmedi_low_tide2_height"] = alAhmediLowTide2Height
		}
		if alAhmediLowTide2Time != nil{
			dictionary["al_ahmedi_low_tide2_time"] = alAhmediLowTide2Time
		}
		if asrPrayer != nil{
			dictionary["asr_prayer"] = asrPrayer
		}
		if createdAt != nil{
			dictionary["created_at"] = createdAt
		}
		if duhurPrayer != nil{
			dictionary["duhur_prayer"] = duhurPrayer
		}
		if fajrPrayer != nil{
			dictionary["fajr_prayer"] = fajrPrayer
		}
		if georgianDate != nil{
			dictionary["georgian_date"] = georgianDate
		}
		if happenedOnThisDate != nil{
			dictionary["happened_on_this_date"] = happenedOnThisDate
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
		if ishaaPrayer != nil{
			dictionary["ishaa_prayer"] = ishaaPrayer
		}
		if maghribPrayer != nil{
			dictionary["maghrib_prayer"] = maghribPrayer
		}
		if officialHoliday != nil{
			dictionary["official_holiday"] = officialHoliday
		}
		if ojeiriat != nil{
			dictionary["ojeiriat"] = ojeiriat
		}
		if seaCurrent != nil{
			dictionary["sea_current"] = seaCurrent
		}
		if shuwaikhPortHighTide1Height != nil{
			dictionary["shuwaikh_port_high_tide1_height"] = shuwaikhPortHighTide1Height
		}
		if shuwaikhPortHighTide1Time != nil{
			dictionary["shuwaikh_port_high_tide1_time"] = shuwaikhPortHighTide1Time
		}
		if shuwaikhPortHighTide2Height != nil{
			dictionary["shuwaikh_port_high_tide2_height"] = shuwaikhPortHighTide2Height
		}
		if shuwaikhPortHighTide2Time != nil{
			dictionary["shuwaikh_port_high_tide2_time"] = shuwaikhPortHighTide2Time
		}
		if shuwaikhPortLowTide1Height != nil{
			dictionary["shuwaikh_port_low_tide1_height"] = shuwaikhPortLowTide1Height
		}
		if shuwaikhPortLowTide1Time != nil{
			dictionary["shuwaikh_port_low_tide1_time"] = shuwaikhPortLowTide1Time
		}
		if shuwaikhPortLowTide2Height != nil{
			dictionary["shuwaikh_port_low_tide2_height"] = shuwaikhPortLowTide2Height
		}
		if shuwaikhPortLowTide2Time != nil{
			dictionary["shuwaikh_port_low_tide2_time"] = shuwaikhPortLowTide2Time
		}
		if sunrise != nil{
			dictionary["sunrise"] = sunrise
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         alAhmediHighTide1Height = aDecoder.decodeObject(forKey: "al_ahmedi_high_tide1_height") as? Double
         alAhmediHighTide1Time = aDecoder.decodeObject(forKey: "al_ahmedi_high_tide1_time") as? String
         alAhmediHighTide2Height = aDecoder.decodeObject(forKey: "al_ahmedi_high_tide2_height") as? Double
         alAhmediHighTide2Time = aDecoder.decodeObject(forKey: "al_ahmedi_high_tide2_time") as? String
         alAhmediLowTide1Height = aDecoder.decodeObject(forKey: "al_ahmedi_low_tide1_height") as? Double
         alAhmediLowTide1Time = aDecoder.decodeObject(forKey: "al_ahmedi_low_tide1_time") as? String
         alAhmediLowTide2Height = aDecoder.decodeObject(forKey: "al_ahmedi_low_tide2_height") as? Double
         alAhmediLowTide2Time = aDecoder.decodeObject(forKey: "al_ahmedi_low_tide2_time") as? String
         asrPrayer = aDecoder.decodeObject(forKey: "asr_prayer") as? String
         createdAt = aDecoder.decodeObject(forKey: "created_at") as? String
         duhurPrayer = aDecoder.decodeObject(forKey: "duhur_prayer") as? String
         fajrPrayer = aDecoder.decodeObject(forKey: "fajr_prayer") as? String
         georgianDate = aDecoder.decodeObject(forKey: "georgian_date") as? String
         happenedOnThisDate = aDecoder.decodeObject(forKey: "happened_on_this_date") as? String
         hijriDay = aDecoder.decodeObject(forKey: "hijri_day") as? Int
         hijriMonth = aDecoder.decodeObject(forKey: "hijri_month") as? String
         hijriYear = aDecoder.decodeObject(forKey: "hijri_year") as? Int
         id = aDecoder.decodeObject(forKey: "id") as? Int
         ishaaPrayer = aDecoder.decodeObject(forKey: "ishaa_prayer") as? String
         maghribPrayer = aDecoder.decodeObject(forKey: "maghrib_prayer") as? String
         officialHoliday = aDecoder.decodeObject(forKey: "official_holiday") as? String
         ojeiriat = aDecoder.decodeObject(forKey: "ojeiriat") as? String
         seaCurrent = aDecoder.decodeObject(forKey: "sea_current") as? String
         shuwaikhPortHighTide1Height = aDecoder.decodeObject(forKey: "shuwaikh_port_high_tide1_height") as? Double
         shuwaikhPortHighTide1Time = aDecoder.decodeObject(forKey: "shuwaikh_port_high_tide1_time") as? String
         shuwaikhPortHighTide2Height = aDecoder.decodeObject(forKey: "shuwaikh_port_high_tide2_height") as? Double
         shuwaikhPortHighTide2Time = aDecoder.decodeObject(forKey: "shuwaikh_port_high_tide2_time") as? String
         shuwaikhPortLowTide1Height = aDecoder.decodeObject(forKey: "shuwaikh_port_low_tide1_height") as? Double
         shuwaikhPortLowTide1Time = aDecoder.decodeObject(forKey: "shuwaikh_port_low_tide1_time") as? String
         shuwaikhPortLowTide2Height = aDecoder.decodeObject(forKey: "shuwaikh_port_low_tide2_height") as? Double
         shuwaikhPortLowTide2Time = aDecoder.decodeObject(forKey: "shuwaikh_port_low_tide2_time") as? String
         sunrise = aDecoder.decodeObject(forKey: "sunrise") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    public func encode(with aCoder: NSCoder) 
	{
		if alAhmediHighTide1Height != nil{
			aCoder.encode(alAhmediHighTide1Height, forKey: "al_ahmedi_high_tide1_height")
		}
		if alAhmediHighTide1Time != nil{
			aCoder.encode(alAhmediHighTide1Time, forKey: "al_ahmedi_high_tide1_time")
		}
		if alAhmediHighTide2Height != nil{
			aCoder.encode(alAhmediHighTide2Height, forKey: "al_ahmedi_high_tide2_height")
		}
		if alAhmediHighTide2Time != nil{
			aCoder.encode(alAhmediHighTide2Time, forKey: "al_ahmedi_high_tide2_time")
		}
		if alAhmediLowTide1Height != nil{
			aCoder.encode(alAhmediLowTide1Height, forKey: "al_ahmedi_low_tide1_height")
		}
		if alAhmediLowTide1Time != nil{
			aCoder.encode(alAhmediLowTide1Time, forKey: "al_ahmedi_low_tide1_time")
		}
		if alAhmediLowTide2Height != nil{
			aCoder.encode(alAhmediLowTide2Height, forKey: "al_ahmedi_low_tide2_height")
		}
		if alAhmediLowTide2Time != nil{
			aCoder.encode(alAhmediLowTide2Time, forKey: "al_ahmedi_low_tide2_time")
		}
		if asrPrayer != nil{
			aCoder.encode(asrPrayer, forKey: "asr_prayer")
		}
		if createdAt != nil{
			aCoder.encode(createdAt, forKey: "created_at")
		}
		if duhurPrayer != nil{
			aCoder.encode(duhurPrayer, forKey: "duhur_prayer")
		}
		if fajrPrayer != nil{
			aCoder.encode(fajrPrayer, forKey: "fajr_prayer")
		}
		if georgianDate != nil{
			aCoder.encode(georgianDate, forKey: "georgian_date")
		}
		if happenedOnThisDate != nil{
			aCoder.encode(happenedOnThisDate, forKey: "happened_on_this_date")
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
		if ishaaPrayer != nil{
			aCoder.encode(ishaaPrayer, forKey: "ishaa_prayer")
		}
		if maghribPrayer != nil{
			aCoder.encode(maghribPrayer, forKey: "maghrib_prayer")
		}
		if officialHoliday != nil{
			aCoder.encode(officialHoliday, forKey: "official_holiday")
		}
		if ojeiriat != nil{
			aCoder.encode(ojeiriat, forKey: "ojeiriat")
		}
		if seaCurrent != nil{
			aCoder.encode(seaCurrent, forKey: "sea_current")
		}
		if shuwaikhPortHighTide1Height != nil{
			aCoder.encode(shuwaikhPortHighTide1Height, forKey: "shuwaikh_port_high_tide1_height")
		}
		if shuwaikhPortHighTide1Time != nil{
			aCoder.encode(shuwaikhPortHighTide1Time, forKey: "shuwaikh_port_high_tide1_time")
		}
		if shuwaikhPortHighTide2Height != nil{
			aCoder.encode(shuwaikhPortHighTide2Height, forKey: "shuwaikh_port_high_tide2_height")
		}
		if shuwaikhPortHighTide2Time != nil{
			aCoder.encode(shuwaikhPortHighTide2Time, forKey: "shuwaikh_port_high_tide2_time")
		}
		if shuwaikhPortLowTide1Height != nil{
			aCoder.encode(shuwaikhPortLowTide1Height, forKey: "shuwaikh_port_low_tide1_height")
		}
		if shuwaikhPortLowTide1Time != nil{
			aCoder.encode(shuwaikhPortLowTide1Time, forKey: "shuwaikh_port_low_tide1_time")
		}
		if shuwaikhPortLowTide2Height != nil{
			aCoder.encode(shuwaikhPortLowTide2Height, forKey: "shuwaikh_port_low_tide2_height")
		}
		if shuwaikhPortLowTide2Time != nil{
			aCoder.encode(shuwaikhPortLowTide2Time, forKey: "shuwaikh_port_low_tide2_time")
		}
		if sunrise != nil{
			aCoder.encode(sunrise, forKey: "sunrise")
		}

	}

}
