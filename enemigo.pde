class Enemigo extends BaseEntidad{
    //-----------
    //CONSTANTES
    //-----------

    //Numero de vidas que tiene un enemigo nivel 1
    static final int NUMERO_VIDAS_NIVEL_1 = 1;

    //Numero de vidas que tiene un enemigo nivel 2
    static final int NUMERO_VIDAS_NIVEL_2 = 2;

    //Numero de vidas que tiene un enemigo nivel 3
    static final int NUMERO_VIDAS_NIVEL_3 = 3;

    //Numero de vidas que tiene un enemigo nivel 4
    static final int NUMERO_VIDAS_NIVEL_4 = 4;

    //ancho de la figura del jugador
    static final int ANCHO_ENEMIGO = 40;

    //alto de la figura del jugador
    static final int ALTO_ENEMIGO = 40;

    //-----------
    //CONSTRUCTOR
    //-----------

    Enemigo(int posicionInicialX, int posicionInicialY,int altoPantalla, int anchoPantalla){
        super( posicionInicialX,  posicionInicialY, altoPantalla,  anchoPantalla);

        //resto de cosas
        this.velocidadDeMovimiento = VELOCIDAD_MOVIMIENTO_BASE_ENEMIGO;
    }

    //-----------
    //FUNCIONES
    //-----------

     //dispara un proyectil normal
    //crea un proyectil tipo enemigo desde la posicion del enemigo para que el mundo como añada a su lista de proyectiles vivos
    Bala disparar(){
        sonido();
        int danio = templateBala.getDanioBalaNormalE();
        Bala bala = new Bala(false,getX()-1,getY()+templateBala.ALTO_BALA-25,getAltoPantalla(),getAnchoPantalla(),danio);
        return bala;
    }

    //Sonido del enemigo cuando dispara
    void sonido(){
        System.out.println("Pow");
    }

    //Mueve el enemigo X posiciones abajo despues de que cierto tiempo ha pasado
    //Con el contador se controla cada cuanto tiempo entre avances
    void avanzar(){
        if(0 < getY() && getY() < getAltoPantalla()){
            int nuevoY = getY();
            nuevoY += getVelocidadDeMovimiento();
            setY(nuevoY);
        }
    }

    //revisa si el enemigo esta al final de la pantalla (Y)
    //se usa para indicar que se ha terminado el juego (llegaron a la fila del jugador)
    boolean estaAlFinalDePantalla(){
        if(getY() > getAltoPantalla()){
            return true;
        }
        return false;
    }

}

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

class EnemigoNivel2 extends Enemigo{

    //-----------
    //CONSTANTE
    //-----------

    color colorEnemigoN2= color(201, 201, 201);

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

    void render(){
        sprite = createShape(GROUP);

        int puntoX = getX() - ANCHO_ENEMIGO/2;
        int puntoY = getY() - ALTO_ENEMIGO/2;

        PShape cuerpoEnemigo = createShape(RECT,puntoX,puntoY,ANCHO_ENEMIGO,ALTO_ENEMIGO);
        cuerpoEnemigo.setFill(colorEnemigoN2);
        sprite.addChild(cuerpoEnemigo);
        shape(sprite);

    }

    
}

class EnemigoNivel3 extends Enemigo{

    //-----------
    //CONSTANTE
    //-----------

    color colorEnemigoN3= color(135, 135, 135);

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

    void render(){
        sprite = createShape(GROUP);

        int puntoX = getX() - ANCHO_ENEMIGO/2;
        int puntoY = getY() - ALTO_ENEMIGO/2;

        PShape cuerpoEnemigo = createShape(RECT,puntoX,puntoY,ANCHO_ENEMIGO,ALTO_ENEMIGO);
        cuerpoEnemigo.setFill(colorEnemigoN3);
        sprite.addChild(cuerpoEnemigo);
        shape(sprite);

    }

    
}

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