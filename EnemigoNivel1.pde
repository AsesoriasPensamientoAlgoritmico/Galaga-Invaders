class EnemigoNivel1 extends Enemigo{
    //-----------
    //CONSTANTES
    //-----------

   

    //-----------
    //ATRIBUTOS
    //-----------

    //-----------
    //CONSTRUCTOR
    //-----------

    EnemigoNivel1(int posicionInicialX, int posicionInicialY,int altoPantalla, int anchoPantalla){
        super( posicionInicialX,  posicionInicialY, altoPantalla,  anchoPantalla);

        //inicializa vidas
        this.vidas = NUMERO_VIDAS_NIVEL_1;
    }

    //-----------
    //FUNCIONES
    //-----------
}
