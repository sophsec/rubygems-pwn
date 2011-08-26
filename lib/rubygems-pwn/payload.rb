beep = lambda { |m| puts "\a#{m}" }
say_puts = lambda { |m| beep[m]; system('say',m) }
say_puts["Geentlemen."]
say_puts["All versions of Ruby-Gems are vulnerable to persistent code injection via the gem specs that are re-generated when you install a Gem."]

beep["* https://github.com/rubygems/rubygems/pull/165"]
