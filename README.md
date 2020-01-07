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



