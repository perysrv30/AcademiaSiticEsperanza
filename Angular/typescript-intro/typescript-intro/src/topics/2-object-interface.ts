// let colores =['Rojo','Verde','Azul'];
// colores = ['Rojo','Verde','Azul', true, 123];
let colores: string[]= ['Rojo','Verde','Azul'];

// const refaccion = {
//     nombre: 'Filtro',
//     existencia: 50,
//     colores: ['Rojo', 'Negro']
// };

interface Articulo{
    nombre: string
    existencia: string,
    colores: string[],
    //nullables
    marca?: string
};

const refaccion : Articulo ={
    nombre: 'Filtro',
    existencia: '50',
    colores: ['Rojo', 'Negro']
};

refaccion.marca = 'LTH';

console.log(refaccion);
console.table(refaccion);