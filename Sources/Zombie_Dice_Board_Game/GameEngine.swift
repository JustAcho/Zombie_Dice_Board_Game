import Foundation

struct GameEngine {
    var players: [Player]
    
    init() {
        players = []
    }
    
    mutating func addPlayers(num: Int) {
        for i in 1...num {
            print("Please enter the name of player \(i):")
            let newPlayer: Player = Player(name: readLine()!)
            players.append(newPlayer)
        }
    }
    
    func takeTurn(player: Player) {
        var cup: DicePool = DicePool()
        var endTurn: Bool = false
        var hand: [Die] = cup.drawDice(number: 3)!
        var currentScore: Int = 0
        player.health = 3
        
        while(!endTurn){
            var index: Int = 0
            
            for i in hand {
                let side: String = i.rollDie()
                print("You rolled a \(i.color) die with \(side)")
                
                if(side == "🧠") {
                    currentScore += 1
                    hand.remove(at: index)
                    index -= 1
                }
                else if(side == "💥"){
                    player.health -= 1
                    hand.remove(at: index)
                    index -= 1
                }
                index += 1
            }
            if(player.health < 1) {
                print("\n")
                print("💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥")
                print("   \(player.name) has been killed!   ")
                print("💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥")
                currentScore = 0
                break
            }
            print("----------------------------------")
            print("Do you want to throw again? yes/no")
            if(readLine()! == "no") {
                endTurn = true
            }
            hand.append(contentsOf: cup.drawDice(number: 3 - hand.count)!)
        }
        player.score += currentScore
    }
    
    func printScoreboard() {
        print("\n")
        print("----SCOREBOARD----")
        for i in players {
            print("\(i.name) has eaten \(i.score) brains")
            print("-------------------------------------")
        }
        print("\n")
    }
    
    func resetScores() {
        for i in players {
            i.score = 0;
        }
    }
    
    mutating func start() {
        print("🧟‍♂️ Hello and Welcome to Zombie Dice! 🧠")
        print("---------------------------------------")
        print("Please enter the number of players (2-8)")
        
        var playerCount: Int = Int(readLine()!)!
        while(playerCount < 2 || playerCount > 8) {
            print("Please enter a VALID number of players")
            playerCount = Int(readLine()!)!
        }
        
        addPlayers(num: playerCount)
        
        var gameWon: Bool = false
        var playAgain: Bool = true
        
        while(playAgain){
            
            resetScores()
            gameWon = false
            
            while(!gameWon) {
                for i in players {
                    printScoreboard()
                    print("---------------------")
                    print("\(i.name) is playing ")
                    print("---------------------")
                    
                    takeTurn(player: i)
                    
                    if(i.score >= 13){
                        print("🥇 \(i.name) has won the game! 🥇")
                        gameWon = true
                        break
                    }
                }
            }
            
            print("---------------------------------")
            print("Do you want to play again? yes/no")
            print("---------------------------------")
            if(readLine()! == "no") {
                playAgain = false;
            }
        }
        print("----------------------")
        print("Thank you for playing!")
        print("----------------------")
    }
}
