## Introduction

First of all, thank you for letting me make this Challenge, which i really enjoied a lot, it made me learn some Ruby, because previously i have never made any project with it. Also practice more on Docker that i was very rusty lately.

I take this challenge without any pattern in specific, i just dockerized the app and passed it arguments through the console to increase commodity in user exprience.

## Structure

In structure terms, i divided the app in 4 areas:
- **Models**
    - **Checkout.rb** => Here i stored the classes where i'm going to make the calc on data, and also return a hash with all the info we need.
- **Data**
    - **pricing_rules.json** => This folder contains the JSON with Items described on the exercise, and their attributes.

        - Structure used in JSON
            ```json
            [
                {
                    "ItemCode" : "EXAMPLECODE",
                    "Name" : "EXAMPLE NAME",
                    "Price" : "3.11",
                    "EspecialRule" : null
                }
            ]
            ```
- **Tests/Unit**
    - **CheckoutTest.rb** => This file contains Unit tests. The structure is fine for the time being, but in the future, the better option to keep improving our app probably would be make End to End tests, becouse they are the most important in therms of stability and scalability of the app.

- **main.rb** => Here's where i attach all the classes and return a result.

## Test data

There are 2 ways to test the data:
 1. **Using Docker**
    1. Install **docker** if you don't have it.
    2. Go to root path in the project, where you can find the **main.rb** file.
        1. Open a command line and type: 
            1. `docker build -t AlejandroGarridoApp .`
            2. `docker run AlejandroGarridoApp ` and then give it some arguments! like this => `docker run AlejandroGarridoApp GR1,GR1,SR1,CF1,SR1,SR1.SR1`, remember that when you pass arguments you must do it as the example **separated in commas and without spaces**.

2. **Using ruby via command line**
    1. Install **ruby** if you don't have it.
    2. Go to root path in the project, where you can find the **main.rb** file.
        1. Open a command line and type:
            1. `ruby main.rb "GR1,GR1,SR1,CF1,SR1,SR1.SR1"`as mentioned before, you must pass the arguments **separated in commas and without spaces**, in this option, i truly recommend capture the args in double quotes.
            2. If you want to try Unit tests, in the actual directory, you should use this command `ruby Tests/Unit/CheckoutTest.rb`


The result when you test the app should be something like this:
```
Basket: GR1,SR1,GR1,GR1,CF1
Total price expected: £22.45
```

## Scalability

In the future, i would like to resume this project and add some features that almost any should have. 
- First of all, **ENV** variables making deployments in Pre easy, clients, etc.
- **Dependencies injection**, making the app more robust and secure, and above all, scalable and easy understand.
- Change from pure **Ruby** to **Ruby on Rails** to render views in decent ways and also the uses of facades wich are very useful.
- Add a Database, it depends on the necesity of the app, but probably some files in XML or continuing on JSON instead of SQL.

## The End
And that's all folks! Thanks for taking your time in reading, or proving this, and i wait in time your answer!