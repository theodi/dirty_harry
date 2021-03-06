[![Build Status](http://img.shields.io/travis/theodi/dirty_harry.svg)](https://travis-ci.org/theodi/dirty_harry)
[![Dependency Status](http://img.shields.io/gemnasium/theodi/dirty_harry.svg)](https://gemnasium.com/theodi/dirty_harry)
[![Coverage Status](http://img.shields.io/coveralls/theodi/dirty_harry.svg)](https://coveralls.io/r/theodi/dirty_harry)
[![Code Climate](http://img.shields.io/codeclimate/github/theodi/dirty_harry.svg)](https://codeclimate.com/github/theodi/dirty_harry)
[![Gem Version](http://img.shields.io/gem/v/dirty_harry.svg)](https://rubygems.org/gems/dirty_harry)
[![License](http://img.shields.io/:license-mit-blue.svg)](http://theodi.mit-license.org)
[![Badges](http://img.shields.io/:badges-7/7-ff6799.svg)](https://github.com/badges/badgerbadgerbadger)

# DirtyHarry

> I know what you’re thinking: 'Did he fire six shots or only five?' Well, to tell you the truth, in all this excitement, I’ve kinda lost track myself. But being this is a .44 Magnum, the most powerful handgun in the world, and would blow your head clean off, you’ve got to ask yourself one question: 'Do I feel lucky?' Well, do ya, punk?

A quick and dirty wrapper around the http://csvlint.io [Webservice](https://github.com/theodi/csvlint/wiki/Webservice).

So called because CSVlint -> Clint -> Clint Eastwood -> Dirty Harry. Also, it's quick and dirty. And also NAMING THINGS IS HARD OK?

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'dirty_harry'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dirty_harry

## Usage

    validation = DirtyHarry::Validation.new(URL_TO_YOUR_CSV)
    validation.url #=> http://csvlint.io/validations/53566ef96373767abf010000
    validation.source #=> URL_TO_YOUR_CSV
    validation.state #=> One of 'valid', 'invalid' or 'warnings'
    validation.badge #=> http://csvlint.io/validations/53566ef96373767abf010000.svg

## Contributing

1. Fork it ( https://github.com/[my-github-username]/dirty_harry/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
