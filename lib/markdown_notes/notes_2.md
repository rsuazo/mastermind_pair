# notes_2.md

So, if I were to selecct something besides break the code...the program would eventually enter into an infinity loop, because it's only set to work with breaking the code. 

there needs to be a separate game flow if the user decides to `#make_the_code`. 

And what would thator could that flow be? 

Well, the place to start I guess would be to look at the existing game flow and see how this would deviate from that. 

So I'll take a look at it. 

1. `#introduction`
2. The `@game_flow` is then set; So I could make a distinction at this point, based on the value of the `@game_flow` instance variable. 
3. if the user types `b`...then the while loop is entered
4. the turn is incremented
5. `#get_guess` is run
6. `#gather_feedback` is run
7. `#display_board`
8. a winning scenario is evaluated to break out of the loop early
9. if the scenario is a win, the message "YOU WIN" is returned
10. the game is over, the answer is revealed. 

