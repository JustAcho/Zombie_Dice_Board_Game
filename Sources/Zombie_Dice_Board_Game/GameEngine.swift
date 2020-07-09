import Foundation

struct GameEngine{
    var players: [Player]
    let dice: [Die]
    var brainsScore: Int
    var shotScore: Int
    
    init() {
        brainsScore = 0
        shotScore = 0
        dice = Array(repeating: RedDie(), count: 3) +
               Array(repeating: YellowDie(), count: 4) +
               Array(repeating: GreenDie(), count: 6)
        players = []
        
    }
    
    mutating func addPlayers(num: Int) {
        for i in 0...num-1 {
            print("Please enter the name of player \(i)")
            let newPlayer: Player = Player(name: readLine()!)
            players.append(newPlayer)
        }
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
        
    }
    
}
