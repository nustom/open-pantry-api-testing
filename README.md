# README
## Notes for some gems I used
+ `devise` and `devise-jwt` for authentication
+ `pg_search` for doing full-text search in Postgres
+ `figaro` for storing environment variables
+ `active_model_serializers` for serializing object to JSON

## Other notes

* Configuration

    - Create `config/application.yml` from `config/application.yml.example`

* Database creation

    - Create `config/database.yml` from `config/database.yml.example` then run `rails db:setup`

* Testing
    - I wrote some rspec tests for those API
    - Run command `rspec` to start

* API testing

    - Some api endpoints require user to login. Make sure you send request to login endpoint and get JWT token from response header and use this jwt token to authenticate next requests.
