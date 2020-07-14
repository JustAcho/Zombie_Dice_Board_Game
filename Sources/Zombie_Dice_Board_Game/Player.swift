//This is the Player class
//Every Player should have a name, health points and will accumulate a score

import Foundation

class Player {
    let name: String
    var score: Int = 0
    var health: Int = 3
    init(name: String) {
        
        self.name = name
    }
}
