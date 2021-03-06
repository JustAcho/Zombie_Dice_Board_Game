// Class for the Yellow Die (inherits class Die)

import Foundation

class YellowDie: Die {
    
    override init() {
        super.init()
        sides = Array(repeating: "💥", count: 2) +
            Array(repeating: "👣", count: 2) +
            Array(repeating: "🧠", count: 2)
        color = "Yellow"
    }
}
