//
//	Statu.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import SwiftyJSON

class ConsentStatus{

	var consented = ConsentType.Allow
	var days : Int!
	var remaining : Int!
	var timeStamp : String!


	/**
	 * Instantiate the instance using the passed json values to set the properties values
	 */
	init(fromJson json: JSON!){
		if json.isEmpty{
			return
		}
//        consented = json["Consented"].stringValue
		days = json["Days"].intValue
		remaining = json["Remaining"].intValue
		timeStamp = json["TimeStamp"].stringValue
        if json["Consented"].stringValue == "Allow"{
            consented = .Allow
        }
        else if json["Consented"].stringValue == "DisAllow"{
            consented = .Disallow
        }
        else if json["Consented"].stringValue == "yes"{
            consented = .Allow
        }
        else{
            consented = .AskMe
        }
	}

}
