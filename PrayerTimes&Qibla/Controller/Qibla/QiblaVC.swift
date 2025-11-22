//
//  QiblaVC.swift
//  PrayerTimes&Qibla
//
//  Created by Ankit Gabani on 04/11/25.
//

import UIKit
import CoreLocation
import AVKit

class QiblaVC: UIViewController {
    
    @IBOutlet weak var btnCont: UIButton!
    
    @IBOutlet weak var lblHeaderTitle: UILabel!
    
    @IBOutlet weak var viewLocation: UIView!
    @IBOutlet weak var viewComppas: UIView!
    
    @IBOutlet weak var imgCompass: UIImageView!
    
    @IBOutlet weak var lblCom: UILabel!
    
    @IBOutlet weak var imgDiraction: UIImageView!
    
    let locationDelegate = LocationDelegate()
    var latestLocation: CLLocation? = nil
    var yourLocationBearing: CGFloat { return latestLocation?.bearingToLocationRadian(self.yourLocation) ?? 0 }
    var yourLocation: CLLocation {
      get { return UserDefaults.standard.currentLocation }
      set { UserDefaults.standard.currentLocation = newValue }
    }
    
    let locationManager: CLLocationManager = {
      $0.requestWhenInUseAuthorization()
      $0.desiredAccuracy = kCLLocationAccuracyBest
      $0.startUpdatingLocation()
      $0.startUpdatingHeading()
      return $0
    }(CLLocationManager())
    
    private func orientationAdjustment() -> CGFloat {
      let isFaceDown: Bool = {
        switch UIDevice.current.orientation {
        case .faceDown: return true
        default: return false
        }
      }()
      
      let adjAngle: CGFloat = {
        switch UIApplication.shared.statusBarOrientation {
        case .landscapeLeft:  return 90
        case .landscapeRight: return -90
        case .portrait, .unknown: return 0
        case .portraitUpsideDown: return isFaceDown ? 180 : -180
        }
      }()
      return adjAngle
    }
    
    // MARK: - view Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnCont.setTitle("Continue".localizeString(string: Language.shared.currentAppLang), for: .normal)
        
        lblHeaderTitle.text = "Qibla Direction".localizeString(string: Language.shared.currentAppLang)
 
        if Language.shared.isArabic {
            lblHeaderTitle.textAlignment = .center
        } else {
            lblHeaderTitle.textAlignment = .center
        }
    
        checkLocationAuthorizationStatus()
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func tappedHome(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
        self.navigationController?.pushViewController(vc, animated: false)
    }
    @IBAction func tappedPrayer(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "PlayerTimeVC") as! PlayerTimeVC
        self.navigationController?.pushViewController(vc, animated: false)
    }
    @IBAction func tappedMosque(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DistanceVC") as! DistanceVC
        self.navigationController?.pushViewController(vc, animated: false)
    }
    @IBAction func tappedMore(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "MoreVC") as! MoreVC
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
    func checkLocationAuthorizationStatus() {
       
        switch CLLocationManager.authorizationStatus() {
        case .authorizedAlways, .authorizedWhenInUse:
            print("Location access is allowed.")
            
            viewComppas.isHidden = false
            viewLocation.isHidden = true
            
            locationManager.delegate = locationDelegate
            
            // location of my device at all times
            locationDelegate.locationCallback = { location in
              self.latestLocation = location
            }
            
            locationDelegate.headingCallback = { newHeading in
              
              func computeNewAngle(with newAngle: CGFloat) -> CGFloat {
                let heading: CGFloat = {
                  let originalHeading = self.yourLocationBearing - newAngle.degreesToRadians
                  switch UIDevice.current.orientation {
                  case .faceDown: return -originalHeading
                  default: return originalHeading
                  }
                }()
                
                return CGFloat(self.orientationAdjustment().degreesToRadians + heading)
              }
              
              UIView.animate(withDuration: 0.5) {
                let angle = computeNewAngle(with: CGFloat(newHeading))
                self.imgCompass.transform = CGAffineTransform(rotationAngle: angle)
              }
            }
            
            locationManager.requestWhenInUseAuthorization()
            
            // Set up location manager
            locationManager.delegate = self
            locationManager.startUpdatingHeading()
            
        case .denied:
            print("Location access is denied.")
            
            viewComppas.isHidden = true
            viewLocation.isHidden = false
        case .notDetermined:
            print("Location access status is not determined. Requesting permission...")
            
            viewComppas.isHidden = true
            viewLocation.isHidden = false
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("Location access is restricted.")
            viewComppas.isHidden = true
            viewLocation.isHidden = false
        @unknown default:
            print("Unknown authorization status.")
            viewComppas.isHidden = true
            viewLocation.isHidden = false
        }
    }
    
    func fetchGPS(latitude: Double, longitude: Double) {
        guard latitude != 0.0, longitude != 0.0 else {
            print("Latitude or Longitude is zero")
            return
        }

        let myLat = latitude
        let myLng = longitude

        print("GPS is on")

        if abs(myLat) < 0.001 && abs(myLng) < 0.001 {
            // Do nothing or handle minimal coordinates
        } else {
            let kaabaLatDeg = 21.422487
            let kaabaLngDeg = 39.826206

            let kaabaLat = kaabaLatDeg * .pi / 180.0
            let myLatRad = myLat * .pi / 180.0
            let longDiff = (kaabaLngDeg - myLng) * .pi / 180.0

            let y = sin(longDiff) * cos(kaabaLat)
            let x = cos(myLatRad) * sin(kaabaLat) - sin(myLatRad) * cos(kaabaLat) * cos(longDiff)

            let result = (atan2(y, x) * 180.0 / .pi + 360.0).truncatingRemainder(dividingBy: 360.0)

            // Save result
            UserDefaults.standard.set(Float(result), forKey: "kiblat_derajat")

            // Degree text
            let degreeText = String(format: "%.0f", result) + "°"
            
            print("degreeText \(degreeText)")
            
            lblCom.text = degreeText
            
//            binding.txtDegreeText.text = degreeText
//
//            // Show indicator
//            binding.qiblaIndicator.isHidden = false
//
//            // Optionally, get direction string
//            let direction = getDirectionString(Float(result))
//            print("Qibla direction: \(degreeText) \(direction)")
        }
    }

    
    
    func computeCompassDirectionAngles(from heading: CLLocationDirection) -> Double {
            // Adjust heading to be between 0 and 360 degrees
            var adjustedHeading = heading
            if adjustedHeading < 0 {
                adjustedHeading += 360
            }
            return adjustedHeading
        }
    
    // Action
    @IBAction func clickedBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func clickedAllowLocation(_ sender: Any) {
        self.showPermissionAlert()
    }
    
    func showPermissionAlert(){
        let alertController = UIAlertController(title: "Location Permission Required", message: "Please enable location permissions in settings", preferredStyle: UIAlertController.Style.alert)
        
        let okAction = UIAlertAction(title: "Settings", style: .default, handler: {(cAlertAction) in
            //Redirect to Settings app
            if let settingsURL = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(settingsURL)
            }
        })
        
        let cancelAction = UIAlertAction(title: "Don't allow", style: .default, handler: {(cAlertAction) in
            DispatchQueue.main.async {
                
            }
        })
        
        alertController.addAction(cancelAction)
        
        alertController.addAction(okAction)
        
        self.present(alertController, animated: true)
    }
}

extension QiblaVC: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedWhenInUse, .authorizedAlways:
            print("Location access is allowed.")
            
            viewComppas.isHidden = false
            viewLocation.isHidden = true
            
            // location of my device at all times
            locationDelegate.locationCallback = { location in
                self.latestLocation = location
            }
            
            locationDelegate.headingCallback = { newHeading in
                
                func computeNewAngle(with newAngle: CGFloat) -> CGFloat {
                    let heading: CGFloat = {
                        let originalHeading = self.yourLocationBearing - newAngle.degreesToRadians
                        switch UIDevice.current.orientation {
                        case .faceDown: return -originalHeading
                        default: return originalHeading
                        }
                    }()
                    
                    return CGFloat(self.orientationAdjustment().degreesToRadians + heading)
                }
                
                UIView.animate(withDuration: 0.5) {
                    let angle = computeNewAngle(with: CGFloat(newHeading))
                    self.imgCompass.transform = CGAffineTransform(rotationAngle: angle)
                }
            }
            
            locationManager.requestWhenInUseAuthorization()
            
            // Set up location manager
            locationManager.delegate = self
            locationManager.startUpdatingHeading()
            
            // Perform any actions you need after obtaining location permission
        case .denied:
            print("Location access is denied.")
            viewLocation.isHidden = false
            viewComppas.isHidden = true
            
            // Handle case where location permission is denied
        case .notDetermined:
            print("Location access status is not determined.")
            locationManager.requestWhenInUseAuthorization()
            viewLocation.isHidden = false
            viewComppas.isHidden = true
            // You typically don't need to handle this case here
        case .restricted:
            print("Location access is restricted.")
            locationManager.requestWhenInUseAuthorization()
            
            viewLocation.isHidden = false
            viewComppas.isHidden = true
            // Handle case where location access is restricted (e.g., due to parental controls)
        @unknown default:
            print("Unknown authorization status.")
            locationManager.requestWhenInUseAuthorization()
            viewLocation.isHidden = false
            viewComppas.isHidden = true
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("QiblaVC is now visible")
        appDelegate.isOpenQiblaVC = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("QiblaVC is about to disappear")
        appDelegate.isOpenQiblaVC = false
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        let magneticHeading = newHeading.magneticHeading
        let direction = computeCompassDirectionAngles(from: magneticHeading)
        // Update label with compass direction
      //  lblCom.text = "\(Int(direction))"
        
//        lblCom.text = "224"
        
        print("direction \(direction)")
        
        let floatValue = CFloat(lblCom.text?.replacingOccurrences(of: "°", with: "") ?? "")
        print("Int direction \(Int(floatValue ?? 0.0))")

        if Int(direction) == Int(floatValue ?? 0.0)
        {
            if appDelegate.isOpenQiblaVC == true {
                AudioServicesPlayAlertSound(kSystemSoundID_Vibrate)
            }
//            AudioServicesPlayAlertSound(kSystemSoundID_Vibrate)
            imgDiraction.image = UIImage(named: "Union 1 (1)")
        }
        else
        {
            imgDiraction.image = UIImage(named: "Union 1")
        }
        
        
        // Rotate compass image view to match the heading
        let angle = -CGFloat(newHeading.trueHeading).degreesToRadians
        UIView.animate(withDuration: 0.5) {
            self.imgCompass.transform = CGAffineTransform(rotationAngle: angle)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {
            print("No location available")
            return
        }

        let latitude = location.coordinate.latitude
        let longitude = location.coordinate.longitude

        print("Latitude: \(latitude)")
        print("Longitude: \(longitude)")
        
        fetchGPS(latitude: latitude, longitude: longitude)

        // Stop updating if you only need it once
        manager.stopUpdatingLocation()
    }
}

