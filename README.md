# Kelisto Ruby Challenge

## ✨ About
Kelisto's quest for world domination has prompted us to open a convenience store - we sell only three products:

| Product code | Name | Price |
|:---:|---|---:|
| GR1 | Green tea | £3.11 |
| SR1 | Strawberries | £5.00 |
| CF1 | Coffee | £11.23 |

The CEO is a big fan of buy-one-get-one-free offers and of green tea. He wants us to add a rule to do this.

The COO, though, likes low prices and wants people buying strawberries to get a price discount for bulk purchases. If you buy 3 or more strawberries, the price should drop to £4.50

Our check-out can scan items in any order, and because the CEO and COO change their minds often, it needs to be flexible regarding our pricing rules.

The interface to our checkout looks like this (shown in ruby):

```
co = Checkout.new(pricing_rules)
co.scan(item)
co.scan(item)
price = co.total
```

Implement a checkout system that fulfills these requirements.

### Test data
```
Basket: GR1,SR1,GR1,GR1,CF1
Total price expected: £22.45

Basket: GR1,GR1
Total price expected: £3.11

Basket: SR1,SR1,GR1,SR1
Total price expected: £16.61
```

## What is under evaluation?

One’s ability to analyze, design and code a solution by guiding oneself with Object Oriented Design and Object Guiding Principles.

## 👎 What we don't want

- Frameworks 😊 (you don't need to use any).
- Metaprogramming.

## 🚀 Presentation

- **Code**. What language? `Ruby`.
- **Time**. It should take you between 1 to 8 hours to complete this challenge, however you can take as long as you like.
- **Explanation of the solution** (in separate file in Markdown/Plain Text).
- If you include tests, it would be nice for us.

## 🤘 Evaluation

To send us your code, you can:

- Make a fork of this repository, and send us a pull-request.
- Give access to your repository in Github.
