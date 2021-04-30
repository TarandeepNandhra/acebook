# AceBook

## Task

For this project we worked in teams to produce a social media platform using rails and react-native.
This repository contains the backend rails API, we created the frontend in react-native [here](https://github.com/Yates101/Insert-Team-Name-react-native).

## Implementation

We followed TDD principles when creating the routes and controllers in the API, using the following gems:
- Rspec
- Factory_bot_rails
- Shoulda-matchers
- Faker
- Database_cleaner

We achieved 99% coverage with our tests.

## Instructions
The API is hosted on Heroku, see the next section for the routes and how to interact with the API.
If you would like to run the API locally, follow these instructions:
- Clone the repository
- Run the following commands in the root directory to setup and seed the database
```bash
bundle install
npm i
rails db:create db:migrate db:seed
```
- To check tests, run `rspec` in the root directory
- To run the server, run `rails s` and the server will start at `http://localhost:3000/`
- Check db/seeds.rb for data preloaded on the database.

## API routes

| Endpoint        | Functionality            | Deployed         |
| ----------------| -------------------------|------------------|
| User_Controller |
| POST /users     | Create new user          |:heavy_check_mark:|
| GET /users      | Returns all users        |:heavy_check_mark:|
| GET /users/:id  | Return the user of :id   |:heavy_check_mark:|
| Sessions_Controller |
| POST /login     | Create new session       |:heavy_check_mark:|
| POST /logout    | Destroys the session     |:heavy_check_mark:|
| GET /logged_in  | Check session status     |:heavy_check_mark:|
| Posts_Controller |
| POST /posts     | Create new post          |:heavy_check_mark:|
| GET /posts      | Returns all posts        |:heavy_check_mark:|
| GET /posts/:id  | Return the post of :id   |:heavy_check_mark:|
| Likes_Controller |
| POST /likes     | Create new like          |:heavy_check_mark:|
| GET /likes      | Return all likes         |:heavy_check_mark:|
| GET /likes/:id  | Return the like of :id   |:heavy_check_mark:|
| GET /likes/post_id/:id| Return all likes for post of :id   |:heavy_check_mark:|
| DELETE /likes/:id  | Destroys like of  :id |:heavy_check_mark:|

- The API is hosted at https://acebook--backend.herokuapp.com
- To make an API request, append the endpoint to the link above

## Knowledge Sharing
We created guides to knowledge share within the team:
- [Testing README](https://github.com/taran314/acebook-insert-team-name-here/blob/main/testing.md)
- [API-setup README](https://github.com/taran314/acebook-insert-team-name-here/blob/main/api-setup.md)
