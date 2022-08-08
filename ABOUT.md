<h1 align="center">Kelisto Backend Ruby Challenge</h1>
<div align="center">
  <div>
    <a style="margin-right: 8px;" href="https://github.com/kelkoo-services/kelisto-backend-ruby-challenge/pulls"><img src="https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square" /></a>
  </div>
  </br>
</div>


## ✨  About the solution

The complete solution has been developed in script code without using frameworks as specified.

The only gems used are: bundler, rspec, io-console, and terminal-table. The last two gems weren't necessary to fix the problem but I've found it more fun to make it more interactive.

To run the application in an easier way, I have decided to dockerize the application.

And as a bonus I have added the tests that I have seen necessary to test the app.

## Deploy and Launch with Terminal

```
IMPORTANT NOTE: You need bundler to deploy this project
```

I use Ruby 3.1.2 but I think with Ruby <2 is enough. Remember to change the Gemfile (line 3) to set your version of ruby.

Clone from github repo, go into kelisto-backend-ruby-challenge/src and execute bundle. 

```
> git clone https://github.com/Hangman2arb/kelisto-backend-ruby-challenge.git
> cd kelisto-backend-ruby-challenge/src
> bundle install
```

Being in the root of the project (kelisto-backend-ruby-challenge/src) run app.rb

```
> ruby app.rb
```

## Deploy and Launch with Docker

Download the image from the repository

```
> docker pull hangman2/kelisto-backend-ruby-challenge
```

Run the image previously downloaded

```
> docker run --rm -it hangman2/kelisto-backend-ruby-challenge:latest
```

## Usage of the app

When you launch the application, a message appears telling you what to do:

```
Hi! Welcome to Kelisto Market
To insert products in the basket, type the product code and press enter.

+--------------------------------------+
|               PRODUCTS               |
+--------------+--------------+--------+
| Product Code | Name         | Price  |
+--------------+--------------+--------+
| GR1          | Green tea    | £3.11  |
| SR1          | Strawberries | £5.00  |
| CF1          | Coffee       | £11.23 |
+--------------+--------------+--------+

When you finish your purchase, type Checkout and press enter
```
Simply enter the product code you want add to the basket and press enter (case sensitive). Once you're satisfied, type "checkout" and hit enter (case insensitive)

![Showcase](./showcase.gif)

## Running Tests

All tests have been developed using the rspec gem. Therefore, to launch the entire battery of tests, use the rspec command

```
> rspec
```