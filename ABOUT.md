## About your solution

I have created a checkout cart but there are two files. Both have the main code to simulate a checkout cart, one is for running in console `irb -r ./checkout.rb` and the other is for running a script that lauch an 'interactive' checkout in console `ruby script.rb`.

My checkout has four commands; one to add a product to the basket `scan`, one to remove a product from the basket `rm`, one to check the total of the basket `total` and one to clear the basket `clear`.

However, the interactive checkout has three commands more; one to run some tests `run_tests`, one to show the available commands `commands` and other to close the checkout `exit`.

Mention that to make the interactive checkout, I have had to use a method that is an important security risk `eval` and I know that never it has to be used.
