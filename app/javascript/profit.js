function calculate_profit() {
  const price = document.getElementById("item_price");
  price.addEventListener("input", (e) => {
    let fee = document.getElementById("add-tax-price");
    let profit = document.getElementById("profit");
    fee.innerHTML = price.value * 0.1;
    profit.innerHTML = price.value * 0.9
    });
}

window.addEventListener('load', calculate_profit);