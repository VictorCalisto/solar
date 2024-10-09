function formatarValor(input) {
    let valor = input.value.replace(/[^\d]/g, "");
  
    if (valor) {
      valor = (parseFloat(valor) / 100).toFixed(2);
    } else {
      valor = "0.00";
    }
  
    valor = valor.replace(/\B(?=(\d{3})+(?!\d))/g, ".").replace(".", ",");
    valor = `R$ ${valor}`;
  
    input.value = valor;
  
    if (valor === "R$ 0,00") {
      document.getElementById("erro").style.display = "inline"; // Exibe mensagem de erro
    } else {
      document.getElementById("erro").style.display = "none"; // Oculta mensagem de erro
    }
  } 
window.formatarValor = formatarValor;

