//implementation of the basic list

import UIKit

class List {
    var name: String
    var list_items: [Item]
    var tags: [String]?
    var users: [String]?
    
    init(name: String, list_items: [Item]) {
        self.name = name
        self.list_items = list_items
    }
}