const price =() => {
// 金額を入力した数値をpriceInputという変数に格納する
  const priceInput = document.getElementById("item-price");

  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    
    const addTax= document.getElementById("add-tax-price")
    const tax = Math.floor(inputValue *0.1 ) // 販売手数料（10%）を計算
    addTax.innerHTML =tax;

    const addProfit = document.getElementById("profit");
    const profitValue =  Math.floor(inputValue - tax);  // 販売利益を計算
    addProfit.innerHTML = profitValue;
  });
};
// turbo:loadイベントとturbo:renderイベントに対応したイベントリスナーを追加
window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);