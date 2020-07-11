import Foundation

struct DicePool {
    var dice: [Die]
    
    init () {
        dice = Array(repeating: RedDie(), count: 3) +
            Array(repeating: YellowDie(), count: 4) +
            Array(repeating: GreenDie(), count: 6)
    }
    
    mutating func drawDie() -> Die? {
           if(dice.isEmpty) {
               return nil
           }
           let index = Int.random(in: 0..<dice.count)
           let result: Die = dice[index]
           dice.remove(at: index)
           return result
       }
       
    mutating func drawDice(number: Int) -> [Die] {
        var result: [Die] = []
        
        for _ in 0..<number {
            result.append(drawDie()!)
        }
           return result
       }
    
}
