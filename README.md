# OmniAuth FoodLogiQ

This is the official OmniAuth strategy for authenticating to FoodLogiQ. To
use it, you'll need to sign up for an OAuth2 Application ID and Secret
on the [FoodLogiQ Applications Page](https://www.foodlogiq.com).

## Basic Usage

    use OmniAuth::Builder do
      provider :foodlogiq, ENV['FOODLOGIQ_KEY'], ENV['FOODLOGIQ_SECRET']
    end


## License

TODO: Include more information here about the license.