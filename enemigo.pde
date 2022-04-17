class Enemigo extends BaseEntidad{
    //-----------
    //CONSTANTES
    //-----------

    //velocidad en la que se va a mover en el eje y 
    static final int VELOCIDAD_MOVIMIENTO_BASE = 1;

    //la dificultad de matar al enemigo estara en las sub clases de enemigos

    //-----------
    //ATRIBUTOS
    //-----------

    //-----------
    //CONSTRUCTOR
    //-----------

    Enemigo(int posicionInicialX, int posicionInicialY,int altoPantalla, int anchoPantalla){
        super( posicionInicialX,  posicionInicialY, altoPantalla,  anchoPantalla);

        //resto de cosas
    }

    //-----------
    //FUNCIONES
    //-----------
}
