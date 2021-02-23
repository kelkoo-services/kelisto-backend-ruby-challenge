## ✨  Introduction

For this challenge, I used OOP for the development of the entire app. I worked on a series of interfaces to guide the user to use the platform properly. In this case opening **app.rb** from the Terminal triggers the start of the app.

<p align="center">
  <img align="center" src="https://res.cloudinary.com/rafxss/image/upload/v1614097132/Kelisto/introduction_gk07xm.gif" data-canonical src="https://res.cloudinary.com/rafxss/image/upload/v1614097132/Kelisto/introduction_gk07xm.gif" width="350" />
</p>


## 🚀Usage

There are two types of users for this app.

- Client

```js
username: client
password: password
```

The client can scan food that is available and can check their previous Checkout Carts.

<p align="center">
  <img align="center" src="https://res.cloudinary.com/rafxss/image/upload/v1614097132/Kelisto/client_b28zh7.gif" data-canonical src="https://res.cloudinary.com/rafxss/image/upload/v1614097132/Kelisto/client_b28zh7.gif" width="350" />
</p>

- Admin

```js
username: admin
password: password
```

The admin can create/edit/delete items and users.

<p align="center">
  <img align="center" src="https://res.cloudinary.com/rafxss/image/upload/v1614097132/Kelisto/admin1_p5buk1.gif" data-canonical src="https://res.cloudinary.com/rafxss/image/upload/v1614097132/Kelisto/admin1_p5buk1.gif" width="350" />
  <img align="center" src="https://res.cloudinary.com/rafxss/image/upload/v1614097132/Kelisto/admin3_azxyjf.gif" data-canonical src="https://res.cloudinary.com/rafxss/image/upload/v1614097132/Kelisto/admin3_azxyjf.gif" width="350" />
</p>

It also has the privilege to see all the Checkout Carts available, no matter the user.

<p align="center">
  <img align="center" src="https://res.cloudinary.com/rafxss/image/upload/v1614097132/Kelisto/admin2_pikfgv.gif" data-canonical src="https://res.cloudinary.com/rafxss/image/upload/v1614097132/Kelisto/admin2_pikfgv.gif" width="350" />
</p>


## 🥵 Challenge

For this particular project, I think the most challenging thing was having a global vision of the goal that I wanted. I tried to give more in terms of code and usability and I think at first was a little confusing, but I am happy with the result.

I also tried to implement a test using **rake**, but I think I would do it better if I had more time.


## 🤘 Improvements

In the case of implementing the orders controller, where the rules for offers are (buy one get one, and get a discount if you buy more than x items), I refactored it for future implementation with the Admin user and an Offer Class, where they can add, edit or delete certain offers.

I also would try refactoring even more code, cleaning a little bit more the app itself.
