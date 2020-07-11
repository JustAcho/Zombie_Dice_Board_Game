import Foundation

class GreenDie: Die {
    
    override init() {
        super.init()
        sides = Array(repeating: "💥", count: 1) +
            Array(repeating: "👣", count: 2) +
            Array(repeating: "🧠", count: 3)
        color = "Green"
    }
}

