function calculate_profit() {
  const price = document.getElementById("item_price");
  if (price.getAttribute("data-load") != null) {
    return null;
  }
  price.setAttribute("data-load", "true");
  price.addEventListener("input", (e) => {
    let fee = document.getElementById("add-tax-price");
    let profit = document.getElementById("profit");
    fee.innerHTML = price.value * 0.1;
    profit.innerHTML = price.value * 0.9

    e.preventDefault();
    });
}

setInterval(calculate_profit, 1000);