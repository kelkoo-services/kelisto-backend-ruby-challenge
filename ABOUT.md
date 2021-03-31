## About your solution

Add any information that will help us to understand the approach of the solution.

### files
1- princing_config.yml
2- checkout.rb
3- main.rb
4- Dockerfile

#### Pricing_config.yml
---
I have created this file because it is very easy to change product prices, names or codes and is not necessary change any line of code.

#### checkout.rb
---
this is a class file that contains  checkout class, i have created only  necessary methods for challenge but this class would be able  had more methods. 

has 3 attributes:
- pricing_products -> contains all config of products that was loaded by yaml file

- list_products -> array with all products scanned

- total -> price of all products in list_products with offers applied

Use "require" into the Checkout class because i parse yaml file into initializer method.

the apply_offer method is not perfect because if add or remove offers this method not change automatic and will have to apply a new code.

#### main.rb
---
I was created a test file main.rb where check that Checkout class do success to work


## How to use
---
I was created a simple interface where you can see this when run a script main.rb.

-------- product list --------
->  GR1 - Grean tea - 3.11 £
->  SR1 - Strawberries - 5.0 £
->  CF1 - Coffee - 11.23 £
------------------------------
------- first example -------
Basket: ["GR1", "SR1", "CF1", "GR1", "GR1"]
Total price expected: 22.45
-------------------------------
------- second example -------
Basket: ["GR1", "GR1"]
Total price expected: 3.11
-------------------------------
------- third example -------
Basket: ["SR1", "SR1", "GR1", "SR1"]
Total price expected: 16.61
-------------------------------

First list show all products exsist into princing_config.yml and below you can see all examples that was added into main.rb with the next step
```
co.scan('GR1') --> scan differente products
co.scan('GR1')

co.show --> show all products that was scanned
co.total --> show total price
```

Model checkout only was created one time and can be use in many example because always call clean method when reproduce a new example.


## Dockerize the app
---
I have created a simple dockerize system where only return script main.rb. the dockerfile contains:

```
FROM ruby:2.5

WORKDIR /usr/src/app

COPY . .

CMD ["ruby", "./main.rb"]
```

I used, by default, a image ruby:2.5 that exsist in dockerhub (i would be used a ubuntu image and install ruby and after move files into container),i have created a folder "app" into /usr/src, after copy my src folder into container.

i set command "ruby ./main.rb" for the output of container. 

result:
```
MacBookProRafael:src rafael.navarro$ docker image build -t ruby_test_rafael_navarro_prieto .
MacBookProRafael:src rafael.navarro$ docker image list

REPOSITORY                        TAG       IMAGE ID       CREATED              SIZE
ruby_test_rafael_navarro_prieto   latest    5ae874b49f07   About a minute ago   843MB

MacBookProRafael:src rafael.navarro$ docker run ruby_test_rafael_navarro_prieto
-------- product list --------
->  GR1 - Grean tea - 3.11 £
->  SR1 - Strawberries - 5.0 £
->  CF1 - Coffee - 11.23 £
------------------------------
------- first scene -------
Basket: ["GR1", "SR1", "CF1", "GR1", "GR1"]
Total price expected: 22.45
-------------------------------
------- second scene -------
Basket: ["GR1", "GR1"]
Total price expected: 3.11
-------------------------------
------- thirth scene -------
Basket: ["SR1", "SR1", "GR1", "SR1"]
Total price expected: 16.61
-------------------------------
MacBookProRafael:src rafael.navarro$
```

## Add unit tests
---
i don't know how create unit test for a simple script, i would added rake and rspec but i don't know if can be permit in this challenge.

I have created a "main.rb" for the test verification class and I test with examples that define in the challenge, I don't know if I should use other examples or can I use the same

## scalability
---
* Implement a methods or class that contains all info about offers for create a automatic system
* Implement a docker system that permit use external config file that contains all info of products, prices, offers
* Implement testing environment that permit develop with TDD metodology

# End
thanks for this opportunity and see you soon.