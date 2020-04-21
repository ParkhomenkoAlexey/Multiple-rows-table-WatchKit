//
//  InterfaceController.swift
//  TableWatchLesson WatchKit Extension
//
//  Created by Алексей Пархоменко on 14.04.2020.
//  Copyright © 2020 Алексей Пархоменко. All rights reserved.
//

import WatchKit
import Foundation

struct Model {
    var title: String
    var description: String
    var objects: [String]
    
    static func getData() -> [Model] {
        return [
            Model(title: "Молочный Коктейль", description: "Самый вкусный клубничный коктель", objects: ["Молоко", "Сахар", "Клубника", "Ваниль"]),
            Model(title: "Овощное Рагу", description: "Овощное рагу с кабачками", objects: ["Картошка", "Перец", "Соленые огурчики", "Кабачки"]),
            Model(title: "Десерт", description: "Создаем легкий десерт на завтрак", objects: ["Йогурт", "Яйцо", "Сахар", "Банан"]),
            Model(title: "Пирог", description: "Праздничный пирог с ягодами", objects: ["Тесто", "Сахар", "Ягоды", "яйцо", "Мука"])
        ]
    }
}

class InterfaceController: WKInterfaceController {

    @IBOutlet weak var table: WKInterfaceTable!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        table.setNumberOfRows(Model.getData().count, withRowType: "tableid")
        
        for (index, item) in Model.getData().enumerated() {
            let controller = table.rowController(at: index) as! TableRowController
            controller.titleLabel.setText(item.title)
            controller.descriptionLabel.setText(item.description)
        }
    }
    
    override func contextForSegue(withIdentifier segueIdentifier: String, in table: WKInterfaceTable, rowIndex: Int) -> Any? {
        return Model.getData()[rowIndex]
    }

}
