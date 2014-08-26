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
