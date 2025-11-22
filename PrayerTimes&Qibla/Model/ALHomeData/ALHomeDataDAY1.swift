//
//	ALHomeDataDAY1.swift
//
//	Create by Ankit Gabani on 24/4/2024
//	Copyright © 2024. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class ALHomeDataDAY1 : NSObject, NSCoding{

	var dATE : String!
	var dAY : String!
	var sEACURRENT : String!
	var sEASTATEDAY : String!
	var sEASTATENIGHT : String!
	var wAVEHEIGHTDAY : String!
	var wAVEHEIGHTNIGHT : String!
	var dAYFCAST : String!
	var mAXHUM : String!
	var mAXTEMPEXP : String!
	var mAXTEMPREC : String!
	var mINTEMPEXP : String!
	var mINTEMPREC : String!
	var nIGHTFCAST : String!
	var wTHRCOND : String!
	var wTHRICON : String!


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
		dATE = dictionary["DATE"] as? String == nil ? "" : dictionary["DATE"] as? String
		dAY = dictionary["DAY"] as? String == nil ? "" : dictionary["DAY"] as? String
		sEACURRENT = dictionary["SEACURRENT"] as? String == nil ? "" : dictionary["SEACURRENT"] as? String
		sEASTATEDAY = dictionary["SEASTATE_DAY"] as? String == nil ? "" : dictionary["SEASTATE_DAY"] as? String
		sEASTATENIGHT = dictionary["SEASTATE_NIGHT"] as? String == nil ? "" : dictionary["SEASTATE_NIGHT"] as? String
		wAVEHEIGHTDAY = dictionary["WAVE_HEIGHT_DAY"] as? String == nil ? "" : dictionary["WAVE_HEIGHT_DAY"] as? String
		wAVEHEIGHTNIGHT = dictionary["WAVE_HEIGHT_NIGHT"] as? String == nil ? "" : dictionary["WAVE_HEIGHT_NIGHT"] as? String
		dAYFCAST = dictionary["DAY_FCAST"] as? String == nil ? "" : dictionary["DAY_FCAST"] as? String
		mAXHUM = dictionary["MAX_HUM"] as? String == nil ? "" : dictionary["MAX_HUM"] as? String
		mAXTEMPEXP = dictionary["MAX_TEMP_EXP"] as? String == nil ? "" : dictionary["MAX_TEMP_EXP"] as? String
		mAXTEMPREC = dictionary["MAX_TEMP_REC"] as? String == nil ? "" : dictionary["MAX_TEMP_REC"] as? String
		mINTEMPEXP = dictionary["MIN_TEMP_EXP"] as? String == nil ? "" : dictionary["MIN_TEMP_EXP"] as? String
		mINTEMPREC = dictionary["MIN_TEMP_REC"] as? String == nil ? "" : dictionary["MIN_TEMP_REC"] as? String
		nIGHTFCAST = dictionary["NIGHT_FCAST"] as? String == nil ? "" : dictionary["NIGHT_FCAST"] as? String
		wTHRCOND = dictionary["WTHR_COND"] as? String == nil ? "" : dictionary["WTHR_COND"] as? String
		wTHRICON = dictionary["WTHR_ICON"] as? String == nil ? "" : dictionary["WTHR_ICON"] as? String
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		let dictionary = NSMutableDictionary()
		if dATE != nil{
			dictionary["DATE"] = dATE
		}
		if dAY != nil{
			dictionary["DAY"] = dAY
		}
		if sEACURRENT != nil{
			dictionary["SEACURRENT"] = sEACURRENT
		}
		if sEASTATEDAY != nil{
			dictionary["SEASTATE_DAY"] = sEASTATEDAY
		}
		if sEASTATENIGHT != nil{
			dictionary["SEASTATE_NIGHT"] = sEASTATENIGHT
		}
		if wAVEHEIGHTDAY != nil{
			dictionary["WAVE_HEIGHT_DAY"] = wAVEHEIGHTDAY
		}
		if wAVEHEIGHTNIGHT != nil{
			dictionary["WAVE_HEIGHT_NIGHT"] = wAVEHEIGHTNIGHT
		}
		if dAYFCAST != nil{
			dictionary["DAY_FCAST"] = dAYFCAST
		}
		if mAXHUM != nil{
			dictionary["MAX_HUM"] = mAXHUM
		}
		if mAXTEMPEXP != nil{
			dictionary["MAX_TEMP_EXP"] = mAXTEMPEXP
		}
		if mAXTEMPREC != nil{
			dictionary["MAX_TEMP_REC"] = mAXTEMPREC
		}
		if mINTEMPEXP != nil{
			dictionary["MIN_TEMP_EXP"] = mINTEMPEXP
		}
		if mINTEMPREC != nil{
			dictionary["MIN_TEMP_REC"] = mINTEMPREC
		}
		if nIGHTFCAST != nil{
			dictionary["NIGHT_FCAST"] = nIGHTFCAST
		}
		if wTHRCOND != nil{
			dictionary["WTHR_COND"] = wTHRCOND
		}
		if wTHRICON != nil{
			dictionary["WTHR_ICON"] = wTHRICON
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         dATE = aDecoder.decodeObject(forKey: "DATE") as? String
         dAY = aDecoder.decodeObject(forKey: "DAY") as? String
         sEACURRENT = aDecoder.decodeObject(forKey: "SEACURRENT") as? String
         sEASTATEDAY = aDecoder.decodeObject(forKey: "SEASTATE_DAY") as? String
         sEASTATENIGHT = aDecoder.decodeObject(forKey: "SEASTATE_NIGHT") as? String
         wAVEHEIGHTDAY = aDecoder.decodeObject(forKey: "WAVE_HEIGHT_DAY") as? String
         wAVEHEIGHTNIGHT = aDecoder.decodeObject(forKey: "WAVE_HEIGHT_NIGHT") as? String
         dAYFCAST = aDecoder.decodeObject(forKey: "DAY_FCAST") as? String
         mAXHUM = aDecoder.decodeObject(forKey: "MAX_HUM") as? String
         mAXTEMPEXP = aDecoder.decodeObject(forKey: "MAX_TEMP_EXP") as? String
         mAXTEMPREC = aDecoder.decodeObject(forKey: "MAX_TEMP_REC") as? String
         mINTEMPEXP = aDecoder.decodeObject(forKey: "MIN_TEMP_EXP") as? String
         mINTEMPREC = aDecoder.decodeObject(forKey: "MIN_TEMP_REC") as? String
         nIGHTFCAST = aDecoder.decodeObject(forKey: "NIGHT_FCAST") as? String
         wTHRCOND = aDecoder.decodeObject(forKey: "WTHR_COND") as? String
         wTHRICON = aDecoder.decodeObject(forKey: "WTHR_ICON") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    public func encode(with aCoder: NSCoder) 
	{
		if dATE != nil{
			aCoder.encode(dATE, forKey: "DATE")
		}
		if dAY != nil{
			aCoder.encode(dAY, forKey: "DAY")
		}
		if sEACURRENT != nil{
			aCoder.encode(sEACURRENT, forKey: "SEACURRENT")
		}
		if sEASTATEDAY != nil{
			aCoder.encode(sEASTATEDAY, forKey: "SEASTATE_DAY")
		}
		if sEASTATENIGHT != nil{
			aCoder.encode(sEASTATENIGHT, forKey: "SEASTATE_NIGHT")
		}
		if wAVEHEIGHTDAY != nil{
			aCoder.encode(wAVEHEIGHTDAY, forKey: "WAVE_HEIGHT_DAY")
		}
		if wAVEHEIGHTNIGHT != nil{
			aCoder.encode(wAVEHEIGHTNIGHT, forKey: "WAVE_HEIGHT_NIGHT")
		}
		if dAYFCAST != nil{
			aCoder.encode(dAYFCAST, forKey: "DAY_FCAST")
		}
		if mAXHUM != nil{
			aCoder.encode(mAXHUM, forKey: "MAX_HUM")
		}
		if mAXTEMPEXP != nil{
			aCoder.encode(mAXTEMPEXP, forKey: "MAX_TEMP_EXP")
		}
		if mAXTEMPREC != nil{
			aCoder.encode(mAXTEMPREC, forKey: "MAX_TEMP_REC")
		}
		if mINTEMPEXP != nil{
			aCoder.encode(mINTEMPEXP, forKey: "MIN_TEMP_EXP")
		}
		if mINTEMPREC != nil{
			aCoder.encode(mINTEMPREC, forKey: "MIN_TEMP_REC")
		}
		if nIGHTFCAST != nil{
			aCoder.encode(nIGHTFCAST, forKey: "NIGHT_FCAST")
		}
		if wTHRCOND != nil{
			aCoder.encode(wTHRCOND, forKey: "WTHR_COND")
		}
		if wTHRICON != nil{
			aCoder.encode(wTHRICON, forKey: "WTHR_ICON")
		}

	}

}
