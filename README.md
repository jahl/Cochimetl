# Cochimetl
[![Gem Version](https://badge.fury.io/rb/Cochimetl.svg)](https://badge.fury.io/rb/Cochimetl)
[![Maintainability](https://api.codeclimate.com/v1/badges/d97adf18f2090bf80704/maintainability)](https://codeclimate.com/github/JahlHernandez/Cochimetl/maintainability)

A simple Ruby gem to deal with the nightmare that is Banxico


## Installation

Add this line to your app's Gemfile:

```ruby
gem 'Cochimetl'
```

Then you can just run:

```ruby
$ bundle
```

Or install it yourself with:

```
gem install Cochimetl
```

## Usage

I tried to keep it simple, for example, to make a new currency object in pesos just use:
```ruby
Cochimetl.new(1, :mxn)
```

You can do any basic arithmetic with your currency object:
```ruby
currency = Cochimetl.new(1, :mxn)
currency * 2 # currency.value * 2
currency + 1 # currency.value + 1
currency.value # 3
```

Oh, you can also exchange the value to any of the supported currencies:
```ruby
currency.to(:usd)
```

In case you need a refresher on which currencies are supported, you can easily check with:
```ruby
Cochimetl.currencies
```
That pretty much covers it!

## Contributing

1. [Create a fork.](https://github.com/JahlHernandez/Cochimetl/fork)
2. Make your own feature branch like this: `git checkoyt -b feature/my-cool-feature`
3. Make sure to add some nice specs to your work!
4. Commit your changes `git commit -am "Add some cool changes"`
5. Push the branch like this `git push origin feature/my-cool-feature`
6. You can create a pull request to this repo!

___
Made with :heart:
