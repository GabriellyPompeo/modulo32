function encontrarIndicesMaiorEMenor(arr) {
    if (arr.length === 0) {
        return "O array está vazio";
    }

    let indiceMaior = 0;
    let indiceMenor = 0;

    for (let i = 1; i < arr.length; i++) {
        if (arr[i] > arr[indiceMaior]) {
            indiceMaior = i;
        }
        if (arr[i] < arr[indiceMenor]) {
            indiceMenor = i;
        }
    }

    return { indiceMaior, indiceMenor };
}

// Exemplo de uso:
const numeros = [5, 10, 2, 8, 15, 1];

const indices = encontrarIndicesMaiorEMenor(numeros);
console.log("O índice do maior valor é " + indices.indiceMaior);
console.log("O índice do menor valor é " + indices.indiceMenor);
