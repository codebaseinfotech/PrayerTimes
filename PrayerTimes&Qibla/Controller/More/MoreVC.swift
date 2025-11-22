//
//  MoreVC.swift
//  PrayerTimes&Qibla
//
//  Created by Ankit Gabani on 04/11/25.
//

import UIKit

class MoreVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func tappedHome(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
        self.navigationController?.pushViewController(vc, animated: false)
    }
    @IBAction func tappedPrayers(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "PlayerTimeVC") as! PlayerTimeVC
        self.navigationController?.pushViewController(vc, animated: false)
    }
    @IBAction func tappedQibla(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "QiblaVC") as! QiblaVC
        self.navigationController?.pushViewController(vc, animated: false)
    }
    @IBAction func tappedMosque(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DistanceVC") as! DistanceVC
        self.navigationController?.pushViewController(vc, animated: false)
    }
    

}
