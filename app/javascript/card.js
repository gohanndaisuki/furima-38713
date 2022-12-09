const pay = () => {
  Payjp.setPublicKey("pk_test_6af61064b1435f2af7ebd090"); // PAY.JPテスト公開鍵
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("order_delivery_address[number]"),
      exp_month: formData.get("order_delivery_address[exp_month]"),
      exp_year: `20${formData.get("order_delivery_address[exp_year]")}`,
      cvc: formData.get("order_delivery_address[cvc]"),
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        console.log(token)
      }
    });
  });
};

window.addEventListener("load", pay);