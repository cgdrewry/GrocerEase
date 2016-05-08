//loads up cells from this file for local testing

import UIKit

let shoppingItems = [
    Item(name: "tuna", desc: "albacore", quantity: "3"),
    Item(name: "bread", desc: "white", quantity: "2"),
    Item(name: "eggs", desc: "free range", quantity: "12"),
    Item(name: "bacon", desc: "Canadian", quantity: "4"),
    Item(name: "cheese", desc: "Brie", quantity: "1"),
    Item(name: "pizza", desc: "Digorino", quantity: "2"),
    Item(name: "onions", desc: "pearl", quantity: "7"),
    Item(name: "doughnuts", desc: "CHOCOLATE", quantity: "42")
]

let hamburgerItems = [
    Item(name: "beef", desc: "ground, lean", quantity: "1.5 lbs"),
    Item(name: "onion", desc: "finely chopped", quantity: "1/2"),
    Item(name: "sharp Cheddar", desc: "shredded", quantity: "1/2 cup"),
    Item(name: "soy sauce", desc: "", quantity: "1 teaspoon"),
    Item(name: "Worcestershire sauce", desc: "", quantity: "1 tsp"),
    Item(name: "egg", desc: "", quantity: "1"),
    Item(name: "garlic", desc: "minced", quantity: "1 clove"),
    Item(name: "garlic powder", desc: "", quantity: "1 tablespoon"),
    Item(name: "parsley", desc: "dried", quantity: "1 tsp"),
    Item(name: "basil", desc: "dried", quantity: "1 tsp"),
    Item(name: "oregano", desc: "dried", quantity: "1 tsp"),
    Item(name: "dried rosemary", desc: "crushed", quantity: "1/2 tsp"),
    Item(name: "salt and pepper", desc: "to taste", quantity: "")
]

let beerItems = [
    Item(name: "Purple Haze", desc: "Abita", quantity: "sixer"),
    Item(name: "Old Rasputin", desc: "might wanna get steak, too", quantity: "4"),
    Item(name: "The Cowboy", desc: "Evil Twin", quantity: "4"),
    Item(name: "Holy Grail Ale", desc: "yellow box", quantity: "6"),
    Item(name: "Citradelic", desc: "New Belgium", quantity: "twelver"),
    Item(name: "La Folie", desc: "New Belgium", quantity: "all of it"),
    Item(name: "Rolling Rock", desc: "", quantity: "30"),
    Item(name: "Peroni", desc: "import", quantity: "6"),
    Item(name: "Warsteiner Dunkel", desc: "'schland", quantity: "mini keg")
]

let oystersItems = [
    Item(name: "oysters", desc: "unshucked, Lynnhaven River", quantity: "200"),
    Item(name: "eggs", desc: "", quantity: "dozen"),
    Item(name: "crackers", desc: "Saltines", quantity: "box or two"),
    Item(name: "oil", desc: "vegetable", quantity: "4 liters")
]

let safeTestItems = [
    Item(name: "name1", desc: "desc1", quantity: "qant1"),
    Item(name: "name2", desc: "desc2", quantity: "qant2")
]

let uiTestItems = [
    Item(name: "test name", desc: "really goddamn long test description that is absolute bullshit in length", quantity: "1")
]

//healthy, cheap, expensive, favorite, meal
let burgerTags = [false, true, false, false, true]
let beerTags = [false, false, true, true, false]
let shoppingTags = [true, true, false, false, false]
let oysterTags = [false, false, true, true, true]

//lists[0].users = "Abel, Dylan"
//lists[1].users = "Dylan"
//lists[2].users = "Abel, Taylor"
//lists[3].users = "Abel, Taylor, Kevin, Kruz, Mika"
let burgerUsers = "Abel, Dylan"
let beerUsers = "Abel, Taylor"
let shoppingUsers = "Dylan"
let oysterUsers = "Abel, Taylor, Kevin, Kruz, Mika"


let storedLists = [
    //List(name: "safe list", list_items: safeTestItems)
    List(name: "hamburger recipe", list_items: hamburgerItems, tags: burgerTags, users: burgerUsers),
    List(name: "this week's shopping", list_items: shoppingItems, tags: shoppingTags, users: shoppingUsers),
    List(name: "beer shopping list", list_items: beerItems, tags: beerTags, users: beerUsers),
    List(name: "fried oysters", list_items: oystersItems, tags: oysterTags, users: oysterUsers)
]

let user = "Chris"

//https://developer.apple.com/library/ios/referencelibrary/GettingStarted/DevelopiOSAppsSwift/Lesson10.html#//apple_ref/doc/uid/TP40015214-CH14-SW1