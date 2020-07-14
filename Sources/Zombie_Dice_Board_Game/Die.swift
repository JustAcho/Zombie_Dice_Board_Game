//This is the parrent class (Die) for the different dice

import Foundation

class Die {
    var sides: [String]
    var color: String
    
    init(){
        self.sides = []
        self.color = ""
    }
    
    // A function which imitates rolling a die -> it gives us a random side
    func rollDie() -> String {
        if let side = sides.randomElement() {
            return side
        }
        
        return ""
    }
}
