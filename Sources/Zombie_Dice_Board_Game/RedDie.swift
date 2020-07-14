// Class for the Red Die (inherits class Die)

import Foundation

class RedDie: Die {
    
    override init() {
        super.init()
        sides = Array(repeating: "💥", count: 3) +
            Array(repeating: "👣", count: 2) +
            Array(repeating: "🧠", count: 1)
        color = "Red"
    }
}
