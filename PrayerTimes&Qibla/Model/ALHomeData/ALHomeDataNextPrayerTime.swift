//
//	ALHomeDataNextPrayerTime.swift
//
//	Create by Ankit Gabani on 24/4/2024
//	Copyright © 2024. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class ALHomeDataNextPrayerTime : NSObject, NSCoding{

	var asrPrayer : String!
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
	var prayerIdex : String!
	var seaCurrent : String!
	var sunrise : String!
	var viewDuhurPrayer : String!
	var viewFajrPrayer : String!
	var viewIshaaPrayer : String!
	var viewMaghribPrayer : String!
	var viewSunrise : String!
	var viewViewAsrPrayer : String!


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
		asrPrayer = dictionary["asr_prayer"] as? String == nil ? "" : dictionary["asr_prayer"] as? String
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
		prayerIdex = dictionary["prayer_idex"] as? String == nil ? "" : dictionary["prayer_idex"] as? String
		seaCurrent = dictionary["sea_current"] as? String == nil ? "" : dictionary["sea_current"] as? String
		sunrise = dictionary["sunrise"] as? String == nil ? "" : dictionary["sunrise"] as? String
		viewDuhurPrayer = dictionary["view_duhur_prayer"] as? String == nil ? "" : dictionary["view_duhur_prayer"] as? String
		viewFajrPrayer = dictionary["view_fajr_prayer"] as? String == nil ? "" : dictionary["view_fajr_prayer"] as? String
		viewIshaaPrayer = dictionary["view_ishaa_prayer"] as? String == nil ? "" : dictionary["view_ishaa_prayer"] as? String
		viewMaghribPrayer = dictionary["view_maghrib_prayer"] as? String == nil ? "" : dictionary["view_maghrib_prayer"] as? String
		viewSunrise = dictionary["view_sunrise"] as? String == nil ? "" : dictionary["view_sunrise"] as? String
		viewViewAsrPrayer = dictionary["view_view_asr_prayer"] as? String == nil ? "" : dictionary["view_view_asr_prayer"] as? String
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		let dictionary = NSMutableDictionary()
		if asrPrayer != nil{
			dictionary["asr_prayer"] = asrPrayer
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
		if prayerIdex != nil{
			dictionary["prayer_idex"] = prayerIdex
		}
		if seaCurrent != nil{
			dictionary["sea_current"] = seaCurrent
		}
		if sunrise != nil{
			dictionary["sunrise"] = sunrise
		}
		if viewDuhurPrayer != nil{
			dictionary["view_duhur_prayer"] = viewDuhurPrayer
		}
		if viewFajrPrayer != nil{
			dictionary["view_fajr_prayer"] = viewFajrPrayer
		}
		if viewIshaaPrayer != nil{
			dictionary["view_ishaa_prayer"] = viewIshaaPrayer
		}
		if viewMaghribPrayer != nil{
			dictionary["view_maghrib_prayer"] = viewMaghribPrayer
		}
		if viewSunrise != nil{
			dictionary["view_sunrise"] = viewSunrise
		}
		if viewViewAsrPrayer != nil{
			dictionary["view_view_asr_prayer"] = viewViewAsrPrayer
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         asrPrayer = aDecoder.decodeObject(forKey: "asr_prayer") as? String
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
         prayerIdex = aDecoder.decodeObject(forKey: "prayer_idex") as? String
         seaCurrent = aDecoder.decodeObject(forKey: "sea_current") as? String
         sunrise = aDecoder.decodeObject(forKey: "sunrise") as? String
         viewDuhurPrayer = aDecoder.decodeObject(forKey: "view_duhur_prayer") as? String
         viewFajrPrayer = aDecoder.decodeObject(forKey: "view_fajr_prayer") as? String
         viewIshaaPrayer = aDecoder.decodeObject(forKey: "view_ishaa_prayer") as? String
         viewMaghribPrayer = aDecoder.decodeObject(forKey: "view_maghrib_prayer") as? String
         viewSunrise = aDecoder.decodeObject(forKey: "view_sunrise") as? String
         viewViewAsrPrayer = aDecoder.decodeObject(forKey: "view_view_asr_prayer") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    public func encode(with aCoder: NSCoder) 
	{
		if asrPrayer != nil{
			aCoder.encode(asrPrayer, forKey: "asr_prayer")
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
		if prayerIdex != nil{
			aCoder.encode(prayerIdex, forKey: "prayer_idex")
		}
		if seaCurrent != nil{
			aCoder.encode(seaCurrent, forKey: "sea_current")
		}
		if sunrise != nil{
			aCoder.encode(sunrise, forKey: "sunrise")
		}
		if viewDuhurPrayer != nil{
			aCoder.encode(viewDuhurPrayer, forKey: "view_duhur_prayer")
		}
		if viewFajrPrayer != nil{
			aCoder.encode(viewFajrPrayer, forKey: "view_fajr_prayer")
		}
		if viewIshaaPrayer != nil{
			aCoder.encode(viewIshaaPrayer, forKey: "view_ishaa_prayer")
		}
		if viewMaghribPrayer != nil{
			aCoder.encode(viewMaghribPrayer, forKey: "view_maghrib_prayer")
		}
		if viewSunrise != nil{
			aCoder.encode(viewSunrise, forKey: "view_sunrise")
		}
		if viewViewAsrPrayer != nil{
			aCoder.encode(viewViewAsrPrayer, forKey: "view_view_asr_prayer")
		}

	}

}
