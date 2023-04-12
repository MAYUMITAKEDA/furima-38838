window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxPrice = document.getElementById("add-tax-price");
    addTaxPrice.innerHTML = Math.floor(inputValue * 0.1 );
    const Profit = document.getElementById("profit");
    Profit.innerHTML = (inputValue - addTaxPrice.innerHTML);
  });
})
