say_puts = lambda { |m| puts("\a#{m}"); system('say',m) }
say_puts["Geeeentle-men"]
say_puts["All versions of Ruby-Gems are vulnerable"]
say_puts["to persistent code injection"]
say_puts["via the gem specs that are re-generated when you install a Gem"]
