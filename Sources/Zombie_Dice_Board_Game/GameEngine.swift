import Foundation

struct GameEngine {
    var players: [Player]
    var dicePool: [Die]
    
    init() {
        dicePool = Array(repeating: RedDie(), count: 3) +
                   Array(repeating: YellowDie(), count: 4) +
                   Array(repeating: GreenDie(), count: 6)
        players = []
        
    }
    
    mutating func addPlayers(num: Int) {
        for i in 1...num {
            print("Please enter the name of player \(i)")
            let newPlayer: Player = Player(name: readLine()!)
            players.append(newPlayer)
        }
    }
    
    mutating func drawDie() -> Die? {
        if(dicePool.isEmpty) {
            return nil
        }
        
        let index = Int.random(in: 0..<dicePool.count)
        let result: Die = dicePool[index]
        dicePool.remove(at: index)
        return result
        
        
    }
    
    mutating func draw3Dice() -> [Die] {
        var result: [Die]
        result = []
        for _ in 1...3 {
            if let die = drawDie() {
                result.append(die)
        }
            
    }
        return result
    }
    
    mutating func start() {
        print("Hello and Welcome to Zombie Dice!")
        print("Please enter the number of player (2-8)")
        
        var playerCount: Int = Int(readLine()!)!
        
        while(playerCount < 2 || playerCount > 8){
            print("Please enter a VALID number of players")
            playerCount = Int(readLine()!)!
        }
        
        addPlayers(num: playerCount)
        
        var gameWon: Bool = false
        
        while(!gameWon){
            for i in 0...playerCount-1{
                print("\(players[i].name) throws... ")
                var hand: [Die] = draw3Dice()
                for j in hand {
                    var side: String = j.rollDie()
                    print(side)
                    if (side == "🧠"){
                        players[i].score += 1
                    }
                    else if (side == "💥") {
                        players[i].health -= 1
                        }
                    }
                
                if (players[i].score > 12){
                    print("\(players[i].name) has won the game!")
                    gameWon = true
                }
                init()
                }
                
                }
                
            }
}
        
    
    

