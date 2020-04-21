//
//  InterfaceDetailController.swift
//  TableWatchLesson WatchKit Extension
//
//  Created by Алексей Пархоменко on 14.04.2020.
//  Copyright © 2020 Алексей Пархоменко. All rights reserved.
//

import UIKit
import WatchKit

class InterfaceDetailController: WKInterfaceController {

    
    @IBOutlet weak var titleLabel: WKInterfaceLabel!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        if let model = context as? Model {
            titleLabel.setText(model.description)
            
        }
    }
}
