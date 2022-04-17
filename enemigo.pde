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
        Bala bala = new Bala(true,getX()-1,getY()+templateBala.ALTO_BALA-25,getAltoPantalla(),getAnchoPantalla(),danio);
        return bala;
    }

    //Sonido del enemigo cuando dispara
    void sonido(){
        System.out.println("Pow");
    }

    //Mueve el enemigo X posiciones abajo despues de que cierto tiempo ha pasado
    //Con el contador se controla cada cuanto tiempo entre avances
    void mover(){
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
