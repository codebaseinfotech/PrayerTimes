//
//  PlayerTimeVC.swift
//  PrayerTimes&Qibla
//
//  Created by Ankit Gabani on 04/11/25.
//

import UIKit

extension Notification.Name {
    
    public static let myNotificationUpdateDate = Notification.Name(rawValue: "myNotificationUpdateDate")
    public static let myNotificationSetNoti = Notification.Name(rawValue: "myNotificationSetNoti")
    public static let myNotificationAnnouncementBadge = Notification.Name(rawValue: "myNotificationAnnouncementBadge")
    
}

protocol onTimerOff
{
    func timerOff(isTimerOff: Bool)
}

class PlayerTimeVC: UIViewController, onTimerOff {
    
    
    @IBOutlet weak var viewBGDAy: UIView!
    
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblSense: UILabel!
    @IBOutlet weak var lblWeekNam: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var viewChoose: UIView!
    
    @IBOutlet weak var lblTChoose: UILabel!
    
    let WeeksectionInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    let WeekitemsPerRow: CGFloat = 1
    
    var WeekflowLayout: UICollectionViewFlowLayout {
        let _WeekflowLayout = UICollectionViewFlowLayout()
        
        DispatchQueue.main.async {
            let paddingSpace = self.WeeksectionInsets.left * (self.WeekitemsPerRow + 1)
            let availableWidth = self.view.frame.width - paddingSpace
            let widthPerItem = availableWidth / self.WeekitemsPerRow
            
            _WeekflowLayout.itemSize = CGSize(width: widthPerItem, height: 100)
            
            _WeekflowLayout.sectionInset = self.WeeksectionInsets
            _WeekflowLayout.scrollDirection = UICollectionView.ScrollDirection.vertical
            _WeekflowLayout.minimumInteritemSpacing = 10
            _WeekflowLayout.minimumLineSpacing = 10
        }
        
        // edit properties here
        return _WeekflowLayout
    }
    
    // variable
    
    var arrPlayerImg = ["sunrise","Union","sun","clear-sky","magribImage","IshaImage"]
    
    let datePikerSDate = UIDatePicker()
    
    let arabicMonthNames = [
        1: "Muharram",
        2: "Safar",
        3: "Rabi' al-awwal",
        4: "Rabi' al-thani",
        5: "Jumada al-awwal",
        6: "Jumada al-thani",
        7: "Rajab",
        8: "Sha'ban",
        9: "Ramadan",
        10: "Shawwal",
        11: "Dhu al-Qi'dah",
        12: "Dhu al-Hijjah"
    ]
    
    var arrPlayerTime: [AlGetPlayerTimeItem] = [AlGetPlayerTimeItem]()
    
    var arrTime = NSMutableArray()
    
    var isAPICall = false
    
    var selectedIndex = 0
    
    var isTimerOff = false
    
    // MARK: - view Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let g_1 = UIColor(hexString: "#04230B").cgColor
        let g_2 = UIColor(hexString: "#0423BH").cgColor
        
        viewChoose.applyGradient(colors: [g_1, g_2])
        
        viewBGDAy.applyGradient(colors: [g_2, g_1])
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.collectionViewLayout = WeekflowLayout
        
        let currentDate = Date()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd" // Customize the date format as needed
        dateFormatter.locale = Locale(identifier: "en")
        let dateString = dateFormatter.string(from: currentDate)
        
        callGetPlayerAPI(date: dateString)
        
        lblTChoose.text = "Choose another Date".localizeString(string: Language.shared.currentAppLang)
        // Do any additional setup after loading the view.
    }
    
    func timerOff(isTimerOff: Bool) {
        if isTimerOff == true
        {
            self.isTimerOff = true
            
            let currentDate = Date()
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd" // Customize the date format as needed
            dateFormatter.locale = Locale(identifier: "en")
            let dateString = dateFormatter.string(from: currentDate)
            
            callGetPlayerAPI(date: dateString)
        }
    }
    
    @IBAction func tappedHome(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
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
    @IBAction func tappedMore(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "MoreVC") as! MoreVC
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
    
    // MARK: - Action
    @IBAction func clickedChooseDate(_ sender: UITextField) {
        datePikerSDate.datePickerMode = .date
        datePikerSDate.preferredDatePickerStyle = .wheels
        
        //ToolBar
        let toolbar = UIToolbar();
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "OK", style: .plain, target: self, action: #selector(donedatePickerSDate));
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePickerSdate));
        toolbar.setItems([cancelButton,spaceButton,doneButton], animated: false)
        sender.inputAccessoryView = toolbar
        sender.inputView = datePikerSDate
        
    }
    
    // MARK: - donedatePickerSDate & cancelDatePickerSdate
    
    @objc func donedatePickerSDate(){
        
        let selectDate = datePikerSDate.date
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM yyyy"
        let date = formatter.string(from: selectDate)
        lblDate.text = date
        
        let dateFormatterDay = DateFormatter()
        dateFormatterDay.dateFormat = "EEEE"
        let dayName = dateFormatterDay.string(from: selectDate)
        lblWeekNam.text = dayName
        
        let dateFormatterAPI = DateFormatter()
        dateFormatterAPI.dateFormat = "yyyy-MM-dd"
        dateFormatterAPI.locale = Locale(identifier: "en")
        let dayNameAPI = dateFormatterAPI.string(from: selectDate)
        
        callGetPlayerAPI(date: dayNameAPI)
        
        // ar
        let dateFormatterAr = DateFormatter()
        //        dateFormatterAr.locale = Locale(identifier: "en_US_POSIX")
        dateFormatterAr.dateFormat = "dd M yyyy"
        
        // Input date string
        let dateString = date // Change this to your input
        
        // Split the input date string by space
        let dateComponents = dateString.components(separatedBy: " ")
        
        // Check if there are three components (day, month, year)
        if dateComponents.count == 3,
           let day = Int(dateComponents[0]),
           let month = Int(dateComponents[1]),
           let year = Int(dateComponents[2]),
           let arabicMonth = arabicMonthNames[month] {
            
            // Replace the numeric month with its Arabic name
            let formattedDateString = "\(day) \(arabicMonth) \(year)"
            print("Formatted Date:", formattedDateString)
            lblSense.text = formattedDateString
        } else {
            print("Invalid date format.")
        }
        self.view.endEditing(true)
    }
    
    @objc func cancelDatePickerSdate(){
        self.view.endEditing(true)
    }
    
    // MARK: - callingAPI
    func callGetPlayerAPI(date: String) {
        
        if self.isTimerOff == false
        {
            APIClient.sharedInstance.showIndicator()
        }
        
        let param = ["date":date]
        
        print(param)
        
        APIClient.sharedInstance.MakeAPICallWithAuthHeaderGet(GET_PLAYER_TIME, parameters: param) { response, error, statusCode in
            
            print("STATUS CODE \(String(describing: statusCode))")
            print("RESPONSE \(String(describing: response))")
            
            if error == nil {
                APIClient.sharedInstance.hideIndicator()
                
                let status = response?.value(forKey: "status") as? Int
                let message = response?.value(forKey: "message") as? String
                
                self.arrTime.removeAllObjects()
                self.arrPlayerTime.removeAll()
                
                if statusCode == 200
                {
                    if status == 1
                    {
                        if let arr_items = response?.value(forKey: "items") as? NSArray
                        {
                            for obj in arr_items
                            {
                                let dicData = AlGetPlayerTimeItem(fromDictionary: obj as! NSDictionary)
                                dicData.isSetDuhurPrayer = false
                                dicData.isSetFajrPrayer = false
                                dicData.isSetIshaaPrayer  = false
                                dicData.isSetMaghribPrayer = false
                                dicData.isSetSunrise = false
                                dicData.isSetViewAsrPrayer = false
                                self.arrPlayerTime.append(dicData)
                                
                                self.lblSense.text = "\(dicData.hijriDay ?? 0) \(dicData.hijriMonth ?? "") \(dicData.hijriYear ?? 0)"
                                
                                let bidAccepted = date
                                let formatter = DateFormatter()
                                //                                formatter.locale = Locale(identifier: "en_US")
                                formatter.dateFormat = "yyyy-MM-dd"
                                if let date1 = formatter.date(from: bidAccepted)
                                {
                                    let Dform = DateFormatter()
                                    Dform.dateFormat = "dd MMM yyyy"
                                    let strDate = Dform.string(from: date1)
                                    self.lblDate.text = strDate
                                    
                                    let dateFormatterDay = DateFormatter()
                                    dateFormatterDay.dateFormat = "EEEE"
                                    let dayName = dateFormatterDay.string(from: date1)
                                    self.lblWeekNam.text = dayName
                                }
                                
                                
                                if dicData.prayerIdex == "Fajr"
                                {
                                    self.selectedIndex = 0
                                }
                                else if dicData.prayerIdex == "Sunrise"
                                {
                                    self.selectedIndex = 1
                                }
                                else if dicData.prayerIdex == "Dhuhr"
                                {
                                    self.selectedIndex = 2
                                }
                                else if dicData.prayerIdex == "Asr"
                                {
                                    self.selectedIndex = 3
                                }
                                else if dicData.prayerIdex == "Maghrib"
                                {
                                    self.selectedIndex = 4
                                }
                                else
                                {
                                    self.selectedIndex = 5
                                }
                                
                            }
                            
                            if Language.shared.isArabic
                            {
                                for objTime in self.arrPlayerTime
                                {
                                    let viewFajrPrayer = "\(objTime.georgianDate ?? "") " + objTime.fajrPrayer
                                    let viewSunrise = "\(objTime.georgianDate ?? "") " + objTime.sunrise
                                    let viewDuhurPrayer = "\(objTime.georgianDate ?? "") " + objTime.duhurPrayer
                                    let viewViewAsrPrayer = "\(objTime.georgianDate ?? "") " + objTime.asrPrayer
                                    let viewMaghribPrayer = "\(objTime.georgianDate ?? "") " + objTime.maghribPrayer
                                    let viewIshaaPrayer = "\(objTime.georgianDate ?? "") " + objTime.ishaaPrayer
                                    
                                    let dateFormatterFajr = DateFormatter()
                                    dateFormatterFajr.dateFormat = "yyyy-MM-dd HH:mm:ss"
                                    if let date = dateFormatterFajr.date(from: viewFajrPrayer)
                                    {
                                        dateFormatterFajr.dateFormat = "yyyy-MM-dd hh:mm a"
                                        let strFajrPrayer = dateFormatterFajr.string(from: date)
                                        self.arrTime.add(strFajrPrayer)
                                    }
                                    
                                    let dateFormatterSunrise = DateFormatter()
                                    dateFormatterSunrise.dateFormat = "yyyy-MM-dd HH:mm:ss"
                                    if let dateSunrise = dateFormatterSunrise.date(from: viewSunrise)
                                    {
                                        dateFormatterSunrise.dateFormat = "yyyy-MM-dd hh:mm a"
                                        let strSunrise = dateFormatterSunrise.string(from: dateSunrise)
                                        self.arrTime.add(strSunrise)
                                    }
                                    
                                    let dateFormatterDuhur = DateFormatter()
                                    dateFormatterDuhur.dateFormat = "yyyy-MM-dd HH:mm:ss"
                                    if let dateDuhurPrayer = dateFormatterDuhur.date(from: viewDuhurPrayer)
                                    {
                                        dateFormatterDuhur.dateFormat = "yyyy-MM-dd hh:mm a"
                                        let strDuhurPrayer = dateFormatterDuhur.string(from: dateDuhurPrayer)
                                        self.arrTime.add(strDuhurPrayer)
                                    }
                                    
                                    let dateFormatterAsr = DateFormatter()
                                    dateFormatterAsr.dateFormat = "yyyy-MM-dd HH:mm:ss"
                                    if let dateAsrPrayer = dateFormatterAsr.date(from: viewViewAsrPrayer)
                                    {
                                        dateFormatterAsr.dateFormat = "yyyy-MM-dd hh:mm a"
                                        let strAsrPrayer = dateFormatterAsr.string(from: dateAsrPrayer)
                                        self.arrTime.add(strAsrPrayer)
                                    }
                                    
                                    let dateFormatterMaghrib = DateFormatter()
                                    dateFormatterMaghrib.dateFormat = "yyyy-MM-dd HH:mm:ss"
                                    if let dateMaghribPrayer = dateFormatterMaghrib.date(from: viewMaghribPrayer)
                                    {
                                        dateFormatterMaghrib.dateFormat = "yyyy-MM-dd hh:mm a"
                                        let strMaghribPrayer = dateFormatterMaghrib.string(from: dateMaghribPrayer)
                                        self.arrTime.add(strMaghribPrayer)
                                    }
                                    
                                    let dateFormatterIshaa = DateFormatter()
                                    dateFormatterIshaa.dateFormat = "yyyy-MM-dd HH:mm:ss"
                                    if let dateIshaaPrayer = dateFormatterIshaa.date(from: viewIshaaPrayer)
                                    {
                                        dateFormatterIshaa.dateFormat = "yyyy-MM-dd hh:mm a"
                                        let strIshaaPrayer = dateFormatterIshaa.string(from: dateIshaaPrayer)
                                        self.arrTime.add(strIshaaPrayer)
                                    }
                                    
                                    print(self.arrTime)
                                    
                                    
                                }
                            }
                            else
                            {
                                for objTime in self.arrPlayerTime
                                {
                                    let viewFajrPrayer = "\(objTime.georgianDate ?? "") " + objTime.viewFajrPrayer
                                    let viewSunrise = "\(objTime.georgianDate ?? "") " + objTime.viewSunrise
                                    let viewDuhurPrayer = "\(objTime.georgianDate ?? "") " + objTime.viewDuhurPrayer
                                    let viewViewAsrPrayer = "\(objTime.georgianDate ?? "") " + objTime.viewViewAsrPrayer
                                    let viewMaghribPrayer = "\(objTime.georgianDate ?? "") " + objTime.viewMaghribPrayer
                                    let viewIshaaPrayer = "\(objTime.georgianDate ?? "") " + objTime.viewIshaaPrayer
                                    
                                    self.arrTime.add(viewFajrPrayer)
                                    self.arrTime.add(viewSunrise)
                                    self.arrTime.add(viewDuhurPrayer)
                                    self.arrTime.add(viewViewAsrPrayer)
                                    self.arrTime.add(viewMaghribPrayer)
                                    self.arrTime.add(viewIshaaPrayer)
                                    
                                    print(self.arrTime)
                                }
                            }
                            
                        }
                        
                        DispatchQueue.main.async {
                            self.isAPICall = true
                            self.collectionView.reloadData()
                        }
                        
                    }
                    else
                    {
                        self.collectionView.reloadData()
                        APIClient.sharedInstance.hideIndicator()
                    }
                }
                else
                {
                    self.collectionView.reloadData()
                    APIClient.sharedInstance.hideIndicator()
                }
            }
            else
            {
                self.collectionView.reloadData()
                APIClient.sharedInstance.hideIndicator()
            }
        }
    }
}

extension PlayerTimeVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if arrPlayerTime.count > 0
        {
            return 6
        }
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "PlayerTimeDateCell", for: indexPath) as! PlayerTimeDateCell
        
        if arrPlayerTime.count > 0 {
            
            let dicData = arrPlayerTime[0]
            
            cell.delegateTimer = self
            
            let bidAccepted = self.lblDate.text ?? ""
            let formatter = DateFormatter()
            formatter.locale = Locale.current
            formatter.dateFormat = "dd MMM yyyy"
            let date1 = formatter.date(from: bidAccepted)
            let Dform = DateFormatter()
            Dform.dateFormat = "yyyy-MM-dd"
            let strDate = Dform.string(from: date1!)
            
            let georgianDate_ = dicData.georgianDate ?? ""
            let formatter_ = DateFormatter()
            formatter_.locale = Locale.current
            formatter_.dateFormat = "yyyy-MM-dd"
            let date_ = formatter_.date(from: georgianDate_)
            let Dform_ = DateFormatter()
            Dform_.dateFormat = "yyyy-MM-dd"
            let strDate_ = Dform_.string(from: date_!)
            
            if strDate == strDate_ {
                
                if selectedIndex == indexPath.row
                {
                    cell.lblTimer.isHidden = false
                    
                    cell.viewMain.backgroundColor = .white
                    cell.lblName.textColor = UIColor(hexString: "#04230B")
                    cell.lblTimer.textColor = UIColor(hexString: "#04230B")
 
                    if indexPath.row == 0
                    {
                        
                        if appDelegate.getSetSelectedFajr() == true
                        {
                            cell.imgBell.image = UIImage(named: "bell_on")
                        }
                        else
                        {
                            cell.imgBell.image = UIImage(named: "bell_yellow_outline")
                        }
                    }
                    else if indexPath.row == 1
                    {
                        
                        if appDelegate.getSetSelectedSunrise() == true
                        {
                            cell.imgBell.image = UIImage(named: "bell_on")
                        }
                        else
                        {
                            cell.imgBell.image = UIImage(named: "bell_yellow_outline")
                        }
                    }
                    else if indexPath.row == 2
                    {
                        if appDelegate.getSetSelectedDhuhr() == true
                        {
                            cell.imgBell.image = UIImage(named: "bell_on")
                        }
                        else
                        {
                            cell.imgBell.image = UIImage(named: "bell_yellow_outline")
                        }
                    }
                    else if indexPath.row == 3
                    {
                        if appDelegate.getSetSelectedAsr() == true
                        {
                            cell.imgBell.image = UIImage(named: "bell_on")
                        }
                        else
                        {
                            cell.imgBell.image = UIImage(named: "bell_yellow_outline")
                        }
                    }
                    else if indexPath.row == 4
                    {
                        if appDelegate.getSetSelectedMaghrib() == true
                        {
                            cell.imgBell.image = UIImage(named: "bell_on")
                        }
                        else
                        {
                            cell.imgBell.image = UIImage(named: "bell_yellow_outline")
                        }
                    }
                    else if indexPath.row == 5
                    {
                        if appDelegate.getSetSelectedIsha() == true
                        {
                            cell.imgBell.image = UIImage(named: "bell_on")
                        }
                        else
                        {
                            cell.imgBell.image = UIImage(named: "bell_yellow_outline")
                        }
                    }
                    
                    
                    if arrTime.count > 0
                    {
                        if let nearestTime = cell.findNearestTime(times: arrTime as! [String]) {
                            print("Nearest time:  \(nearestTime.1.0) hours, \(nearestTime.1.1) minutes, and \(nearestTime.1.2) seconds remaining.")
                            
                            cell.startTimer(initialHours: nearestTime.1.0, initialMinutes: nearestTime.1.1, initialSeconds: nearestTime.1.2)
                            
                        } else {
                            print("No future times found.")
                        }
                    }
                    
                }
                else
                {
                    
                    
                    if indexPath.row == 0
                    {
                        
                        if appDelegate.getSetSelectedFajr() ==  true
                        {
                            cell.imgBell.image = UIImage(named: "bell_on")
                        }
                        else
                        {
                            cell.imgBell.image = UIImage(named: "bell_off")
                        }
                    }
                    else if indexPath.row == 1
                    {
                        
                        if appDelegate.getSetSelectedSunrise() == true
                        {
                            cell.imgBell.image = UIImage(named: "bell_on")
                        }
                        else
                        {
                            cell.imgBell.image = UIImage(named: "bell_off")
                        }
                    }
                    else if indexPath.row == 2
                    {
                        if appDelegate.getSetSelectedDhuhr() == true
                        {
                            cell.imgBell.image = UIImage(named: "bell_on")
                        }
                        else
                        {
                            cell.imgBell.image = UIImage(named: "bell_off")
                        }
                    }
                    else if indexPath.row == 3
                    {
                        if appDelegate.getSetSelectedAsr() == true
                        {
                            cell.imgBell.image = UIImage(named: "bell_on")
                        }
                        else
                        {
                            cell.imgBell.image = UIImage(named: "bell_off")
                        }
                    }
                    else if indexPath.row == 4
                    {
                        if appDelegate.getSetSelectedMaghrib() == true
                        {
                            cell.imgBell.image = UIImage(named: "bell_on")
                        }
                        else
                        {
                            cell.imgBell.image = UIImage(named: "bell_off")
                        }
                    }
                    else if indexPath.row == 5
                    {
                        if appDelegate.getSetSelectedIsha() == true
                        {
                            cell.imgBell.image = UIImage(named: "bell_on")
                        }
                        else
                        {
                            cell.imgBell.image = UIImage(named: "bell_off")
                        }
                    }
                    
                    cell.lblTimer.isHidden = true
                    cell.viewMain.backgroundColor = UIColor(hexString: "#04230B")
                    cell.lblName.textColor = .white
                    cell.lblTimer.textColor = .white
                }
                
            } else {
                
                if indexPath.row == 0
                {
                    
                    if appDelegate.getSetSelectedFajr() == true
                    {
                        cell.imgBell.image = UIImage(named: "bell_on")
                    }
                    else
                    {
                        cell.imgBell.image = UIImage(named: "bell_off")
                    }
                }
                else if indexPath.row == 1
                {
                    
                    if appDelegate.getSetSelectedSunrise() == true
                    {
                        cell.imgBell.image = UIImage(named: "bell_on")
                    }
                    else
                    {
                        cell.imgBell.image = UIImage(named: "bell_off")
                    }
                }
                else if indexPath.row == 2
                {
                    if appDelegate.getSetSelectedDhuhr() == true
                    {
                        cell.imgBell.image = UIImage(named: "bell_on")
                    }
                    else
                    {
                        cell.imgBell.image = UIImage(named: "bell_off")
                    }
                }
                else if indexPath.row == 3
                {
                    if appDelegate.getSetSelectedAsr() == true
                    {
                        cell.imgBell.image = UIImage(named: "bell_on")
                    }
                    else
                    {
                        cell.imgBell.image = UIImage(named: "bell_off")
                    }
                }
                else if indexPath.row == 4
                {
                    if appDelegate.getSetSelectedMaghrib() == true
                    {
                        cell.imgBell.image = UIImage(named: "bell_on")
                    }
                    else
                    {
                        cell.imgBell.image = UIImage(named: "bell_off")
                    }
                }
                else if indexPath.row == 5
                {
                    if appDelegate.getSetSelectedIsha() == true
                    {
                        cell.imgBell.image = UIImage(named: "bell_on")
                    }
                    else
                    {
                        cell.imgBell.image = UIImage(named: "bell_off")
                    }
                }
                
                cell.lblTimer.isHidden = true
                cell.viewMain.backgroundColor = UIColor(hexString: "#04230B")
                cell.lblName.textColor = .white
                cell.lblTimer.textColor = .white
            }
            
            if indexPath.row == 0
            {
                let fajr = dicData.viewFajrPrayer ?? ""
                
                let fajr_lan = "fajr".localizeString(string: Language.shared.currentAppLang)
                
                cell.lblName.text = "\(fajr_lan)\n\n\(fajr)"
                
                cell.imgPic.image = UIImage(named: arrPlayerImg[0])
                
            }
            else if indexPath.row == 1
            {
                let sunrise = dicData.viewSunrise ?? ""
                
                let sunrise_lan = "sunrise".localizeString(string: Language.shared.currentAppLang)
                
                cell.lblName.text = "\(sunrise_lan)\n\n\(sunrise)"
                
                cell.imgPic.image = UIImage(named: arrPlayerImg[1])
                
            }
            else if indexPath.row == 2
            {
                let dhuhr = dicData.viewDuhurPrayer ?? ""
                
                let dhuhr_lan = "dhuhr".localizeString(string: Language.shared.currentAppLang)
                
                cell.lblName.text = "\(dhuhr_lan)\n\n\(dhuhr)"
                
                cell.imgPic.image = UIImage(named: arrPlayerImg[2])
                
            }
            else if indexPath.row == 3
            {
                let asr = dicData.viewViewAsrPrayer ?? ""
                
                let asr_lan = "asr".localizeString(string: Language.shared.currentAppLang)
                
                cell.lblName.text = "\(asr_lan)\n\n\(asr)"
                
                cell.imgPic.image = UIImage(named: arrPlayerImg[3])
                
            }
            else if indexPath.row == 4
            {
                let margrib = dicData.viewMaghribPrayer ?? ""
                
                let magrib_lan = "magrib".localizeString(string: Language.shared.currentAppLang)
                
                cell.lblName.text = "\(magrib_lan)\n\n\(margrib)"
                
                cell.imgPic.image = UIImage(named: arrPlayerImg[4])
                
            }
            else
            {
                let isha = dicData.viewIshaaPrayer ?? ""
                
                let isha_lan = "isha".localizeString(string: Language.shared.currentAppLang)
                
                cell.lblName.text = "\(isha_lan)\n\n\(isha)"
                
                cell.imgPic.image = UIImage(named: arrPlayerImg[5])
            }
            
            cell.imgPic.tintColor = UIColor(hexString: "#FFC937")
            
            cell.clickedNoti.tag = indexPath.row
            cell.clickedNoti.addTarget(self, action: #selector(clickedNotificationSet(_ :)), for: .touchUpInside)
        }
        
        return cell
    }
    
    @objc func clickedNotificationSet( _ sender: UIButton)
    {
        
        if let cell = collectionView.cellForItem(at: IndexPath(row: sender.tag, section: 0)) as? PlayerTimeDateCell
        {
            if sender.tag == 0
            {
                if cell.imgBell.image == UIImage(named: "bell_on")
                {
                    appDelegate.saveSetSelectedFajr(isSelected: false)
                    self.setUpMakeToast(msg: "Alarm canceled for \("fajr".localizeString(string: Language.shared.currentAppLang))")
                }
                else
                {
                    appDelegate.saveSetSelectedFajr(isSelected: true)
                    self.setUpMakeToast(msg: "Alarm set for \("fajr".localizeString(string: Language.shared.currentAppLang))")
                }
                
            }
            else if sender.tag == 1
            {
                if cell.imgBell.image == UIImage(named: "bell_on")
                {
                    appDelegate.saveSetSelectedSunrise(isSelected: false)
                    self.setUpMakeToast(msg: "Alarm canceled for \("sunrise".localizeString(string: Language.shared.currentAppLang))")
                }
                else
                {
                    appDelegate.saveSetSelectedSunrise(isSelected: true)
                    self.setUpMakeToast(msg: "Alarm set for \("sunrise".localizeString(string: Language.shared.currentAppLang))")
                }
                
            }
            else if sender.tag == 2
            {
                if cell.imgBell.image == UIImage(named: "bell_on")
                {
                    appDelegate.saveSetSelectedDhuhr(isSelected: false)
                    self.setUpMakeToast(msg: "Alarm canceled for \("dhuhr".localizeString(string: Language.shared.currentAppLang))")
                }
                else
                {
                    appDelegate.saveSetSelectedDhuhr(isSelected: true)
                    self.setUpMakeToast(msg: "Alarm set for \("dhuhr".localizeString(string: Language.shared.currentAppLang))")
                }
                
            }
            else if sender.tag == 3
            {
                if cell.imgBell.image == UIImage(named: "bell_on")
                {
                    appDelegate.saveSetSelectedAsr(isSelected: false)
                    self.setUpMakeToast(msg: "Alarm canceled for \("asr".localizeString(string: Language.shared.currentAppLang))")
                }
                else
                {
                    appDelegate.saveSetSelectedAsr(isSelected: true)
                    self.setUpMakeToast(msg: "Alarm set for \("asr".localizeString(string: Language.shared.currentAppLang))")
                }
                
            }
            else if sender.tag == 4
            {
                if cell.imgBell.image == UIImage(named: "bell_on")
                {
                    appDelegate.saveSetSelectedMaghrib(isSelected: false)
                    self.setUpMakeToast(msg: "Alarm canceled for \("magrib".localizeString(string: Language.shared.currentAppLang))")
                }
                else
                {
                    appDelegate.saveSetSelectedMaghrib(isSelected: true)
                    self.setUpMakeToast(msg: "Alarm set for \("magrib".localizeString(string: Language.shared.currentAppLang))")
                }
            }
            else if sender.tag == 5
            {
                
                if cell.imgBell.image == UIImage(named: "bell_on")
                {
                    appDelegate.saveSetSelectedIsha(isSelected: false)
                    self.setUpMakeToast(msg: "Alarm canceled for \("isha".localizeString(string: Language.shared.currentAppLang))")
                }
                else
                {
                    appDelegate.saveSetSelectedIsha(isSelected: true)
                    self.setUpMakeToast(msg: "Alarm set for \("isha".localizeString(string: Language.shared.currentAppLang))")
                }
            }
            
            collectionView.reloadData()
        }
        
        NotificationCenter.default.post(name: Notification.Name.myNotificationSetNoti, object: nil, userInfo:["text": ""]) // Notification
        
    }
}

class PlayerTimeDateCell: UICollectionViewCell
{
    
    @IBOutlet weak var clickedNoti: UIButton!
    
    @IBOutlet weak var viewMain: UIView!
    @IBOutlet weak var imgPic: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblTimer: UILabel!
    
    @IBOutlet weak var imgBell: UIImageView!
    
    var arrTimeCell = NSMutableArray()
    
    var countdownTimer = Timer()
    
    var totalTime: Int = 0
    
    var delegateTimer: onTimerOff?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    func startTimer(initialHours: Int, initialMinutes: Int, initialSeconds: Int) {
        // Calculate total time in seconds
        totalTime = initialHours * 3600 + initialMinutes * 60 + initialSeconds
        
        // Invalidate previous timer if exists
        countdownTimer.invalidate()
        
        // Start the countdown timer
        countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
        // Immediately update the timer label once, as scheduledTimer does not fire instantly
        updateTimerLabel()
    }
    
    @objc func updateTimer() {
        if totalTime > 0 {
            totalTime -= 1 // Decrement total time by 1 second
            updateTimerLabel() // Update the timer label
        } else {
            countdownTimer.invalidate() // Stop the timer when it reaches zero
            lblTimer.text = "" // Update the label text to "00:00:00"
            delegateTimer?.timerOff(isTimerOff: true)
        }
    }
    
    func updateTimerLabel() {
        // Calculate hours, minutes, and seconds from the total time
        let hours = totalTime / 3600
        let minutes = (totalTime % 3600) / 60
        let seconds = (totalTime % 3600) % 60
        
        // Update the label text with the remaining time
        lblTimer.text = "\(String(format: "%02d:%02d:%02d", hours, minutes, seconds))"
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        countdownTimer.invalidate() // Invalidate the timer when the cell is reused
    }
    
    func findNearestTime(times: [String]) -> (String, (Int, Int, Int))? {
        let calendar = Calendar.current
        let now = Date()
        var nearestTime: String?
        var nearestDifference: TimeInterval = .greatestFiniteMagnitude
        
        for timeString in times {
            // Convert time string to Date
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier: "en")
            dateFormatter.dateFormat = "yyyy-MM-dd hh:mm a"
            guard let futureTime = dateFormatter.date(from: timeString) else {
                continue
            }
            
            // Calculate time difference
            let difference = futureTime.timeIntervalSince(now)
            if difference >= 0 && difference < nearestDifference {
                nearestDifference = difference
                nearestTime = timeString
            }
        }
        
        guard let nearest = nearestTime else { return nil }
        
        let hours = Int(nearestDifference / 3600)
        let minutes = Int((nearestDifference.truncatingRemainder(dividingBy: 3600)) / 60)
        let seconds = Int(nearestDifference.truncatingRemainder(dividingBy: 60))
        
        return (nearest, (hours, minutes, seconds))
    }
    
    
    
    
}

class CountdownTimer {
    var timer: Timer?
    var targetTime: Date
    var onUpdate: ((String) -> Void)?
    var onCompletion: (() -> Void)?
    
    init(targetTime: Date) {
        self.targetTime = targetTime
    }
    
    func start() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            let timeDifference = self.targetTime.timeIntervalSince(Date())
            
            if timeDifference <= 0 {
                self.stop()
                self.onCompletion?()
            } else {
                let minutes = Int(timeDifference / 60)
                let seconds = Int(timeDifference) % 60
                let timeString = String(format: "%02d minutes and %02d seconds", minutes, seconds)
                self.onUpdate?(timeString)
            }
        }
        timer?.fire()
    }
    
    func stop() {
        timer?.invalidate()
        timer = nil
    }
}
