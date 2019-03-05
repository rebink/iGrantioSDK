//
//  ConsentViewController.swift
//  iGrant
//
//  Created by Ajeesh T S on 26/03/18.
//  Copyright © 2018 iGrant.com. All rights reserved.
//

import UIKit
enum ConsentType {
    case Allow
    case Disallow
    case AskMe
}


class ConsentViewController: BaseViewController {
    @IBOutlet weak var tableView: UITableView!
    var consent :ConsentDetails?
    var purposeDetails : ConsentListingResponse?
    var selectedConsentType = ConsentType.Allow
    var preIndexPath : IndexPath?
    var orgID : String?
    var consentID : String = ""
    
    var purposeID : String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = false
        self.title = consent?.descriptionField
        tableView.tableFooterView = UIView()
        self.tableView.rowHeight = UITableView.automaticDimension
        if let data = purposeDetails?.consentID {
            consentID = data
        }
        
        if let data = purposeDetails?.consents.purpose.iD {
            purposeID = data
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    func changeConsentValue(valueDict:[String: AnyObject]){
        if self.orgID != nil && consent?.iD != nil{
            NotificationCenter.default.post(name: .consentChange, object: nil)
            self.addLoadingIndicator()
            let serviceManager = OrganisationWebServiceManager()
            serviceManager.managerDelegate = self
            serviceManager.updateConsent(orgId: (self.orgID)!, consentID: consentID, attributeId: (consent?.iD)!, purposeId:purposeID, valuesDict: valueDict)
        }
    }
    

}

extension  ConsentViewController : UITableViewDelegate,UITableViewDataSource{
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row != 2{
            return 45
        }else{
            return 95
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        if indexPath.row != 2{
            let allowCell = tableView.dequeueReusableCell(withIdentifier:Constant.CustomTabelCell.KOrgDetailedConsentAllowCellID,for: indexPath)
//            if consent?.status?.consented == "Allow"{
//                if indexPath.row == 0{
//                  allowCell.accessoryType = .checkmark
//                }else{
//                    allowCell.accessoryType = .none
//                }
//            }
//            else if consent?.status?.consented == "AskMe"{
//                if indexPath.row == 0{
//                    allowCell.accessoryType = .none
//                }else{
//                    allowCell.accessoryType = .checkmark
//                }
//            }
            if indexPath.row == 0{
                allowCell.textLabel?.text = NSLocalizedString("Allow", comment: "")
                if consent?.status?.consented == .Allow{
                    allowCell.accessoryType = .checkmark
                    preIndexPath = indexPath
                }else{
                    allowCell.accessoryType = .none
                }
            }else{
                allowCell.textLabel?.text = NSLocalizedString("Disallow", comment: "")
                if consent?.status?.consented == .Disallow{
                    preIndexPath = indexPath
                    allowCell.accessoryType = .checkmark
                }else{
                    allowCell.accessoryType = .none
                }
            }
            allowCell.textLabel?.font = UIFont(name: "OpenSans", size: 15)
            return allowCell
            
        }else{
            let askMeCell = tableView.dequeueReusableCell(withIdentifier:Constant.CustomTabelCell.KOrgDetailedConsentAskMeCellID,for: indexPath) as! AskMeSliderTableViewCell
            askMeCell.delegate = self
            askMeCell.index = indexPath
            if consent?.status?.consented == .AskMe{
                askMeCell.tickImage.isHidden = false
//                askMeCell.selectedDaysLbl.text = "30 Days"
                let days : Int = (consent?.status?.days)!
                askMeCell.selectedDaysLbl.text = "\(days) " + NSLocalizedString("Days", comment: "")
                askMeCell.askMeSlider.setValue(Float(days), animated: false)
                preIndexPath = indexPath

            }else{
                askMeCell.tickImage.isHidden = true
                askMeCell.selectedDaysLbl.text = NSLocalizedString("30 Days", comment: "")
                askMeCell.askMeSlider.setValue(30, animated: false)
            }
            return askMeCell
        }

    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return NSLocalizedString("CONSENT", comment: "")
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        var consentTitle : String = ""
        if consent?.descriptionField != nil{
           consentTitle = (consent?.descriptionField)!
        }
        
        if consent?.status?.consented == .Allow{
            return NSLocalizedString("If you choose “Allow”, you are consenting to the use of your personal data ", comment: "") + (consentTitle) + NSLocalizedString(" permanently for any analytics or third party usage beyond the purposes you have signed up with.", comment: "")
        }
        else if consent?.status?.consented == .Disallow{
            return NSLocalizedString("If you choose “Disallow”, you are disabling the use of your personal data for any analytics or third party usage beyond the purposes you have signed up with.", comment: "")
            
        }
        else{
            return NSLocalizedString("If you choose “Ask me”, you consent to use your data for the selected period. When the  time period expires, you get notified in real time requesting for consent when the data provider is using your data.", comment: "")
        }
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        
        if indexPath.row == 0{
            if preIndexPath != indexPath {
                consent?.status?.consented = .Allow
                self.changeConsentValue(valueDict: ["consented":"Allow" as AnyObject])
                preIndexPath = indexPath
                self.tableView.reloadData()
            }
        }
        else if indexPath.row == 1{
            if preIndexPath != indexPath {
                consent?.status?.consented = .Disallow
                self.changeConsentValue(valueDict: ["consented":"DisAllow" as AnyObject])
                preIndexPath = indexPath
            }
            self.tableView.reloadData()
        }

    }
}

extension ConsentViewController:WebServiceTaskManagerProtocol{
    
    func didFinishTask(from manager:AnyObject, response:(data:RestResponse?,error:String?)){
        self.removeLoadingIndicator()
        
        if response.error != nil{
            self.showErrorAlert(message: (response.error)!)
            return
        }
        
        if let serviceManager = manager as? OrganisationWebServiceManager{
            if serviceManager.serviceType == .UpdateConsent{
            }
        }
    }
    
}

extension  ConsentViewController : AskMeSliderCellDelegate{
    func askMeSliderValueChanged(days:Int){
        consent?.status?.consented = .AskMe
        consent?.status?.days = days
        self.tableView.reloadData()
    }
    
    func updatedSliderValue(days:Int,indexPath:IndexPath){
        preIndexPath = indexPath
        self.changeConsentValue(valueDict: ["days":days as AnyObject])
    }


}


