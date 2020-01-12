# mastermind_pair

This is a collaboration between [Robert Suazo](https://github.com/rsuazo) and [Michael Marchand](https://github.com/marchandmd)

We're building a Mastermind Game similar to the one found [here as part of The Odin Project curriculum](https://www.theodinproject.com/courses/ruby-programming/lessons/oop#project-2-mastermind)

## 1/6/2020:
1. created 'lib/' directory
2. moved 'mastermind_pair.rb' into `lib/`
3. initialized 'rspec'
4. updated RSpec configuration to suppress console output during testing
5. reduced `@colors` array to `%w[r o y g b i v]` since the existence of `blue` and `black` created some ambiguity
6. removed `@converted_code` since it's now redundant
7. Added new lines to the `#get_guess` method to provide more instructions to user
8. created `lib/run_this_file.rb` and moved the engine into `run_this_file.rb`
9. built out `#get_guess` validation
10. roughed in a cheap board, by adding `@board`

## 1/7/2020:
1. Added `@feedback` to provide feedback RE each turn
2. Created `spec/mastermind_pair_spec.rb`
3. Wrote failing test for `#output_progress`
4. Wrote passing test for `#output_progress`
5. Changed `#output_progress` to `#update_progress`
6. struggled mightily with the logic to provide hints, LOL
7. pushed a working version of a complete game

## 1/11/2020: 
All this is actually readily apparent in the commit history/PR request..but I'll do one more day to make my actions obvious: 
1. Created `lib/markdown_notes/`
2. added a `Board` class
3. re-factored the `Game` class to leverage the `Board` class
4. created `Board#prompt_player`

