//let nombre = 'Filtro';
//seguir con el mismo tipo de dato
// let nombre: string;
// nombre = 123;

// let existencia: number | string = 100;
// existencia = 'LLENO';

//existencia = true; // tipo de dato no declarado, error

// cuando sabemos que tendra por defecto  si es un string 
// esto lo hace si una condicion no se cumple segun el tipo de dato

// let existencia : number |'LLENO' = 100;

const articulo: string = 'Filtro';
let existencia: number | 'LLENO' = 95;
const activo: boolean = true;

console.log({articulo, existencia, activo});
