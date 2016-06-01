# README
This is a really basic JRUBY GUI Toy Robot Simulator.

## Running this App
This app must be run with JRUBY. A `.ruby-version` file is included for rbenv and rvm users.

To run this app:

1. [Download and install Shoes](http://shoesrb.com/downloads/) for your Platform.
2. Clone this repo and `cd` into it.
3. Ensure you are using JRUBY.
  * You can check this by running `ruby -v` which should return something like `jruby 9.0.4.0 (2.2.2) 2015-11-12 b9fb7aa Java HotSpot(TM) 64-Bit Server VM 25.74-b02 on 1.8.0_74-b02 +jit [darwin-x86_64]`
4. Install the bundler gem `gem install bundler`
5. Install the relevant gems. `bundle install`
6. Run the included shell script to start the app `./run.sh`\*

<sub>\* You can also run `shoes app.rb` from the app directory on non unix systems</sub>

## Running Specs
The bundle process will install rspec. Once this has been done, you can run the included specs.

`rspec spec`

## Development Notes

I've tested this app on a Mac OSX 10.11 System. Whilst the tools are all cross-platform, I cannot guarantee at this point in time that the software will run perfectly on other OSs at this time.

## Credits

Written by [Jake Schoermer](mailto:hello@jakeschoermer.me).
