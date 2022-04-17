class EnemigoNivel3 extends Enemigo{
    //-----------
    //CONSTANTES
    //-----------

   

    //-----------
    //ATRIBUTOS
    //-----------

    //-----------
    //CONSTRUCTOR
    //-----------

    EnemigoNivel3(int posicionInicialX, int posicionInicialY,int altoPantalla, int anchoPantalla){
        super( posicionInicialX,  posicionInicialY, altoPantalla,  anchoPantalla);

        //inicializa vidas
        this.vidas = NUMERO_VIDAS_NIVEL_3;
    }

    //-----------
    //FUNCIONES
    //-----------
}
