use Mix.Config

config :random_user, timeout: 30_000
config :random_user, one_random_user_api_url: 'https://randomuser.me/api/'
config :random_user, multiple_random_user_api_url: 'http://api.randomuser.me/?results='
