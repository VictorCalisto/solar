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

function calcularValor(inflacao,chocolate,cerveja) {
  let valor = document.getElementById('valor').value;
  valor = parseFloat(valor.replace("R$", "").replace(/\./g, '').replace(',', '.').trim());
  
  let totalChocolate=0,totalCerveja=0

  totalChocolate = chocolate*

  document.getElementById('resultado').innerText = "Resultado: R$ " + resultado.toFixed(2);
}
window.calcularValor = calcularValor

function calcularGastoEnergia(gastoMensal, inflacao) {
  let anos = 10
  let inflacaoAnual = inflacao / 100; 
  let gastoAnual = [];

  for (let ano = 1; ano <= anos; ano++) {
    let gastoNoAno = gastoMensal * 12 * Math.pow(1 + inflacaoAnual, ano - 1);
    gastoAnual.push(gastoNoAno.toFixed(2));
  }

  return gastoAnual;
}