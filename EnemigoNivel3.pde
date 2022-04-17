class EnemigoNivel3 extends Enemigo{

    //-----------
    //CONSTANTE
    //-----------

    color colorEnemigoN1= color(135, 135, 135);

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

    void renderEnemigo(){
        sprite = sprite = createShape(GROUP);

        int puntoX = getX() - ANCHO_ENEMIGO/2;
        int puntoY = getY() - ALTO_ENEMIGO/2;

        PShape cuerpoEnemigo = createShape(RECT,puntoX,puntoY,ANCHO_ENEMIGO,ALTO_ENEMIGO);
        cuerpoEnemigo.setFill(colorEnemigoN3);
        sprite.addChild(cuerpoEnemigo);
        shape(sprite);

    }

    
}
