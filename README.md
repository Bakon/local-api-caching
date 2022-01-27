# Caches api requests locally

This script was originally made to cache API requests to [PokéAPI](https://pokeapi.co/), to strain their servers just a tiny bit less.

There are 2 constants in the `index.rb` file, `POKE_API_URL` and `LOCAL_API_URL`.

Make sure to change the `LOCAL_API_URL` to the port you're using, in theory you could change the `POKE_API_URL` to whatever URL you want and it'll cache those requests in memory.

## Usage

Start by installing the gems

`bundle install`

You can then run the script

`ruby index.rb`

Now that you're done, you can make API calls to your `LOCAL_API_URL` constant.

This will now serve the JSON, instead of always fetching directly from the `POKE_API_URL`.
