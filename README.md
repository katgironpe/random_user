# RandomUser [![Build Status](https://travis-ci.org/katgironpe/random_user.svg?branch=master)](https://travis-ci.org/katgironpe/random_user) [![Coverage Status](https://coveralls.io/repos/github/katgironpe/random_user/badge.svg?branch=master)](https://coveralls.io/github/katgironpe/random_user?branch=master) [![Deps Status](https://beta.hexfaktor.org/badge/all/github/katgironpe/random_user.svg)](https://beta.hexfaktor.org/github/katgironpe/random_user)

## Features

- [x] Return one random user
- [x] Return multiple random users
- [x] Seeds (always returns Becky Sims)
- [x] Choose gender, nationality and other options
- [x] Format results

## Installation

This package is [available in Hex](https://hex.pm/docs/publish) and can be installed as:

  1. Add `random_user` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:random_user, "~> 0.3.0"}]
    end
    ```

  2. Ensure `random_user` is started before your application:

    ```elixir
    def application do
      [applications: [:random_user]]
    end
    ```

## Usage

### One Random User

```elixir
# Returns one random user
RandomUser.Random.one

# Returns a random female user
RandomUser.Random.one(%{ gender: "female" })

# Returns a random British female user
RandomUser.Random.one(%{ gender: "female", nat: "gb" })
```

### Multiple Random Users

```elixir
# Returns 50 users
RandomUser.Random.multiple(50)

# Returns 50 female users
RandomUser.Random.multiple(50, %{ gender: "female" })

# Returns 50 female users from AU and NZ
RandomUser.Random.multiple(50, %{ gender: "female", nat: "au,nz" })
```

### Get results easily with Parser

For one random user:

```elixir
res = RandomUser.Random.one |> RandomUser.Parser.results |> RandomUser.Parser.parse
res.gender
res.picture["large"]
```


For multiple random users:

```elixir
users = RandomUser.Random.multiple(2) |> RandomUser.Parser.results
Enum.map(users, fn u ->
  user = u |> RandomUser.Parser.parse
  large_pic = user.picture["large"]
end)
```
