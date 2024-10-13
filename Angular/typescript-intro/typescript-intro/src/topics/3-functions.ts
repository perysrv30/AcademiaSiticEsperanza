function addNumbers(a: number, b: number){
 return a + b;
}

const result = addNumbers(1,2);
console.log({result});
console.log(result);
console.log('result', result);

const addNumbersArrow = (a: number, b: number): string => {
 return (a + b).toString();
  // Alternativa con backticks
  // return `${a + b}`;
 }
const result2 = addNumbersArrow(1, 2);
console.log({ result2 });

function multiply(firstNumber: number, secondNumber?: number, base: number = 2){
 return firstNumber * base;
}

const multiplyResult: number = multiply(5);
console.log({ multiplyResult });
    