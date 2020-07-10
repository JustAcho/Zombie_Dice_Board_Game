//This is the parrent class for the different dice

import Foundation

class Die {
   var sides: [String]
    
    init(){
        self.sides = []
    }
    
    func rollDie() -> String {
        if let side = sides.randomElement() {
            return side
        }
        
        return ""
    }
    
    
}
