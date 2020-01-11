# Some notes
####Starting on 1/11/20
So, currently there's a "version" of the game waiting to be merged by Robert. My guess is the merges aren't happening because he has some questions about the process he'd like to ask. 

So i'm going to continue to make some changes, to simulate a real-life situation when changes are made and or a complicated PR history is developed which introduces new problems and challenges to combining a project. 

Currently the game does a number of things. But it also doesn't do a number of things. For instance: 

1. The instructions are pretty "lean"
2. The board is a little confusing to understand (meaning it displays top to bottom, when the instinct in game play for my experience is bottom to top)
3. There is no option to "make" the code

Furthermore, there are some more "complex" ideas to consider about the program in general. Such as design ideas. Right now, I'm pretty sure...yeah, I'm only using a single class. When the game just "feels" to me to be a thing that has different objects in it. For instance: a board is an object that can exist as a separate entity. 

And maybe the Computer would be something different that could exist? I mean, after the secret code is made (as part of the Board object), the computer would go about attempting to solve it. In that context, the computer would need to be able to `#guess`. 

It seems my focus is gravitating towards the creation of additional classes...so i'm curious about encapsulating some of the existing code into a separate `Board` class....and then ensuring that an instance of that `Board` class exists within the instance of the `Game` class. 

Ok, I think I'm ready to look at code now....