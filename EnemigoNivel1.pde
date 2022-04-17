class EnemigoNivel1 extends Enemigo{

    //-----------
    //CONSTANTE
    //-----------

    color colorEnemigoN1= color(255,255,255);

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

    void render(){
        sprite = createShape(GROUP);

        int puntoX = getX() - ANCHO_ENEMIGO/2;
        int puntoY = getY() - ALTO_ENEMIGO/2;

        PShape cuerpoEnemigo = createShape(RECT,puntoX,puntoY,ANCHO_ENEMIGO,ALTO_ENEMIGO);
        cuerpoEnemigo.setFill(colorEnemigoN1);
        sprite.addChild(cuerpoEnemigo);
        shape(sprite);

    }

    
}
