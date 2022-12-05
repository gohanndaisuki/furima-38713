window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
   priceInput.addEventListener("input", () => {
     const saleTax = document.getElementById("add-tax-price");
     saleTax.innerHTML = Math.round(priceInput.value * 0.1 );
     const salePofit = document.getElementById("profit");
     salePofit.innerHTML = Math.round(priceInput.value - Math.round(priceInput.value * 0.1 ))
 })
});