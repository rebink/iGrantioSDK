//
//	Purpose.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import SwiftyJSON

class Purpose{

	var descriptionField : String!
	var iD : String!
	var lawfulUsage : Bool!
    var policyURL : String!


	/**
	 * Instantiate the instance using the passed json values to set the properties values
	 */
	init(fromJson json: JSON!){
		if json.isEmpty{
			return
		}
		descriptionField = json["Description"].stringValue
		iD = json["ID"].stringValue
		lawfulUsage = json["LawfulUsage"].boolValue
        policyURL = json["PolicyURL"].stringValue 

	}

}
