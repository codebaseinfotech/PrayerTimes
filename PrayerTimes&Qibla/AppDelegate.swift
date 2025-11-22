//
//  AppDelegate.swift
//  PrayerTimes&Qibla
//
//  Created by Ankit Gabani on 04/11/25.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var isOpenQiblaVC = false
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        setUpHome()
        
        return true
    }
    
    func setUpHome()
    {
        let mainStoryboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let home: PlayerTimeVC = mainStoryboard.instantiateViewController(withIdentifier: "PlayerTimeVC") as! PlayerTimeVC
        let homeNavigation = UINavigationController(rootViewController: home)
        homeNavigation.navigationBar.isHidden = true
        self.window?.rootViewController = homeNavigation
        self.window?.makeKeyAndVisible()
    }
    
    func getSetBadgetCount() -> Int
    {
        if let data = UserDefaults.standard.object(forKey: "SetBadgetCount"){
            
            let arrayObjc = NSKeyedUnarchiver.unarchiveObject(with: data as! Data)
            return arrayObjc as! Int
        }
        return Int()
    }
 
    func saveSetSelectedFajr(isSelected: Bool)
    {
        let data = NSKeyedArchiver.archivedData(withRootObject: isSelected)
        UserDefaults.standard.setValue(data, forKey: "SetSelectedFajr")
        UserDefaults.standard.synchronize()
    }
    func getSetSelectedFajr() -> Bool
    {
        if let data = UserDefaults.standard.object(forKey: "SetSelectedFajr"){
            
            let arrayObjc = NSKeyedUnarchiver.unarchiveObject(with: data as! Data)
            return arrayObjc as! Bool
        }
        return Bool()
    }
    
    //Sunrise
    func saveSetSelectedSunrise(isSelected: Bool)
    {
        let data = NSKeyedArchiver.archivedData(withRootObject: isSelected)
        UserDefaults.standard.setValue(data, forKey: "SetSelectedSunrise")
        UserDefaults.standard.synchronize()
    }
    func getSetSelectedSunrise() -> Bool
    {
        if let data = UserDefaults.standard.object(forKey: "SetSelectedSunrise"){
            
            let arrayObjc = NSKeyedUnarchiver.unarchiveObject(with: data as! Data)
            return arrayObjc as! Bool
        }
        return Bool()
    }
    
    
    //Dhuhr
    func saveSetSelectedDhuhr(isSelected: Bool)
    {
        let data = NSKeyedArchiver.archivedData(withRootObject: isSelected)
        UserDefaults.standard.setValue(data, forKey: "SetSelectedDhuhr")
        UserDefaults.standard.synchronize()
    }
    func getSetSelectedDhuhr() -> Bool
    {
        if let data = UserDefaults.standard.object(forKey: "SetSelectedDhuhr"){
            
            let arrayObjc = NSKeyedUnarchiver.unarchiveObject(with: data as! Data)
            return arrayObjc as! Bool
        }
        return Bool()
    }
    
    //Asr
    func saveSetSelectedAsr(isSelected: Bool)
    {
        let data = NSKeyedArchiver.archivedData(withRootObject: isSelected)
        UserDefaults.standard.setValue(data, forKey: "SetSelectedAsr")
        UserDefaults.standard.synchronize()
    }
    func getSetSelectedAsr() -> Bool
    {
        if let data = UserDefaults.standard.object(forKey: "SetSelectedAsr"){
            
            let arrayObjc = NSKeyedUnarchiver.unarchiveObject(with: data as! Data)
            return arrayObjc as! Bool
        }
        return Bool()
    }
    
    
    //Maghrib
    func saveSetSelectedMaghrib(isSelected: Bool)
    {
        let data = NSKeyedArchiver.archivedData(withRootObject: isSelected)
        UserDefaults.standard.setValue(data, forKey: "SetSelectedMaghrib")
        UserDefaults.standard.synchronize()
    }
    func getSetSelectedMaghrib() -> Bool
    {
        if let data = UserDefaults.standard.object(forKey: "SetSelectedMaghrib"){
            
            let arrayObjc = NSKeyedUnarchiver.unarchiveObject(with: data as! Data)
            return arrayObjc as! Bool
        }
        return Bool()
    }
    
    
    //Isha
    func saveSetSelectedIsha(isSelected: Bool)
    {
        let data = NSKeyedArchiver.archivedData(withRootObject: isSelected)
        UserDefaults.standard.setValue(data, forKey: "SetSelectedIsha")
        UserDefaults.standard.synchronize()
    }
    func getSetSelectedIsha() -> Bool
    {
        if let data = UserDefaults.standard.object(forKey: "SetSelectedIsha"){
            
            let arrayObjc = NSKeyedUnarchiver.unarchiveObject(with: data as! Data)
            return arrayObjc as! Bool
        }
        return Bool()
    }
}

