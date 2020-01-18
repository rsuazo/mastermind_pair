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