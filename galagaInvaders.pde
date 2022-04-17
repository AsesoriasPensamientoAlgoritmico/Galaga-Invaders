class EnemigoNivel4 extends Enemigo{

    //-----------
    //CONSTANTE
    //-----------

    color colorEnemigoN4= color(94, 94, 94);

    //-----------
    //CONSTRUCTOR
    //-----------

    EnemigoNivel4(int posicionInicialX, int posicionInicialY,int altoPantalla, int anchoPantalla){
        super( posicionInicialX,  posicionInicialY, altoPantalla,  anchoPantalla);

        //inicializa vidas
        this.vidas = NUMERO_VIDAS_NIVEL_4;
    }

    //-----------
    //FUNCIONES
    //-----------

    void render(){
        sprite = createShape(GROUP);

        int puntoX = getX() - ANCHO_ENEMIGO/2;
        int puntoY = getY() - ALTO_ENEMIGO/2;

        PShape cuerpoEnemigo = createShape(RECT,puntoX,puntoY,ANCHO_ENEMIGO,ALTO_ENEMIGO);
        cuerpoEnemigo.setFill(colorEnemigoN4);
        sprite.addChild(cuerpoEnemigo);
        shape(sprite);

    }

    
}