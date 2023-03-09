//
//  ConfigViewModel.swift
//  ViewModel
//
//  Created by Kartik Gupta on 02/03/23.
//

import Foundation

class ConfigViewModel: NSObject {
    private var cofigService: ConfigServiceProtocol
        
    var setting = String()

    init(cofigService: ConfigServiceProtocol = ConfigService()) {
        self.cofigService = cofigService
    }
    
    func getConfigSetting() {
        cofigService.getConfigSetting(fileName: "config") { success, model, error in
            if success, let config = model {
                self.setting = config.workHours
            } else {
                print(error!)
            }
        }
    }
   
}
