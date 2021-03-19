module.exports = {
  scan(list, checkout) {
    list.forEach(item => checkout.scan(item));
  }
}
