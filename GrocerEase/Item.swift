//implementation of the basic list item

import UIKit

class Item {
    var name: String
    var desc: String //details
    var quantity: String
    var completed: Bool
    
    init(name: String, desc: String, quantity: String) {
        self.name = name
        self.desc = desc
        self.quantity = quantity
        self.completed = false
    }
}