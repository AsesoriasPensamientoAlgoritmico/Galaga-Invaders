class EnemigoNivel2 extends Enemigo{
    //-----------
    //CONSTANTES
    //-----------

   

    //-----------
    //ATRIBUTOS
    //-----------

    //-----------
    //CONSTRUCTOR
    //-----------

    EnemigoNivel2(int posicionInicialX, int posicionInicialY,int altoPantalla, int anchoPantalla){
        super( posicionInicialX,  posicionInicialY, altoPantalla,  anchoPantalla);

        //inicializa vidas
        this.vidas = NUMERO_VIDAS_NIVEL_2;
    }

    //-----------
    //FUNCIONES
    //-----------
}
