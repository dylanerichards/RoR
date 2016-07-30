---
title:  "Project Euler Series: Problem 1"
author: "Dylan Richards"
date:   2016-07-28
description: Let's solve Problem 1 together.
---

Solving the problems on Projet Euler is a great way to dive into programming. In this post, I'd like to
solve Problem 1, while covering some Ruby language fundamentals. We'll look at three different approaches to
solving the same problem.

Let's get started.

<pre>
  If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

  Find the sum of all the multiples of 3 or 5 below 1000.
</pre>

# Iteration 1

The first thing we'll need is a collection of numbers from 1 to 999.

<pre>
  <code class="ruby">
    numbers = (1..999).to_a # => [1, 2, 3, 4, ..., ..., 999]
  </code>
</pre>

Next, we'll need somewhere to put the numbers that are multiples of 3 of 5.

<pre>
  <code class="ruby">
    multiples = [] # => An empty array to push the multiples into
  </code>
</pre>


Here's the fun part. Let's use an each loop to iterate over each of those numbers.

<pre>
  <code class="ruby">
    numbers.each do |number|
    end
  </code>
</pre>

Every time we encounter a number that's a multiple of either 3 or 5, we need to push it
into the multiples array. Put the following into the block:

<pre>
  <code class="ruby">
    if number % 3 == 0 || number % 5 == 0
      multiples << number # => Push the number into the multiples array if it's evenly divisible by 3 or 5
    end
  </code>
</pre>

You should now have this:

<pre>
  <code class="ruby">
    numbers = (1..999).to_a
    multiples = []

    numbers.each do |number|
      if number % 3 == 0 || number % 5 == 0
        multiples << number
      end
    end
  </code>
</pre>


Now we just need to add them up.

<pre>
  <code class="ruby">
    p multiples.reduce(0) { |sum, i| sum + i } # => 233168
  </code>
</pre>

Done.

We can do better, though. Whenever you find yourself creating an empty array,
 putting items into it, then finally returning it, there may be an opportunity to use <b>Array#map</b>.
<b>#map</b> creates a new array containing the values returned by the block. Check it out:

# Iteration 2

<pre>
  <code class="ruby">
    numbers = (1..999).to_a.map { |num| num if num % 3 == 0 || num % 5 == 0 }
  </code>
</pre>

The code above takes the array of numbers 1-999 and creates a new array of elements that
match the condition in the block. In this case, it will be numbers that are evenly divisible
by 3 or 5.

Let's sum them up.

<pre>
  <code class="ruby">
    numbers.reduce(&:+)
  </code>
</pre>

Wait -- What's this?

<pre>
  <code class="ruby">
    euler-1.rb:5:in each: undefined method '+' for nil:NilClass (NoMethodError)
    from euler-1.rb:5:in reduce
    from euler-1.rb:5:in main
  </code>
</pre>

This error is telling us that the addition method isn't available on an element in
our array, which happens to be nil. Why are there nil elements in the array? Simple.
Our <strong>map</strong> returned nil for each element that didn't match the condition.

Before we can sum the array, we must first remove the nil elements with <strong>Array#compact</strong>.

<pre>
  <code class="ruby">
    numbers.compact.reduce(&:+) #=> 233168
  </code>
</pre>

And there you have it.

# Iteration 3

We can still do <i>a little bit better</i>, though. <strong>Array#select</strong> allows us to, well,
<i>select</i> elements in an array that match a condition. It won't return nil for elements that don't
match, which will save us from having to remove nil elements from the array before adding them up.

<pre>
  <code class="ruby">
    p (1..999).select { |num| num % 3 == 0 || num % 5 == 0 }.reduce(:+) #=> 233168
  </code>
</pre>

And that's it.
