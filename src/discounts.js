
module.exports = {
  apply(rule, count) {
    if (rule.discount && count === rule.discount.minCount) { // at count where discount is triggered
      return triggerDiscount(rule, count);
    }
    else if (rule.buyOneGetOne) {
      return applyBuyOneGetOne(rule.price, count);
    }
    return rule.price;
  }
}

const applyBuyOneGetOne = (price, count) => {
  if (count % 2 === 0) return 0.00;
  return price;
}

const triggerDiscount = (rule, count) => {
  const oldPrice = rule.price;
  rule.price = rule.discount.price;
  count = rule.buyOneGetOne ? Math.ceil(count / 2) : count;
  return rule.price * count - oldPrice * (count - 1);
}
