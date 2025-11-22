//
//  DistanceVC.swift
//  PrayerTimes&Qibla
//
//  Created by Ankit Gabani on 04/11/25.
//

import UIKit
import CoreLocation

class DistanceVC: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var tblView: UITableView!
        
    @IBOutlet weak var lblTitl: UILabel!
    
    var obj_latitude = 0.0
    var obj_logitude = 0.0
    
    var dicNearest = ALHomeDataNearestMosque()
    
    var arrNearest: [ALHomeDataNearestMosque] = [ALHomeDataNearestMosque]()
    
    let locationManager = CLLocationManager()
    
    //MARK: - view Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblTitl.text = "Nearest Mosque".localizeString(string: Language.shared.currentAppLang)
        
        callGetMosquesAPI()
        
        tblView.delegate = self
        tblView.dataSource = self
        
        if Language.shared.isArabic {
            lblTitl.textAlignment = .center
        } else {
            lblTitl.textAlignment = .center
        }
        
        DispatchQueue.main.async {
            if CLLocationManager.locationServicesEnabled(){
                self.locationManager.delegate = self
                self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
                self.locationManager.distanceFilter = 10
                self.locationManager.requestWhenInUseAuthorization()
                self.locationManager.requestAlwaysAuthorization()
                self.locationManager.startUpdatingLocation()
            }
        }

        // Do any additional setup after loading the view.
    }
    @IBAction func tappedHome(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
        self.navigationController?.pushViewController(vc, animated: false)
    }
    @IBAction func tappedPyers(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "PlayerTimeVC") as! PlayerTimeVC
        self.navigationController?.pushViewController(vc, animated: false)
    }
    @IBAction func tappedQubila(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "QiblaVC") as! QiblaVC
        self.navigationController?.pushViewController(vc, animated: false)
    }
    @IBAction func tappedMore(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "MoreVC") as! MoreVC
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
    //MARK: - get User Location
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // Get the most recent location
        
        let location = locations.last
        
        let latitude = location?.coordinate.latitude ?? 0.0
        let longitude = location?.coordinate.longitude ?? 0.0
        
        self.obj_latitude = latitude
        self.obj_logitude = longitude
        
        // Print latitude and longitude
        print("Latitude: \(latitude), Longitude: \(longitude)")
        
        callGetMosquesAPI()
        
        // Stop updating location if you no longer need it
        locationManager.stopUpdatingLocation()
    }
   
    
    // MARK: - callingAPI
    
    func callGetMosquesAPI()
    {
        APIClient.sharedInstance.showIndicator()
        
        let latitude = "\(obj_latitude)"
        
        let longitude = "\(obj_logitude)"
        
        let param = ["latitude":latitude,"longitude":longitude]
        
        print(param)
        
        APIClient.sharedInstance.MakeAPICallWithAuthHeaderGet(GET_MOSQUES, parameters: param) { response, error, statusCode in
            
            print("STATUSCODE \(String(describing: statusCode))")
            print("RESPONSE \(String(describing: response))")
            
            if error == nil {
                APIClient.sharedInstance.hideIndicator()
                
                let status = response?.value(forKey: "status") as? Int
                let message = response?.value(forKey: "message") as? String
                
                if statusCode == 200
                {
                    if status == 1
                    {
                        self.arrNearest.removeAll()
                        if let dicNearest = response?.value(forKey: "nearest_mosque") as? NSDictionary
                        {
                            let dicData = ALHomeDataNearestMosque(fromDictionary: dicNearest)
                            self.dicNearest = dicData
                        }
                        
                        if let arr_mosques = response?.value(forKey: "mosques") as? NSArray
                        {
                            for obj in arr_mosques
                            {
                                let dicData = ALHomeDataNearestMosque(fromDictionary: obj as! NSDictionary)
                                self.arrNearest.append(dicData)
                            }
                        }
                        
                        if self.obj_latitude == 0.0
                        {
                            self.arrNearest.sort { $0.name < $1.name }
                        }
                        
                        self.tblView.reloadData()
                    }
                    else
                    {
                        APIClient.sharedInstance.hideIndicator()
                    }
                }
                else
                {
                    APIClient.sharedInstance.hideIndicator()
                }
            }
            else
            {
                APIClient.sharedInstance.hideIndicator()
            }
        }
    }

}

// MARK: - tblView Delegate & DataSource
extension DistanceVC: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrNearest.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tblView.dequeueReusableCell(withIdentifier: "NearestLocCell") as! NearestLocCell
        
        let dicData = arrNearest[indexPath.row]
        
        cell.lblName.text = dicData.name ?? ""
        cell.lblName2.text = dicData.name ?? ""

        
        cell.btnOpenMap.tag = indexPath.row
        cell.btnOpenMap.addTarget(self, action: #selector(clickedOpenMap(_:)), for: .touchUpInside)

        if self.obj_latitude != 0.0
        {
            let str_km = "km".localizeString(string: Language.shared.currentAppLang)
            
            cell.lblKm.text = "\(dicData.distance ?? "") \(str_km)"
            
            cell.lblName.isHidden = false
            cell.lblName2.isHidden = true
            cell.lblKm.isHidden = false
            
            cell.lblTNereat.textColor = UIColor(hexString: "#04230B")
 
            if indexPath.row == 0
            {
                cell.viewMain.backgroundColor = .white

                cell.lblName.textColor = UIColor(hexString: "#04230B")
                cell.lblKm.textColor = UIColor(hexString: "#04230B")
                cell.lblTNereat.textColor = UIColor(hexString: "#04230B")
                cell.imgNav.tintColor = UIColor(hexString: "#04230B")
                
                cell.lblName2.textColor = UIColor(hexString: "#04230B")
                
                cell.lblTNereat.isHidden = false
                
                cell.imgCenter25.constant = 25

            }
            else
            {
                cell.viewMain.backgroundColor = UIColor(hexString: "#04230B")
                
                cell.lblName.textColor = .white
                cell.lblKm.textColor = .white
                cell.lblTNereat.textColor = .white
                cell.imgNav.tintColor = .white
                
                cell.lblName2.textColor = .white
                
                cell.lblTNereat.isHidden = true
                
                cell.imgCenter25.constant = 25
            }
        }
        else
        {
            cell.lblKm.isHidden = true
            cell.lblTNereat.isHidden = true
            cell.lblName.isHidden = true
            
            cell.lblName2.isHidden = false
            
            cell.viewMain.backgroundColor = UIColor(hexString: "#04230B")
            cell.lblName.textColor = .white
            cell.lblKm.textColor = .white
            cell.lblTNereat.textColor = .white
            cell.imgNav.tintColor = .white
            
            cell.lblName2.textColor = .white
            
            cell.imgCenter25.constant = 12
            
        }
 
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    @objc func clickedOpenMap(_ sender: UIButton)
    {
        let dicData = arrNearest[sender.tag]
        
        let latitudeString = dicData.latitude ?? ""
        let longitudeString = dicData.longitude ?? ""
        
        // Convert latitude and longitude strings to Double
        guard let latitude = Double(latitudeString), let longitude = Double(longitudeString) else {
            print("Invalid latitude or longitude")
            return
        }
        
        // Create a URL string with the latitude and longitude
        let urlString = "comgooglemaps://?center=\(latitude),\(longitude)"
        
        // Check if Google Maps app is installed, if not, open in Safari
        if let url = URL(string: urlString) {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                // Google Maps app is not installed, open in Safari
                let fallbackURL = "https://www.google.com/maps/search/?api=1&query=\(latitude),\(longitude)"
                UIApplication.shared.open(URL(string: fallbackURL)!, options: [:], completionHandler: nil)
            }
        }
    }
}

// MARK: - NearestLocCell
class NearestLocCell: UITableViewCell
{
    
    @IBOutlet weak var imgCenter25: NSLayoutConstraint!
    @IBOutlet weak var lblName2: UILabel!
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblKm: UILabel!
    @IBOutlet weak var lblTNereat: UILabel!
    @IBOutlet weak var imgNav: UIImageView!
    @IBOutlet weak var viewMain: UIView!
    
    @IBOutlet weak var btnOpenMap: UIButton!
}
