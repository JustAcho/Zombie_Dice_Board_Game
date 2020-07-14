# Zombie Dice
### *The popular board game Zombie Dice written and implemented using Swift*


## Overview
Hello and welcome to Zombie Dice! This project was done for my Swift course in SU FMI.

## Different kinds of dice and sides

You need 13 dice to play the game. The dice have 6 sides with different pictures on them. The pictures can be: 

* *Brain* 🧠 - A player should get as many as he can of these. They give the player 1 point.
* *Footsteps* 👣 - A player can roll this die again. 
* *Shotguns* 💥 - If the player gets 3 of these in a single turn, he will lose all of the brains (points) he collected during this turn.


The dice come in 3 different colors. There are 6 green dice, 4 yellow dice and 3 red dice.
1. *Green dice* - They have 3 x 🧠,  2 x 👣,  1 x 💥 (The most favorable)

2. *Yellow dice* - They have 2 x 🧠,  2 x 👣,  2 x 💥 (Equal rate for every side)

3. *Red dice* -  They have 1 x 🧠,  2 x 👣,  3 x 💥 (The most unfavorable)


## Rules
The players take turns and draw 3 dice and roll them. If the player gets brain or shotgun, he puts these dice aside to keep track of the current score and the accumulated shotguns. If a player gets **3 shotguns** during his turn, he loses all of the points he has earned (during this turn) and does not score anything from this turn. After a player rolls and he doesn't get killed, he may choose to roll again and possibly get more points. He keeps the dice that rolled to steps in the previous turn, if there are any, and draws dice from the die pool so that the dice in his hand add up to 3. *A player should always roll 3 dice.* If he chooses to pass, the next player`s turn begins.

The first to get to **13 points** wins the game.

## Instructions
1. Enter the number of players. They should be between 2 and 8.
2. Enter the name of each player.
4. After the game ends, enter whether you want to play again or not.

