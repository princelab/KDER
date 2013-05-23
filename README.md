#Kder: Your one stop shop for KDEs in Ruby#

Here, we have a standalone client for Kernel Density Estimation in Ruby. This calculates a KDE ([x,y] points) from a given source array in Ruby, complete with a bandwidth estimation.  For me, this comes in handy for pre-generating a KDE for later interactive JS plotting on the client side of my data analysis server.  


## Examples ##

```ruby
require 'kder'
Kder.kde [1,2,3] # it will discover its own estimate of the bandwidth

Kder.kde(1e5.to_i.times.map { rand(100) }, 3) #specifying my own bandwidth

```
