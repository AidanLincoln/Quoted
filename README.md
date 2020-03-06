Quoted
===============

Quoted is a website for browsing, creating, or storing your favorite quotes.

- Made with Ruby on Rails

---

## A User Can:

### Home page:

- See a random quote

### Search:

- Search through a database of quotes / authors
- View all quotes by a certain author
- View pages for individual quotes

### Account:

- Create a new account
- Sign in, sign out, or edit account
- See quotes authored by your username
- Edit quotes authored by your username

### Add a New Quote (only if logged in):

- Add quote by any author to the database (including yourself)

### User's Favorite Quotes (only if logged in):

- Store a favorite quote 
- Remove a favorite quote

## Installation

### OS X:

- Download or clone the repository
- Navigate to the repository using `cd`
- Type `bundle install` in the terminal
- Type `rails db:migrate` in the terminal
- Type `rails db:seed` in the terminal

## Using the website

- To boot up the website, type `rails s` in your terminal
- On your browser, type `localhost:3000` (or replace '3000' with whatever port you started the server with)

### Navigation bar

- 'Q' in the top left is the home page button
- Next to the home button, there is a search bar for looking up quotes or authors.
- Create an account if you want access to the `Favorite Quotes` and `Add new Quotes` features
- Account features on the right side of the navigation bar

## API
STANDS4 Web Services:
Quotes API

https://www.quotes.net/quotes_api.php

## License

(https://www.mit.edu/~amini/LICENSE.md)