//
//	ALHomeData.swift
//
//	Create by Ankit Gabani on 24/4/2024
//	Copyright © 2024. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class ALHomeData : NSObject, NSCoding{

	var banners : [ALHomeDataBanner]!
	var calendar : ALHomeDataCalendar!
	var code : Int!
	var marineForecast : ALHomeDataMarineForecast!
	var message : String!
	var nearestMosque : ALHomeDataNearestMosque!
	var nextPrayerTime : ALHomeDataNextPrayerTime!
	var status : Bool!
	var upcomingHoliday : ALHomeDataUpcomingHoliday!
	var weather : ALHomeDataWeather!
    var current_temp : String!
    var humadity_with_temp : [ALHomeHumadityWithTemp]!


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
		banners = [ALHomeDataBanner]()
		if let bannersArray = dictionary["banners"] as? [NSDictionary]{
			for dic in bannersArray{
				let value = ALHomeDataBanner(fromDictionary: dic)
				banners.append(value)
			}
		}
        
        humadity_with_temp = [ALHomeHumadityWithTemp]()
        if let bannersArray = dictionary["humadity_with_temp"] as? [NSDictionary]{
            for dic in bannersArray{
                let value = ALHomeHumadityWithTemp(fromDictionary: dic)
                humadity_with_temp.append(value)
            }
        }
        
		if let calendarData = dictionary["calendar"] as? NSDictionary{
			calendar = ALHomeDataCalendar(fromDictionary: calendarData)
		}
		else
		{
			calendar = ALHomeDataCalendar(fromDictionary: NSDictionary.init())
		}
		code = dictionary["code"] as? Int == nil ? 0 : dictionary["code"] as? Int
		if let marineForecastData = dictionary["marine_forecast"] as? NSDictionary{
			marineForecast = ALHomeDataMarineForecast(fromDictionary: marineForecastData)
		}
		else
		{
			marineForecast = ALHomeDataMarineForecast(fromDictionary: NSDictionary.init())
		}
		message = dictionary["message"] as? String == nil ? "" : dictionary["message"] as? String
        current_temp = dictionary["current_temp"] as? String == nil ? "" : dictionary["current_temp"] as? String

		if let nearestMosqueData = dictionary["nearest_mosque"] as? NSDictionary{
			nearestMosque = ALHomeDataNearestMosque(fromDictionary: nearestMosqueData)
		}
		else
		{
			nearestMosque = ALHomeDataNearestMosque(fromDictionary: NSDictionary.init())
		}
		if let nextPrayerTimeData = dictionary["next_prayer_time"] as? NSDictionary{
			nextPrayerTime = ALHomeDataNextPrayerTime(fromDictionary: nextPrayerTimeData)
		}
		else
		{
			nextPrayerTime = ALHomeDataNextPrayerTime(fromDictionary: NSDictionary.init())
		}
		status = dictionary["status"] as? Bool == nil ? false : dictionary["status"] as? Bool
		if let upcomingHolidayData = dictionary["upcoming_holiday"] as? NSDictionary{
			upcomingHoliday = ALHomeDataUpcomingHoliday(fromDictionary: upcomingHolidayData)
		}
		else
		{
			upcomingHoliday = ALHomeDataUpcomingHoliday(fromDictionary: NSDictionary.init())
		}
		if let weatherData = dictionary["weather"] as? NSDictionary{
			weather = ALHomeDataWeather(fromDictionary: weatherData)
		}
		else
		{
			weather = ALHomeDataWeather(fromDictionary: NSDictionary.init())
		}
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		let dictionary = NSMutableDictionary()
		if banners != nil{
			var dictionaryElements = [NSDictionary]()
			for bannersElement in banners {
				dictionaryElements.append(bannersElement.toDictionary())
			}
			dictionary["banners"] = dictionaryElements
		}
        
        if humadity_with_temp != nil{
            var dictionaryElements = [NSDictionary]()
            for bannersElement in humadity_with_temp {
                dictionaryElements.append(bannersElement.toDictionary())
            }
            dictionary["humadity_with_temp"] = dictionaryElements
        }
        
		if calendar != nil{
			dictionary["calendar"] = calendar.toDictionary()
		}
		if code != nil{
			dictionary["code"] = code
		}
		if marineForecast != nil{
			dictionary["marine_forecast"] = marineForecast.toDictionary()
		}
		if message != nil{
			dictionary["message"] = message
		}
        if current_temp != nil{
            dictionary["current_temp"] = current_temp
        }
		if nearestMosque != nil{
			dictionary["nearest_mosque"] = nearestMosque.toDictionary()
		}
		if nextPrayerTime != nil{
			dictionary["next_prayer_time"] = nextPrayerTime.toDictionary()
		}
		if status != nil{
			dictionary["status"] = status
		}
		if upcomingHoliday != nil{
			dictionary["upcoming_holiday"] = upcomingHoliday.toDictionary()
		}
		if weather != nil{
			dictionary["weather"] = weather.toDictionary()
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
        humadity_with_temp = aDecoder.decodeObject(forKey: "humadity_with_temp") as? [ALHomeHumadityWithTemp]

         banners = aDecoder.decodeObject(forKey: "banners") as? [ALHomeDataBanner]
         calendar = aDecoder.decodeObject(forKey: "calendar") as? ALHomeDataCalendar
         code = aDecoder.decodeObject(forKey: "code") as? Int
         marineForecast = aDecoder.decodeObject(forKey: "marine_forecast") as? ALHomeDataMarineForecast
         message = aDecoder.decodeObject(forKey: "message") as? String
        current_temp = aDecoder.decodeObject(forKey: "current_temp") as? String

         nearestMosque = aDecoder.decodeObject(forKey: "nearest_mosque") as? ALHomeDataNearestMosque
         nextPrayerTime = aDecoder.decodeObject(forKey: "next_prayer_time") as? ALHomeDataNextPrayerTime
         status = aDecoder.decodeObject(forKey: "status") as? Bool
         upcomingHoliday = aDecoder.decodeObject(forKey: "upcoming_holiday") as? ALHomeDataUpcomingHoliday
         weather = aDecoder.decodeObject(forKey: "weather") as? ALHomeDataWeather

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    public func encode(with aCoder: NSCoder) 
	{
		if banners != nil{
			aCoder.encode(banners, forKey: "banners")
		}
        
        if humadity_with_temp != nil{
            aCoder.encode(humadity_with_temp, forKey: "humadity_with_temp")
        }
        
		if calendar != nil{
			aCoder.encode(calendar, forKey: "calendar")
		}
		if code != nil{
			aCoder.encode(code, forKey: "code")
		}
		if marineForecast != nil{
			aCoder.encode(marineForecast, forKey: "marine_forecast")
		}
		if message != nil{
			aCoder.encode(message, forKey: "message")
		}
        if current_temp != nil{
            aCoder.encode(current_temp, forKey: "current_temp")
        }
		if nearestMosque != nil{
			aCoder.encode(nearestMosque, forKey: "nearest_mosque")
		}
		if nextPrayerTime != nil{
			aCoder.encode(nextPrayerTime, forKey: "next_prayer_time")
		}
		if status != nil{
			aCoder.encode(status, forKey: "status")
		}
		if upcomingHoliday != nil{
			aCoder.encode(upcomingHoliday, forKey: "upcoming_holiday")
		}
		if weather != nil{
			aCoder.encode(weather, forKey: "weather")
		}

	}

}

class ALHomeHumadityWithTemp : NSObject, NSCoding{

    var high_temp : Double!
    var humadity : Int!
    var low_temp : Double!
    var requested_date : String!


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
        high_temp = dictionary["high_temp"] as? Double == nil ? 0.0 : dictionary["high_temp"] as? Double
        humadity = dictionary["humadity"] as? Int == nil ? 0 : dictionary["humadity"] as? Int
        low_temp = dictionary["low_temp"] as? Double == nil ? 0.0 : dictionary["low_temp"] as? Double
        requested_date = dictionary["requested_date"] as? String == nil ? "" : dictionary["requested_date"] as? String
    }

    /**
     * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> NSDictionary
    {
        let dictionary = NSMutableDictionary()
        if high_temp != nil{
            dictionary["high_temp"] = high_temp
        }
        if humadity != nil{
            dictionary["humadity"] = humadity
        }
        if low_temp != nil{
            dictionary["low_temp"] = low_temp
        }
        if requested_date != nil{
            dictionary["requested_date"] = requested_date
        }
        return dictionary
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
        high_temp = aDecoder.decodeObject(forKey: "high_temp") as? Double
        humadity = aDecoder.decodeObject(forKey: "humadity") as? Int
        low_temp = aDecoder.decodeObject(forKey: "low_temp") as? Double
        requested_date = aDecoder.decodeObject(forKey: "requested_date") as? String
    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    public func encode(with aCoder: NSCoder)
    {
        if high_temp != nil{
            aCoder.encode(high_temp, forKey: "high_temp")
        }
        if humadity != nil{
            aCoder.encode(humadity, forKey: "humadity")
        }
        if low_temp != nil{
            aCoder.encode(low_temp, forKey: "low_temp")
        }
        if requested_date != nil{
            aCoder.encode(requested_date, forKey: "requested_date")
        }

    }

}
