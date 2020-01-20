# second page of notes
I know this is a pair programming project...but I guess what that means is really up to the pair. 

I took the challenge of building a "simplistic" single file program for the Mastermind game, despite already having "built" two versions of the game while also building a Gem. But those other two versions, despite being Gems, weren't designed and weren't built by me. 

they were re-factored by me. They were tested by me. But I hadn't designed how the game would function. 

This pair programming project is more about building while being observed. 

However, in the sake of making progress, the program has taken a turn to being worked on like a "typical" open source project might be worked on; That is, a contributor does what they can (or are capable of contributing) and the public repository is built. 

So with this in mind, I'm pushing forward with the project. 

Where is the project now? 

The game works, but the interface is "muddy". it can be cleaned up. 

so, since that's where I am now...do what I can to the existing codebase...

Ok, so now that I've cleaned up the introduction a little bit...

I want to separate the "introduction" from the actual prompting of the player. 

I also want to add to the `#introduction` method to allow a situation for a player to either: 

1. Get instructions
2. Make the code
3. Break the code

So then I can add that to the introduction, and maybe move the prompt out of the introduction method. 

the prompt would then be part of the "break the code" section...

Alright, I've separated the introduction. Now I need to be able to process the input...

Now, just like that, I'm a lot more pleased with the behavior of the game. Or at least the interface. 

Ok, so now...the idea of "turns".

Currently I'm just displaying to the player how many turns they have left. 

Or, no...that's not what I'm doing. I'm displaying the turn number. 

I don't like that the turn number starts at 1. I feel like it should start a `0`. 

And it's not the "turn" number; it's the `@round`. 

so.....so, by doing that...I "broke" the game. 

The game, after making a guess...now says that it's turn "0"..which is incorrect. 

So then I could either rig something...or I could move the placement of that display. That info. And I think that...currently that info is in the `#get_guess` method. And I don't really want it to be there. So then, I can start by simply removing that line from teh `#get_guess` method. 

Since I may want to use the line somewhere else in the code...I'll comment it out. 

Ok...so that's actually a very important prompt...in terms of the UI. 

so now...the `#get_guess` method is still running to completion. 

Honestly, the easiest fix is to uncomment the line...and then in the `#game_play` method move the line that increments the `@round` instance variable above the call to the `#get_guess` method. 

Wow, that's such an easy fix. Nice. 

Now I can turn my attention to this larger issue I just realized, about the design. 

I want `#game_play` to be less busy. 

I want it to be a serious of other method calls. 

Well, I did a little better there. 

What I think I want to do is make the `Board` class a little more robust. And actually go out of my way to move things into that...

Ok...so it seems like the game was poorly designed to start with. And so creating a new class is a little time consuming. But maybe it won't be that big of an issue. Just start doing it, but think slowly about hwat is happening.

so, I'll try to sort the `Game` instance variables appropriately. 

It doesn't look like the `Game` instance needs to have access to the `@colors` variable except in the `#get_guess` method..but I'm pretyt sure I can simply amend the current reference to `@colors`..(or is it `self.colors`?) with the `Board` instance object. 

So then move this instance variable of `@colors` over to the `Board` object....

Ok, so now I've successfully transferred the `@secret_code` and the `@colors` over to the `Board` class. 

Ok, I reduced the amount of `attr_accessor`s in the `Game` object. and I made some naming changes. 

and the game still works. 

Now I want to look at the feedback or the hints I'm providing. 

so I'm going to work on the `#gather_feedback` method. 

and I wonder if this is a `Board` function, or a `Game` function. I'll leave it for now in the `Game` class. 

I think I want to start the `#gather_feedback` method from scratch...because I feel like the first one is too messy to salvage. But i'll keep it around to help prompt me for ideas...

And so now that I'm building a method...I'm really glad that I have RSpec set up. 

so I'll attempt to build the `#gather_hints` method with RSpec...

I'll write more tests later....for the rest of the program. 

For now, I'm going to just delete tests that don't work, and focus on writing tests that work moving forward, since I seem to be easing into a specific design that is strong, and is working, and isn't shit...

ok...so what am I attempting to do? 

I'm attempting to take an input string from `gets.chomp.downcase`...and use it to create an array of pluses and underscores. 

but I want the plusses to be at the beginning of the array, and then the minuses, and then to be filled with empty strings if neither. 

I mean, I already ahve a way to create an array that has plusses and underscores in it. 

what if I had a way to sort that array the way I want, and then fill with empty strings? 


incredible...`Arr#sort` already does this for me. 

Now I need to make sure I'm doing this on the correct thing, because it won't work if there are empty strings in the array.

Well, since I actually have the `#gather_feedback` method, and it's close to doing what I want it to do..I'm going to start testing that again...

Wow...after completing this...I definitely will swear by testing...at least by unit testing. It totally helped me. Like, beyond a shadow of a doubt. 

Ok. So what's next then? I htink the next bit is testing it in the live game now...ok. Wow so now, this is working flawlessly. 

At least this much of it. And in less than 1100 words in this file! LOL. 

Ok...so now I'm going to, again, attempt to de-couple the `#gather_feedback` from the `#get_guess` method

so since I just said I swear by the RSpec testing...why don't I use RSpec testing to solve this issue? 

First thing I'm going to do is set up a unit test for `#get_guess`

Ok...I got the `#get_guess` method to return a `@guess`...Now I can use that instance variable to pass to `#gather_feedback` I presume...

I have no successfully decoupled `#gather_feedback` from `#get_guess`

so, now...I think I'm a little more pleased with the UI (as much as one can be for a command line game)...though I would like to add color to it. 

But I still have the other mechanisms...such as adding instructions. or adding the ability to Make a code. 

Ok, I like how the game works when I win, and when I lose, and during the game play. 

Ok, so the board class is still sitting there, being less than what it should be. right? 

so, I look through the attribute accessor methods in the `Game` object...and I identify those that I htink would be better sutie  to the `Board` class. And I choose: 

1. `@guesses` 
2. `@feedback`

Because those are things taht are happening on the board. 