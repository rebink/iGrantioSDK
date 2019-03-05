
//
//  ExtensionMethods.swift
//  FnB
//
//  Created by Ajeesh T S on 06/01/17.
//  Copyright © 2017 SimStream. All rights reserved.
//

import UIKit
import MBProgressHUD
//import SwiftEntryKit
//import SDStateTableView

//import Toaster

let internetAalertMsg = NSLocalizedString("The Internet connection appears to be offline.", comment: "")
let serviceError = NSLocalizedString("Failed Operation!!!", comment: "")


extension UIApplication {
    class func topViewControllerInApp(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return topViewController(base: navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(base: selected)
            }
        }
        if let presented = controller?.presentedViewController {
            return topViewController(base: presented)
        }
        return controller
    }
}

extension UIViewController {
    
//    func showfloatingAlert(description: String){
//        var attributes = EKAttributes.topFloat
//        attributes.entryBackground = .color(color: UIColor(red:0.19, green:0.23, blue:0.29, alpha:1))
//        attributes.popBehavior = .animated(animation: .init(translate: .init(duration: 0.3), scale: .init(from: 1, to: 0.7, duration: 0.7)))
//        attributes.shadow = .active(with: .init(color: .black, opacity: 0.5, radius: 10, offset: .zero))
//        attributes.statusBar = .dark
//        attributes.scroll = .enabled(swipeable: true, pullbackAnimation: .jolt)
//        attributes.positionConstraints.maxSize = .init(width: .constant(value: Constant.ScreenSize.SCREEN_WIDTH), height: .intrinsic)
//        let cFont = UIFont(name: "HelveticaNeue-Medium", size: 14)
//        let title = EKProperty.LabelContent(text: Constant.AppSetupConstant.KAppName, style: .init(font:cFont!, color: UIColor.white))
//        let description = EKProperty.LabelContent(text: description, style: .init(font: cFont!, color: UIColor.white))
//        let image = EKProperty.ImageContent(image: UIImage(named: "close")!, size: CGSize(width: 35, height: 35))
//        let simpleMessage = EKSimpleMessage(image: image, title: title, description: description)
//        let notificationMessage = EKNotificationMessage(simpleMessage: simpleMessage)
//
//        let contentView = EKNotificationMessageView(with: notificationMessage)
//        SwiftEntryKit.display(entry: contentView, using: attributes)
//    }
//
    func showAlert(title: String?, message: String?) {
        let alerController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: NSLocalizedString("Ok", comment: ""), style: .cancel, handler: nil)
        alerController.addAction(cancelAction)
        present(alerController, animated: true, completion: nil)
    }
    
    func showAlertwithTitle(title: String, message: String) {
        let alerController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: NSLocalizedString("Ok", comment: ""), style: .cancel, handler: nil)
        alerController.addAction(cancelAction)
        present(alerController, animated: true, completion: nil)
    }
    
    func showWarningAlert(message: String){
        self.showAlertwithTitle(title: Constant.AppSetupConstant.KAppName, message: message)
    }
    
    func addLoadingIndicator(){
        DispatchQueue.main.async(execute: { () -> Void in
            MBProgressHUD.showAdded(to: self.view, animated: true)

        })
    }

    func popVC() {
        guard let arrayVC = self.navigationController?.viewControllers else {return}
        if self == arrayVC.first {
            self.dismiss(animated: true, completion: nil)
        }
        self.navigationController?.popViewController(animated: true)
    }
    
    func removeLoadingIndicator(){
        MBProgressHUD.hide(for: self.view, animated: true)
   /*     if AppSharedData.sharedInstance.isExpiredAccesToken == true{
             AppSharedData.sharedInstance.isExpiredAccesToken = false
            UserInfo.currentUser()?.clearSession()
            AppSharedData.sharedInstance.isNeedToAddBgkColorInLandinScreen = true
            let landinView = Constant.getStoryboard(vc: self.classForCoder).instantiateViewController(withIdentifier: "LandingVC") as! LandingViewController
            UIApplication.shared.keyWindow?.rootViewController = landinView

        }else{
            
        }
*/
    }
    
    func showErrorAlert(message: String){
        self.showAlertwithTitle(title: Constant.AppSetupConstant.KAppName, message: message)
    }
    
    func showSucessAlert(message: String){
        self.showAlertwithTitle(title: Constant.AppSetupConstant.KAppName, message: message)
    }
    
    func showNoPermissionAlertWithMessage(message: String){
        self.showAlertwithTitle(title: Constant.AppSetupConstant.KAppName, message: message)
    }
    
    func showNoPermissionAlert(){
        self.showAlertwithTitle(title: Constant.AppSetupConstant.KAppName, message: NSLocalizedString("You dont have permission", comment: ""))
    }

    
    
//    func checkNetWorkAvailability() -> Bool{
//        if AppSharedData.sharedInstance.isReachableInternet{
//            return true
//        }else{
//            self.showAlertwithTitle(title: Constant.AppSetupConstant.KAppName, message: internetAalertMsg)
//            return false
//        }
//    }
//
//    var isNetWorkAvailable: Bool {
//        get {
//            if AppSharedData.sharedInstance.isReachableInternet{
//                return true
//            }else{
//                self.showAlertwithTitle(title: Constant.AppSetupConstant.KAppName, message: internetAalertMsg)
//                return false
//            }
//        }
//    }
//
//    var isLoggedInUser: Bool {
//        if AppSharedData.sharedInstance.isReachableInternet{
//            if UserInfo.currentUser()?.customerID != nil{
//                if UserInfo.currentUser()?.userStatus == .ApprovalPending{
////                    Toast(text: "Verification Pending", duration: Delay.short).show()
//                    return false
//                }
////                else if UserInfo.currentUser()?.userStatus == .OTPVerificationPending{
////                    let mainStoryboard: UIStoryboard = UIStoryboard(name: "Login&SignUp", bundle: nil)
////                     let optVC  = mainStoryboard.instantiateViewController(withIdentifier: "OTPVC") as! OTPViewController
////                    optVC.isShowingAsPresent = true
////                    let navController = UINavigationController(rootViewController: optVC)
////                    self.present(navController, animated: true, completion: nil)
////                    return false
////                }
//            else{
//                    return true
//                }
//            }else{
//                 let mainStoryboard: UIStoryboard = UIStoryboard(name: "Login&SignUp", bundle: nil)
//                let loginNav  = mainStoryboard.instantiateViewController(withIdentifier: "loginNavigation") as! UINavigationController
//                 //                loginVC.isDirectLogin = true
//                 self.present(loginNav, animated: true, completion: nil)
//                return false
//            }
//        }else{
//            self.showAlertwithTitle(title: "FnB!", message: internetAalertMsg)
//            return false
//        }
//    }
//    
//    var isLoggedInUserWithoutLoginPromt: Bool {
//        if AppSharedData.sharedInstance.isReachableInternet{
//            if UserInfo.currentUser()?.customerID != nil{
//                if UserInfo.currentUser()?.userStatus == .Verfied{
//                    return true
//                }else{
//                    return false
//                }
//            }else{
//                return false
//            }
//        }else{
//            return false
//        }
//    }
//    
//    var isLoggedInUserWithoutReachablity: Bool {
//            if UserInfo.currentUser()?.customerID != nil{
//                if UserInfo.currentUser()?.userStatus == .Verfied{
//                    return true
//                }else{
//                    return false
//                }
//            }else{
//                return false
//            }
//        
//    }
//
//    
//    func checkNetWorkAvailabilityAndUserAuthentication() -> Bool{
//        if AppSharedData.sharedInstance.isReachableInternet{
//            if UserInfo.currentUser()?.customerID != nil{
//                return true
//            }else{
//                /*
//                 let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//                 let loginVC  = mainStoryboard.instantiateViewController(withIdentifier: "LoginVC") as! LoginViewController
//                 //                loginVC.isDirectLogin = true
//                 let navController = UINavigationController(rootViewController: loginVC)
//                 self.present(navController, animated: true, completion: nil)
//                 */
//                return false
//            }
//        }else{
//            self.showAlertwithTitle(title: "FnB!", message: internetAalertMsg)
//            return false
//        }
//    }
//    
    func presentShareView(content: AnyObject){
        // text to share
//        let text = "This is some text that I want to share."
//        
        // set up activity view controller
        let textToShare = [ content ]
        let activityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities: [])
        activityViewController.popoverPresentationController?.sourceView = self.view // so that iPads won't crash
        
        self.present(activityViewController, animated: true, completion: nil)

    }
    
   

}

extension UITextField{
    @IBInspectable var placeHolderColor: UIColor? {
        get {
            return self.placeHolderColor
        }
        set {
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: newValue!])
        }
    }
}


extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
}

extension UIApplication {
    class func topViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return topViewController(base: nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(base: selected)
            }
        }
        if let presented = base?.presentedViewController {
            return topViewController(base: presented)
        }
        return base
    }
}

extension String {
    var isBlank: Bool {
        get {
            let trimmed = trimmingCharacters(in: CharacterSet.whitespaces)
            return trimmed.isEmpty
        }
    }
    
    var isValidString: Bool {
        get {
            let trimmed = trimmingCharacters(in: CharacterSet.whitespaces)
            return !trimmed.isEmpty
        }
    }
    
    func trimSpace() -> String? {
        let trimmed = trimmingCharacters(in: CharacterSet.whitespaces)
        return trimmed
    }
    
    func toDouble() -> Double? {
        return NumberFormatter().number(from: self)?.doubleValue
    }
    
    var isValidEmail: Bool{
        get {
            
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
            let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            let result = emailTest.evaluate(with: self)
            return result
        }
    }
}

extension UIFont {
    static func printFontNames() {
        for familyName in UIFont.familyNames {
            print("Family name: \(familyName)")
            for fontName in UIFont.fontNames(forFamilyName: familyName) {
                print("Font name: \(fontName)")
            }
        }
    }
}

extension UIButton{
 
    func showThemeBorder(){
        self.layer.cornerRadius = 0
        self.layer.borderWidth = 0.5
        self.layer.borderColor =     UIColor(red:0.47, green:0.48, blue:0.48, alpha:1).cgColor
    }
    
}
extension UIView{
    
    func showRoundCorner(roundCorner: CGFloat){
        self.layer.cornerRadius = roundCorner
        self.clipsToBounds = true
    }
    
    func showRoundCorner(){
        self.layer.cornerRadius = (self.frame.size.height/2)
        self.clipsToBounds = true
    }
    
    
    func showTextldThemeRoundCorner(){
        self.layer.cornerRadius = 5.0
        self.clipsToBounds = true
        self.borderWidth = 1.0
        self.borderColor = UIColor(red:0.73, green:0.73, blue:0.73, alpha:1)

    }
}

extension UIViewController {
    
    func setTabBarVisible(visible: Bool, animated: Bool) {
        //* This cannot be called before viewDidLayoutSubviews(), because the frame is not set before this time
        
        // bail if the current state matches the desired state
        if (isTabBarVisible == visible) { return }
        
        // get a frame calculation ready
        let frame = self.tabBarController?.tabBar.frame
        let height = frame?.size.height
        let offsetY = (visible ? -height! : height)
        
        // zero duration means no animation
        let duration: TimeInterval = (animated ? 0.3 : 0.0)
        
        //  animate the tabBar
        if frame != nil {
            UIView.animate(withDuration: duration) {
                self.tabBarController?.tabBar.frame = frame!.offsetBy(dx: 0, dy: offsetY!)
                return
            }
        }
    }
    
    var isTabBarVisible: Bool {
        return (self.tabBarController?.tabBar.frame.origin.y ?? 0) < self.view.frame.maxY
    }
}

extension NSAttributedString {
    func heightWithConstrainedWidth(width: CGFloat) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, context: nil)
        return boundingBox.height
    }
    
    func widthWithConstrainedHeight(height: CGFloat) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, context: nil)
        return boundingBox.width
    }
}

extension NSMutableAttributedString{
//    func strikeTextWithColor(text:String, color:UIColor) -> NSAttributedString{
//        let strikeValueRange = NSMakeRange(0,text.characters.count)
//        self.addAttribute(NSStrikethroughStyleAttributeName, value: 1, range: strikeValueRange)
//        self.addAttribute(NSForegroundColorAttributeName, value: color, range:strikeValueRange)
//        return self
//    }
}

extension UIColor {
    class func themeBlueColor() -> UIColor{
        return UIColor(red:0, green:0.2, blue:0.55, alpha:1)
    }
    
    class func themeTextBlackColor() -> UIColor{
        return UIColor(red:0.46, green:0.46, blue:0.47, alpha:1)
    }
    
    class func offerPriceColor() -> UIColor{
        return UIColor(red:0.63, green:0.63, blue:0.63, alpha:1)
    }
    
    class func addressColor() -> UIColor{
        return UIColor(red:113/255, green:113/255, blue:113/255, alpha:1)
    }
    
    class func greyPlaceholderColor() -> UIColor {
        return UIColor(red: 0.78, green: 0.78, blue: 0.80, alpha: 1.0)
    }
}

extension UIFont{
    func themeFontRomanWithSize(fontSize : CGFloat) -> UIFont {
        return UIFont.init(name: "Avenir-Roman", size: fontSize)!
    }
}



class ExtensionMethods: NSObject {
    class func themeColor() -> UIColor {
        return UIColor(red:0.52, green:0.79, blue:0.07, alpha:1)
    }
    
    class func themeTextColor() -> UIColor {
        return UIColor(red:0.11, green:0.11, blue:0.11, alpha:1)
    }

    class func themeBorderColor() -> UIColor{
        return UIColor(red:0.8, green:0.8, blue:0.8, alpha:1)
    }
}

extension UILabel {
    convenience init(badgeText: String, color: UIColor = UIColor.red, fontSize: CGFloat = UIFont.smallSystemFontSize) {
        self.init()
        text = " \(badgeText) "
        textColor = UIColor.white
        backgroundColor = color
        
        font = UIFont.systemFont(ofSize: fontSize)
        layer.cornerRadius = fontSize * CGFloat(0.6)
        clipsToBounds = true
        
        translatesAutoresizingMaskIntoConstraints = false
        addConstraint(NSLayoutConstraint(item: self, attribute: .width, relatedBy: .greaterThanOrEqual, toItem: self, attribute: .height, multiplier: 1, constant: 0))
    }
}

extension UIBarButtonItem {
    convenience init(badge: String?, button: UIButton, target: AnyObject?, action: Selector) {
        button.addTarget(target, action: action, for: .touchUpInside)
        button.sizeToFit()
        
        let badgeLabel = UILabel(badgeText: badge ?? "")
        button.addSubview(badgeLabel)
        button.addConstraint(NSLayoutConstraint(item: badgeLabel, attribute: .top, relatedBy: .equal, toItem: button, attribute: .top, multiplier: 1, constant: 0))
        button.addConstraint(NSLayoutConstraint(item: badgeLabel, attribute: .centerX, relatedBy: .equal, toItem: button, attribute: .trailing, multiplier: 1, constant: 0))
        if nil == badge {
            badgeLabel.isHidden = true
        }
        badgeLabel.tag = UIBarButtonItem.badgeTag
        self.init(customView: button)
    }
    
    convenience init(badge: String?, image: UIImage, target: AnyObject?, action: Selector) {
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 0, y:0, width:image.size.width, height:image.size.height)
        button.setBackgroundImage(image, for: .normal)
        
        self.init(badge: badge, button: button, target: target, action: action)
    }
    
    convenience init(badge: String?, title: String, target: AnyObject?, action: Selector) {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: UIFont.buttonFontSize)
        
        self.init(badge: badge, button: button, target: target, action: action)
    }
    
    var badgeLabel: UILabel? {
        return customView?.viewWithTag(UIBarButtonItem.badgeTag) as? UILabel
    }
    
    var badgedButton: UIButton? {
        return customView as? UIButton
    }
    
    var badgeString: String? {
        get { return badgeLabel?.text?.trimmingCharacters(in: NSCharacterSet.whitespaces) }
        set {
            if let badgeLabel = badgeLabel {
                badgeLabel.text = nil == newValue ? nil : " \(newValue!) "
                badgeLabel.sizeToFit()
                badgeLabel.isHidden = nil == newValue
            }
        }
    }
    
    var badgedTitle: String? {
        get { return badgedButton?.title(for: .normal) }
        set { badgedButton?.setTitle(newValue, for: .normal); badgedButton?.sizeToFit() }
    }
    
    
    
    private static let badgeTag = 7373
}


extension UILabel {
    func setHTMLFromString(text: String) {
        let modifiedFont = NSString(format:"<span style=\"font-family: \(self.font!.fontName); font-size: \(self.font!.pointSize); color: #737477 \">%@</span>" as NSString, text)
        
        let attrStr = try! NSAttributedString(
            data: modifiedFont.data(using: String.Encoding.unicode.rawValue, allowLossyConversion: true)!,
            options: [NSAttributedString.DocumentReadingOptionKey.documentType:NSAttributedString.DocumentType.html, NSAttributedString.DocumentReadingOptionKey.characterEncoding: String.Encoding.utf8.rawValue],
            documentAttributes: nil)
        
        self.attributedText = attrStr
    }
}

extension UIImage {
    
    enum JPEGQuality: CGFloat {
        case lowest  = 0
        case low     = 0.25
        case medium  = 0.5
        case high    = 0.75
        case highest = 1
    }
    
    /// Returns the data for the specified image in PNG format
    /// If the image object’s underlying image data has been purged, calling this function forces that data to be reloaded into memory.
    /// - returns: A data object containing the PNG data, or nil if there was a problem generating the data. This function may return nil if the image has no data or if the underlying CGImageRef contains data in an unsupported bitmap format.
    var png: Data? { return self.pngData() }
    
    /// Returns the data for the specified image in JPEG format.
    /// If the image object’s underlying image data has been purged, calling this function forces that data to be reloaded into memory.
    /// - returns: A data object containing the JPEG data, or nil if there was a problem generating the data. This function may return nil if the image has no data or if the underlying CGImageRef contains data in an unsupported bitmap format.
    func jpeg(_ quality: JPEGQuality) -> Data? {
        return self.jpegData(compressionQuality: quality.rawValue)// UIImageJPEGRepresentation(self, quality.rawValue)
    }
    
    func resized(withPercentage percentage: CGFloat) -> UIImage? {
        let canvasSize = CGSize(width: size.width * percentage, height: size.height * percentage)
        UIGraphicsBeginImageContextWithOptions(canvasSize, false, scale)
        defer { UIGraphicsEndImageContext() }
        draw(in: CGRect(origin: .zero, size: canvasSize))
        return UIGraphicsGetImageFromCurrentImageContext()
    }
    
    func resized(toWidth width: CGFloat) -> UIImage? {
        let canvasSize = CGSize(width: width, height: CGFloat(ceil(width/size.width * size.height)))
        UIGraphicsBeginImageContextWithOptions(canvasSize, false, scale)
        defer { UIGraphicsEndImageContext() }
        draw(in: CGRect(origin: .zero, size: canvasSize))
        return UIGraphicsGetImageFromCurrentImageContext()
    }
    
    
}

extension Notification.Name {
    static let consentChange = Notification.Name(
        rawValue: "ConsentUpdated")
}

extension UIViewController {
    var compatibleSafeInsets: UIEdgeInsets {
        if #available(iOS 11, *) {
            return view.safeAreaInsets
        } else {
            return UIEdgeInsets(top: topLayoutGuide.length, left: 0, bottom: bottomLayoutGuide.length, right: 0)
        }
    }
}

extension UIView {
    /** Loads instance from nib with the same name. */
    func loadNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nibName = type(of: self).description().components(separatedBy: ".").last!
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as! UIView
    }
}
/*
extension Formatter {
    static let iso8601: ISO8601DateFormatter = {
        let formatter = ISO8601DateFormatter()
        if #available(iOS 11.0, *) {
            formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        } else {
            
            // Fallback on earlier versions
        }
        return formatter
    }()
}
*/

extension Formatter {
    static let iso8601: DateFormatter = {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        return formatter
    }()
}
extension Date {
    var iso8601: String {
        return Formatter.iso8601.string(from: self)
    }
}

extension String {
    var dateFromISO8601: Date? {
        return Formatter.iso8601.date(from: self)   // "Mar 22, 2017, 10:22 AM"
    }
}

extension Date {
    init(dateString: String) {
        self = Date.iso8601Formatter.date(from: dateString)!
    }
    
    static let iso8601Formatter: ISO8601DateFormatter = {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withFullDate,
                                   .withTime,
                                   .withDashSeparatorInDate,
                                   .withColonSeparatorInTime]
        return formatter
    }()
}

extension UIDevice {
    var hasNotch: Bool {
        if #available(iOS 11.0, *) {
            let bottom = UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0
            return bottom > 0
        } else {
            // Fallback on earlier versions
            return Constant.DeviceType.IS_IPHONE_X
        }
        
    }
}

//extension SDStateTableView {
//    
//    func showNoNetworkUI(completion: @escaping() -> Void) {
//        if AppSharedData.sharedInstance.isReachableInternet {
//            self.setState(.dataAvailable)
//        } else {
//            UIApplication.topViewController()?.removeLoadingIndicator()
//            self.setState(.withButton(errorImage: #imageLiteral(resourceName: "no_internet"),
//                                      title: "NO INTERNET".localized(),
//                                      message: "You are not connected to Internet, please try later".localized(),
//                                      buttonTitle: "Try Again".localized(),
//                                      buttonConfig: { (button) in
//                                        // You can configure the button here
//            },
//                                      retryAction: {
//                                        completion()
//            }))
//        }
//    }
//}

extension Date {
    func startOfMonth() -> Date {
        return Calendar.current.date(from: Calendar.current.dateComponents([.year, .month], from: Calendar.current.startOfDay(for: self)))!
    }
    
    func endOfMonth() -> Date {
        return Calendar.current.date(byAdding: DateComponents(month: 1, day: -1), to: self.startOfMonth())!
    }
    
    //Last Month Start
    func getLastMonthStart() -> Date {
        let components:NSDateComponents = Calendar.current.dateComponents([.year, .month], from: self) as NSDateComponents
        components.month -= 1
        return Calendar.current.date(from: components as DateComponents)!
    }
    
    //Last Month End
    func getLastMonthEnd() -> Date {
        let components:NSDateComponents = Calendar.current.dateComponents([.year, .month], from: self) as NSDateComponents
        components.day = 1
        components.day -= 1
        return Calendar.current.date(from: components as DateComponents)!
    }
    
    // Convert local time to UTC (or GMT)
    func toGlobalTime() -> Date {
        let timezone = TimeZone.current
        let seconds = -TimeInterval(timezone.secondsFromGMT(for: self))
        return Date(timeInterval: seconds, since: self)
    }
    
    // Convert UTC (or GMT) to local time
    func toLocalTime() -> Date {
        let timezone = TimeZone.current
        let seconds = TimeInterval(timezone.secondsFromGMT(for: self))
        return Date(timeInterval: seconds, since: self)
    }
}

