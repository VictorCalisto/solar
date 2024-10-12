function limparFormato(input) {
    // Remove a formatação enquanto o usuário está digitando
    input.value = input.value.replace(/\D/g, "");
}
function formatarTelefone(input) {
    // Remove qualquer caractere que não seja dígito
    let valor = input.value.replace(/\D/g, "");

    // Limita o número de dígitos a 11 (para o formato brasileiro)
    if (valor.length > 11) {
        valor = valor.substring(0, 11); // Trunca o valor para 11 dígitos
    }

    // Verifica o comprimento e formata o número de telefone
    if (valor.length === 11) {
        valor = valor.replace(/^(\d{2})(\d)(\d{4})(\d{4})$/, "($1)$2 $3-$4");
    } else if (valor.length === 10) {
        valor = valor.replace(/^(\d{2})(\d{4})(\d{4})$/, "($1) $2-$3");
    } else if (valor.length >= 2) {
        valor = valor.replace(/^(\d{2})(\d{0,1})$/, "($1)$2");
    }

    function toggleWhatsapp(checkbox) {
        const whatsapp = document.getElementById("contato_whatsapp");
        const label =  document.getElementById("label_whatsapp");
        if (checkbox.checked) {
            // Se a checkbox estiver marcada, oculta o campo de WhatsApp
            whatsapp.style.display = "none";
            label.style.display = "none"
        } else {
            // Se não estiver marcada, mostra o campo de WhatsApp
            whatsapp.style.display = "block";
            label.style.display = "block";

        }
    }
}window.formatarTelefone()
window.toggleWhatsapp()
window.limparFormato()