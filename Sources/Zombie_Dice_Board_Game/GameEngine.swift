// The class with the game`s main logic

import Foundation

struct GameEngine {
    var players: [Player]
    
    init() {
        players = []
    }
    
    // Functions which asks for player`s name and saves the newly created player it in the players array
    mutating func addPlayers(num: Int) {
        for i in 1...num {
            print("Please enter the name of player \(i):")
            let newPlayer: Player = Player(name: readLine()!)
            players.append(newPlayer)
        }
    }
    
    // Function to simulate a player`s turn
    func takeTurn(player: Player) {
        var cup: DicePool = DicePool() // Creates a new "cup" -> place where we store the 13 dice
        var endTurn: Bool = false
        var hand: [Die] = cup.drawDice(number: 3)! // The playing hand -> this is what the player has drawn
        var currentScore: Int = 0 // Stores the score of the player ONLY for this turn
        player.health = 3
        
        while(!endTurn){
            var index: Int = 0
            
            // This code iterates the dice in hand and checks what side have they dropped on
            // It removes the dice which dropped on "brain" or "shot" and keeps the ones with "feet"
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
                currentScore = 0 // If the player is killed, he loses all the points earned during the turn
                break
            }
            print("----------------------------------")
            print("Do you want to throw again? yes/no")
            if(readLine()! == "no") {
                endTurn = true
            }
            // Draws as many dice as needed (dice in hand must be 3)
            hand.append(contentsOf: cup.drawDice(number: 3 - hand.count)!)
        }
        // Add the score from the turn to the player`s score
        player.score += currentScore
    }
    
    // A function to print the scores of all the players
    func printScoreboard() {
        print("\n")
        print("----SCOREBOARD----")
        for i in players {
            print("\(i.name) has eaten \(i.score) brains")
            print("-------------------------------------")
        }
        print("\n")
    }
    
    // A function to reset the scores of all the players (if a new game is started)
    func resetScores() {
        for i in players {
            i.score = 0;
        }
    }
    
    // This method starts the game
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
                // Every player takes a turn, until the game is won
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
