# Book Theme Notes

## About This Project

Book Theme Notes is a command line app for keeping track of the books I read and the themes I notice in them. 

I can add a book (title, author, genre, a short summary, and how many pages it has). Then I can add theme notes to that book, basically little notes about a theme I noticed and what page it happened on.

### Models

- Book, has many theme notes. Has a title, author, genre, plot summary, and page count.
- ThemeNote, belongs to a book. Has a theme name, a description, and a page number.

One book can have a bunch of theme notes attached to it, since most books have more than one theme going on.

### Features

- Add a new book
- Add a theme note to a book
- List all the books
- Look at one book and see all its theme notes
- Update a book or a theme note
- Delete a book (this deletes its theme notes too) or just delete one theme note

### Validations

- Book needs a title, and page count has to be a number greater than 0
- ThemeNote needs a theme name, and page number has to be a number greater than 0.
- Also, the page number on a theme note can't be higher than the book's page count. Otherwise you could log a theme on page 300 of a book that's only 250 pages.

---

## Setup

Install dependencies:

```
bundle install
```

Create and migrate the database:

```
bundle exec rake db:create
bundle exec rake db:migrate
```

Optionally seed the database with starter data:

```
bundle exec rake seed
```

## Running the App

```
ruby cli/main.rb
```