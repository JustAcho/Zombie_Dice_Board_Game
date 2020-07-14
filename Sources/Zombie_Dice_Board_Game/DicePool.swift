// This class simulates a place, where all 13 dice are stored

import Foundation

struct DicePool {
    var dice: [Die]
    
    init () {
        dice = Array(repeating: RedDie(), count: 3) +
            Array(repeating: YellowDie(), count: 4) +
            Array(repeating: GreenDie(), count: 6)
    }
    
    // Function which simulates drawing a single die from the pool (and removing it from the dice array)
    mutating func drawDie() -> Die {
        if (dice.count < 1) {
            let emptyDie: Die = Die()
            print("----------------------------------")
            print("There are no dice left in the cup!")
            print("Please end your turn!")
            print("----------------------------------")
            return emptyDie
        }
        let index = Int.random(in: 0..<dice.count)
        let result: Die = dice[index]
        dice.remove(at: index)
        return result
    }
    
    // Function which simulates a player drawing a specific number of dice (could be 0, 1, 2, 3)
    // depending on how many dice with "feet" they have in their hand
    mutating func drawDice(number: Int) -> [Die]? {
        
        var result: [Die] = []
        for _ in 0..<number {
            result.append(drawDie())
        }
        return result
    }
    
}
