window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
   priceInput.addEventListener("input", () => {
     const saleTax = document.getElementById("add-tax-price");
     saleTax.innerHTML = Math.floor(priceInput.value * 0.1 );
     const salePofit = document.getElementById("profit");
     salePofit.innerHTML = Math.floor(priceInput.value - Math.floor(priceInput.value * 0.1 ))
 })
});