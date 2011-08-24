say_puts = lambda { |m| puts("\a#{m}"); system('say',m) }
say_puts["Geentlemen."]
say_puts["All versions of Ruby-Gems are vulnerable to persistent code injection via the gem specs that are re-generated when you install a Gem."]
