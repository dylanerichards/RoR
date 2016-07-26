---
post_author: Geoff Blair
layout: post
title:  "Welcome to the Ruby on Richards Blog"
date:   2016-07-27
categories: ruby on richards blog launch programming test
---
Hello world. `code`

{% highlight ruby %}

class Person
  def initialize(arguments)
    @name = arguments.fetch(:name, "Null User")
  end

  def greet(name)
    "Hey, #{name}!"
  end
end

person = Person.new({name: "Dylan"})
puts person.greet #=> "Hey, Dylan!"

{% endhighlight %}
