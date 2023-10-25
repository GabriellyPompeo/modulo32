function calcularMDC(a, b) {
    while (b !== 0) {
        var temp = b;
        b = a % b;
        a = temp;
    }
    return Math.abs(a);
}

// Exemplo de uso:
var numero1 = 48;
var numero2 = 18;

var mdc = calcularMDC(numero1, numero2);
console.log("O MDC(Máximo Divisor Comum) de " + numero1 + " e " + numero2 + " é " + mdc);