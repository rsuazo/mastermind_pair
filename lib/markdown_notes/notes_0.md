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

Ok, so I've begun to create this file that has two separate objects in it. But what I need is...I need for the `Board` object to be able to access the `Game` object.   

Specifically I need the `Board` object to access the `Game.secret_code` instance variable. 

So then, I know that....I need to pass the instantiated `Game` object to the `Board` object in the creation of the `Board` object. 

But then, why would I want to pass the `Board` object the `Game` object...just so the `Board` object can go and look at the `Game.secret_code` object...from within the `Game` object? That seems silly. 

And that's because it is silly. 

But I feel that I may be onto something with the "passing of the Game object to the Board" object. I mean, I can pass the object into the `Board` object fairly easily. 

Well, my brain does a couple things here. The first option was to....to be honest, I don't even remember what the first idea was, because as soon as I knew what the right option was, it immediately took the place of all other ideas. 

Since I'm attempting to access the `Game@secret_code` instance variable as part of some string interpolation in a `Board` object....perhaps I should be moving the `@secret_code` over to the actual and entire `Board` class...away from the `Game` class. 

Now when I suggest this, to me as a program designer/architect, this "feels" right. Maybe this is what's meant by "code smell"? Like, when I begin to think about a `Board` object in terms of a game being played....would I/could I argue that the `@secret_code` should "belong" to the `Board` or the `Game`? 

And this triggers a discussion about the quality, state and behavior of specific classes, which seems to be subjective. 

So arguments could be made for or against moving the `@secret_code` to the `Board` object. 

However, for the sake of learning, I'm not going to do that. 

Instead, what I'm going to do is: Instantiate the `Board` class with a `Game` class object being passed to it. 

Wait a minute...I have no idea how that would work. I feel like I get into a situation of recursivity that my brain just can't wrap itself around. 

So then, here's what I'll do: 

1. Remove the problematic string interpolation, which will separate the issue
2. Re-factor the game engine/`#play_round` method to reference both the `Board` class method of `#game_over_reveal` and `Game#secret_code` separately

do that now..

Ok, that's been done. But hwat else do I want to do now? 

Well, I want to re-factor some other methods in the program. And since I now have a working `Board` class, I think I want to look for other ways to move things out of existing `Game` methods, and into the `Board` class.

I want to do this specifically for the purpose of using the `Board` class...

So browse the current methods of the `Game` class. How many `Game` class methods are there? 

1. `#get_guess`
2. `#update_progress`
3. `#play_round`

That's pretty lean. So these few methods are actually doing a lot of the "heavy lifting" of the entire program. 

I'd be willing to bet that there's some "bloat" within those three methods. 

By "bloat" I mean, stuff we could cull (re-factor) from the methods into separate methods. 

I think back to the experience I just had with `Board#game_over_reveal`...and I see that there was an issue when I attempted to move a simple `puts` statement into it's own method. And that issue came from string interpolation referencing a different object. 

Is there any method that contains excessive amounts of `puts` statements that are free of string interpolation...or references to other objects? 

Look for that now...

In the `#get_guess` method, the first three lines are in fact simple `puts` calls...

Why not try to move that to a separate method? 

Do that now..

Pretty easy. 

But then, since I did that...I'd need to find a way to display the same information at the same time as when it was being called before I made the new method. 

Well...how did it work before? 

It worked that every time the `#get_guess` method was called, the method would start by printing three lines to `puts`. 

And the `#get_guess` method was being called by the `#play_round` method. So then I need to go into the `#play_round` method, and make a call to the `Board#prompt_player` method...since that's where I've moved those three `puts` to...

## But whyeeee?
Ok, that's a valid question. 

**Why move `puts` of three different lines from `Game#get_guess` to `Board#player_prompt`?**

And again, this is more of a design issue/consideration. 

It's one thing to grab any ol' piece of silverware, plunge it into the peanut butter and jelly, and randomly slap all sides/edges/areas of a piece of bread, making a giant sloppy mess with peanut butter and jelly all over the place getting all over your hands....

It's something entirely different when you use a good knife, expertly spread the peanut butter appropriately on one side of bread, do the same with jelly, and combine the two to make a convient, expertly made sandwich. 

Programmings not that different, is it?

And look at the `#get_guess` method; It's now becoming more "streamlined". 

Methods in Ruby, they say...and I think in most languages...are intended to do one thing, or very few things. By reducing the clutter of unnecessary `puts` calls, the `#get_guess` method is becoming cleaner. More succinct. More to the point. More...Ruby-like. 

## Re-factoring, but not moving anything
Moving on...looking at the `#update_progress` method...the method looks fairly svelte. 

No `puts` calls.

But it still could be re-factored. 

There's a very basic `if/else` expression. How could this be re-factored to the most minimal amount of code? What's another way this could be written?