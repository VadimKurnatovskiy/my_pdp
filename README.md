# My pdp

It's an simple blog for pdp.

## Scripts

* `bin/setup` - setup required gems and migrate db if needed
* `bin/quality` - runs rubocop, brakeman, rails_best_practices and bundle-audit for the app
* `bin/ci` - should be used in the CI or locally
* `bin/server` - to run server locally

## Quick Start

```bash
# configure ENV variables in .env
vim .env

bin/setup
bin/ci
bin/server
```

## Test users

  - User: "user@example.com / 123456"

## Mailers

  http://localhost:5000/rails/mailers
