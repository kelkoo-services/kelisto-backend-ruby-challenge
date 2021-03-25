function buy_one_get_one_free(item) {
    return (item.quantity >= 2) ? (item.price * item.quantity) - item.price : item.price * item.quantity;
}

function buy_three_get_ten_off(item) {
    return (item.quantity >= 3) ? item.price * item.quantity - (item.price * item.quantity * 0.1) : item.price * item.quantity;
}

module.exports = { buy_one_get_one_free, buy_three_get_ten_off };