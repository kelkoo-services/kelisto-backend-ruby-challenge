## About your solution

Add any information that will help us to understand the approach of the solution.
---


When I first started my approach for solving this challenge I considered several possibilities. One of them was using Java and build a console application. I also considered learning ruby in a very short period of time, due to the fact that is the main language used in the company. I wanted this project to have a graphic interface and I feel more confortable in a web environment, so I decided to code this challenge with object oriented PHP and some JavaScript and HTML for presenting the data to the user.


I used a MVC pattern, avoiding the use of any framework and just working with plain PHP and JavaScript. 

---

Here is the structure of the project:

# Models

Here is the CheckoutModel.php file, which contains the logic for creating items. Here you can instantiate as many objects as you wish from the Item class.
For the purpose of this challenge we have already instantiated these items as it follows:

        $this->greenTea = new Item('GR1', 'Green Tea', 3.11, true);
        $this->strawberry = new Item('SR1', 'Strawberry', 5.00);
        $this->coffee = new Item('CF1', 'Coffee', 11.23);

If we want any of this items to be part of the 'buy-one-get-one-free' offer, we just have to set the last optional parameter to true. In this example this offer will only apply for the green tea.

Here is also the 'getTotal' and 'lowerPrice' functions. The getTotal function receives the amount of items selected by the user and calculate the total price of each item type separately. Here is evaluated if any of the selected items has a discount or not. In this case the strawberries drop their price if there are three or more in the basket. We can achieve this by calling the 'lowerPrice' function.

# Controllers

Here we have the CheckoutController.php file. From here we call the 'createItems' function of the model for getting the current catalogue of products and then send them to the view.

# Views

We use the CheckoutView.php file for showing the interface to user. In the screen we can see the current products catalogue provided by the controller CheckoutController.php.

---

# Javascript

Here we scan the items and send the amount of the selected ones trough an AJAX call to basket.php and display the total price in the view. 


---

# Install

In order to run this project you need to have installed a local server such as WAMP or XAMPP and place this directory on 'wamp64/www' or 'xamp/htdocs' and access to it on your web browser.

# Usage

The usage is quite simple. You just have to click on any of the items for scanning them as many times as you want and in any order. You can see the amount of every product added to the basket next to them. Once you are done scanning items you can click on the 'CHEKCOUT' button and see the total price, taking into account the current offers. From here, you can keep scanning more items and calculating the total price, which is going to be updated, or you can click on the 'RESET' button in order to clear up the system and start scanning again.

    You can try scanning these quantities and easily check the total price as is expected:

        1.
            Green Tea: 3.
            Strawberry: 1.
            Coffee: 1.

            Expected Total Price: £22.45

        2. 
            Green Tea: 2.

            Expected Total Price: £3.11

        3. 
            Green Tea: 1.
            Strawberry: 3.

            Expected Total Price: £16.61 


# Future improvements

- The discounts logic should be completely out of the 'getTotal' function and maybe be used a parameter in order to separate responsabilities in a better way.
- It would be better to get the items catalogue from a database instead of instantiate them directly in the model.

---

# Conclusions

I had a really good time solving this challenge, although it was hard at first to decide what my approach would be. I want to thank you for your time and giving me the opportunity to demonstrate my skills. I look forward to having your feedback. Best regards.