//This is the parrent class for the different dice

import Foundation

class Die {
    var sides: [String]
    var color: String
    
    init(){
        self.sides = []
        self.color = ""
    }
    
    func rollDie() -> String {
        if let side = sides.randomElement() {
            return side
        }
        
        return ""
    }
}
