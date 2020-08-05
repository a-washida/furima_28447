function calculate_profit() {
  const price = document.getElementById("item_price");
  price.addEventListener("input", (e) => {
    let fee = document.getElementById("add-tax-price");
    let profit = document.getElementById("profit");
    if (price.value.match(/^[0-9]+$/)) {
      fee.innerHTML = price.value * 0.1;
      profit.innerHTML = price.value * 0.9
    } else {
      fee.innerHTML = "半角数字のみ入力可能"
      profit.innerHTML = "半角数字のみ入力可能"
    }

    });
}

window.addEventListener("load", calculate_profit);
