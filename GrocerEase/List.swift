//implementation of the basic list

import UIKit

class List {
    var name: String
    var list_items: [Item]
    var tags = [Bool]()
    var users: String
    
    init(name: String, list_items: [Item], tags: [Bool], users: String) {
        self.name = name
        self.list_items = list_items
//        self.tags[0] = false //healthy
//        self.tags[1] = false //unhealthy
//        self.tags[2] = false //cheap
//        self.tags[3] = false //expensive
//        self.tags[4] = false //meal
        self.tags = tags
        self.users = users
    }
}