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

    @IBOutlet weak var detailTable: WKInterfaceTable!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        if let model = context as? Model {
            let rowTypes: [String] = ["descriptionID"] + model.objects.map({ _ in "ingredientID" })
            print(rowTypes)
            detailTable.setRowTypes(rowTypes)
            
            for i in 0..<detailTable.numberOfRows {
                let row = detailTable.rowController(at: i)
                if let descriptionRow = row as? DescriptionRow {
                    descriptionRow.descriptionLabel.setText(model.description)
                } else if let objectRow = row as? IngredientRow {
                    objectRow.ingredientLabel.setText("\(i). " + model.objects[i - 1])
                }
            }
        }
    }
}
