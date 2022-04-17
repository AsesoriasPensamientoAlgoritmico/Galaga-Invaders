class Enemigo extends BaseEntidad{
    //-----------
    //CONSTANTES
    //-----------

    //velocidad en la que se va a mover en el eje y 
    static final int VELOCIDAD_MOVIMIENTO_BASE = 1;

    //Numero de vidas que tiene un enemigo nivel 1
    static final int NUMERO_VIDAS_NIVEL_1 = 1;

    //Numero de vidas que tiene un enemigo nivel 2
    static final int NUMERO_VIDAS_NIVEL_2 = 2;

    //Numero de vidas que tiene un enemigo nivel 3
    static final int NUMERO_VIDAS_NIVEL_3 = 3;

    //Numero de vidas que tiene un enemigo nivel 4
    static final int NUMERO_VIDAS_NIVEL_4 = 4;


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
