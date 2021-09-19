# Bookmark Manager

### **A web app that stores web bookmarks in a database.**

---

## User Stories and Domian Models

```
As a user,
In order to see my bookmarks stored on the database
I want to show a list of bookmarks
```

> Nouns: bookmarks

> Verbs: show list of bookmarks

User Story 1:
![Domain Model of User Story 1][us_1]

[us_1]: ./resources/images/user_story_1.jpg "User Story 1"

```
As a user,
In order to keep my bookmarks current
I want to add bookmarks
```

> Nouns: bookmarks

> Verbs: add bookmarks

User Story 1:
![Domain Model of User Story 2][us_2]

[us_2]: ./resources/images/user_story_2.jpg "User Story 1"

---

## Database set-up

1. Connect to `psql`
2. Create the database using the command `CREATE DATABASE bookmark_manager;`
3. Connect to the database using the commande `\c bookmark_manager;`
4. Run the query saved in the file `/db/migrations/1_create_bookmarks_table.sql`

## Test database set-up

1. Connect to `psql`
2. Create the database using the command `CREATE DATABASE bookmark_manager_test;`
3. Connect to the database using the commande `\c bookmark_manager_test;`
4. Run the query saved in the file `/db/migrations/1_create_bookmarks_table.sql`

## Using the test database

1. In the `bookmarks.rb` file use a conditional `ENV['RACK_ENV'] == 'test'` to change the connection being made so that when `rspec` is running it connects to the `bookmarks_manager_test` database.
