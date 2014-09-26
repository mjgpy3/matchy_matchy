matchy_matchy
=============

[![Build Status](https://travis-ci.org/mjgpy3/matchy_matchy.svg?branch=master)](https://travis-ci.org/mjgpy3/matchy_matchy)

A basic pattern-matching library for ruby.


## Example usage:
```
MatchyMatchy.match([i%3 == 0, i%5 == 0]) do |on|
  on.value([true, true]) { 'FizzBuzz' }
  on.value([true, false]) { 'Fizz' }
  on.value([false, true]) { 'Buzz' }
  on.anything { value.to_s }
end
```

You can also perform matches on the _kind_ of something:
```
MatchyMatchy.match(maybe_numeric) do |on|
  on.value(42) { :the_answer }
  on.kind(String) { 'A string! Really?' }
  on.kind(Fixnum) { :maybe_another_answer }
  on.anything { fail 'Whoa there!' }
end
```
