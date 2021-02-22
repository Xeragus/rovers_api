# rovers_api

CLI app written in Ruby. It fetches data from the Nasa's `Mars Rover Images API`. Requests are customizable through command line arguments.

## Techs

Although no framework is used, the following gems are installed: `httparty`, `dotenv`, `optparse`, `redis`, and `byebug`, `rspec` in the `dev/test` environment.

## Dependencies

You need at least `Ruby 2.6.3` to run this app. Once you have that installed, run `bundle install` in the root directory - this will install all dependencies.

## API key

Please add your NASA API key to the `.env.template` file, and rename the file to `.env`.

## Run

Once you install the dependencies and add the API key, run `ruby app.rb -h` to get more information on the command line arguments. Possible options are:
* `-h, --help: Prints help`
* `-r, --rover=ROVER: Get photos taken only by this rover`
* `-c, --camera=CAMERA: Get photos taken only with this camera`
* `-d, --earth_date=DATE: Get photos taken only on this date`

For more information on the possible values for this options, please take a look at the `Rover Images API`\`s [docs](https://api.nasa.gov/).

## Cache

The app uses `Redis` for caching. It assumes that Redis is running on port `6379`. Please note that caching will work only by `earth dates`, no matter the rover or camera. Meaning, the keys are `earth dates` and there is no information about the rover and the camera. This can be improved with simple `date-rover-camera-to-key` bidirectional translation, but that is out of scope for this showcase.

## Examples

* `ruby app.rb -r curiosity` will return only images taken by Curiosity
* `ruby app.rb -r curiosity -c fhaz` will return images taken by Curiosity's FHAZ camera
* `ruby app.rb -r navcam -d 2020-05-07` will return images taken by a NAVCAM camera for 2020-05-07 and the previous 9 days
