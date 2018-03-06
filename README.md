# Freevents

This project is an application to handle event organization, speakers, attendees, etc.

## Requirements

* Ruby 2.4.1
* PostgreSQL 9.x or 10
  * For Debian you will need `libpq-dev` in order to be able to install `pg` gem
  ```bash
  apt install libpq-dev
  ```

## Installation

Clone the repo

```bash
git clone http://github.com/tsolar/freevents.git
cd freevents
```

Install gems

``` bash
bundle install
```

Create PostgreSQL user and database

``` bash
sudo -u postgres createuser $USER -s
rails db:create
```

Run migrations

``` bash
rails db:migrate
```

Run server

``` bash
rails s
```
