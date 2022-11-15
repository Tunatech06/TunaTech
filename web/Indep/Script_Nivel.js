//arreglo que tiene las respuestas correctas
let correctas = [1,2,2,2,3,2,1,2,1,2,3,3,1,2,2,3,1];

//arreglo donde se guardan las respuestas del usuario
let opcion_elegida=[];

let cantidad_correctas=0;

//función que toma el num de pregunta y el input elegido de esa poregunta
function respuesta(num_pregunta, seleccionada){
    //guardo la respuesta elegida
    opcion_elegida[num_pregunta]=seleccionada.value;
    
    //el siguiente código es para poner en color blanco
    //el fondo de los input para cuando elige otra opción
    //armo el id para seleccionar el selection correspondiente
    id="p" + num_pregunta;
    
    labels = document.getElementById(id).childNodes;
    labels[3].style.backgrounColor = "white";
    labels[5].style.backgrounColor = "white";
    labels[7].style.backgrounColor = "white";
    
    //doy el color al label seleccionado
    seleccionada.parentNode.style.backgroundColor = "#cec0fc";
}

//función que compara los arreglos para saber cuántas estuvieron correctas
function corregir(){
    cantidad_correctas=0;
    for(i=0; i<correctas.length; i++){
        if(correctas[i]==opcion_elegida[i]){
            cantidad_correctas++;
        }
    }
    document.getElementById("resultado").innerHTML = cantidad_correctas;
}