Challenge Solution
===
- `npm install`
- `npm run test` for unit tests
- `npm run execute` for creating new examples using command line

---

The important class in this solution is the `Checkout` class. This class contains the logic to scan items and to add prices. It makes use of the `/src/discounts.js` module to apply the relevant discounts.

The program, as a real checkout, relies on different item counts. Based on these counts, we decide to trigger certain discounts which are defined for each item in the pricing rules.

# Pricing Rules
The pricing rules are defined in `/src/pricing_rules.js`. These rules make use of the `Item` class for each definition. Each Item contains a `name`, `price`, a flag that determines if the `buyOneGetOne` discount is applied, and an object that defines a discount based on count (for example, strawberries drop from £5.00 to £4.50 if 3 or more have been scanned).

You can add more pricing rules by adding another `Item` object in the `module.exports`. Currently this only supports discounts in the `buyOneGetOne` and price-drop based on count categories.

# Creating Examples
To test with your own examples, run `npm run execute` in the command line for an input prompt. Once you see the prompt, an example input can be `SR1, GR1, SG1, KW1, SR1`. You will then get your total (in this example `£24.84`).

If you input any string that isn't a recognized item code, you will get an error: `Error: Item code must be in pricing rules`. The code for this section is in `/src/prompt.js`

# Unit Tests
To run the unit tests you can run `npm run test`.

The unit tests were written with `mocha`. Discount rules were tested by making sure of the following scenarios:
  - A quantity lower than the discount threshold is scanned (for ex: 2 Strawberries)
  - A quantity equal to the discount threshold is scanned (for ex: 3 Strawberries)
  - A quantity larger than the discount threshold is scanned (for ex: 4 Strawberries)
  - Items with combinations of discounts are scanned (for ex: Kiwi)
  - Items are scanned in random order and the discounts still apply

# Improvements
The `Checkout` class should have 1 job: to scan items and add a total. It would be nice to spend some more time on this to remove some logic from the `Checkout` and include it somewhere else. For example, each Item type could have its rules independently, and we could check the type instead of relying on the `itemCode` to make decisions.

It would be nice to abstract the logic for the discounts that way it would be scalable for more types of discounts. For example, instead of having a function called `applyBuyOneGetOne` we could have something like `applyBuyGet(buy, get)` where the `buy` parameter corresponds to how many need to be bought in order to get the value in the `get` parameter. In this case, `applyBuyOneGetOne` would become `applyBuyGet(1, 1)`. We could easily scale this for a sale where you buy 3 and get 1: `applyBuyGet(3, 1)`.

Another improvement could be the way the discount price is applied. Currently, the `price` field is changed for that specific type of item, which does not support the logic where items can be removed and the discount wouldn't be applicable anymore.

It would also be nice to support CSV or TXT file imports for the rules if this became larger.
