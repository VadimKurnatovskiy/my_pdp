# My pdp

It's an simple blog for pdp.

## Use cases

Необходимо реализовать приложение со следующими User Stories
Visitor can sign up.
Visitor can sign in.
Visitor can recover his/her password.
Visitor can observe articles on main page of project (paginated and sorted by recent).
Visitor can send Feedback via Contact form.
Visitor can view About Us page.
User can sign out.
User can upload profile picture.
User can create an article with necessary fields: Title, Text.
User can leave comments to articles with single Text field.
User can edit article created by this user.
User can get email notification via subscription
User can leave a rating(1..5) of articles
Admin can edit/archived articles and comments
User can search article by name & text

Особенности реализации
Применить coffeescript
Данные из seed
Поиск через ransack
Применить StrongParams, Simple Form, I18n
Покрыть код тестами

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
