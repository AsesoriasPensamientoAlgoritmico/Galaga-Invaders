class Jugador extends BaseEntidad{
    //-----------
    //CONSTANTES
    //-----------

    //velocidad en la que se va a mover en el eje x 
    static final int VELOCIDAD_MOVIMIENTO_BASE = 5;

    //numero de vidas con las que inicia un jugador
    static final int NUMERO_VIDAS_INICIAL = 3;

    //ancho de la figura del jugador
    static final int ANCHO_JUGADOR = 20;

    //alto de la figura del jugador
    static final int ALTO_JUGADOR = 20;

    //-----------
    //ATRIBUTOS
    //-----------

    //El nombre del jugador
    String nombreJugador;

    //El numero de vidas que tienen actualmente un jugador
    int vidas;

    //El puntaje que tiene actualmente en el juego
    int puntajeActual;

    //El puntaje maximo que ha alcanzando en todos sus juegos
    int maximoPuntajeHistorico;

    //La velocidad con la que se mueve horizontalmente la figura
    int velocidadDeMovimiento;

    //-----------
    //CONSTRUCTOR
    //-----------

    //NOTA: La posicion del jugador se calcula desde el centro de la figura del jugador
    Jugador(int posicionInicialX, int posicionInicialY,int altoPantalla, int anchoPantalla, String nombreJugador ,  ){
        //Hereda de la clase padre que es base criatura
        super(posicionInicialX,posicionInicialY,altoPantalla,anchoPantalla);

        this.nombreJugador = nombreJugador;
        this.vidas = NUMERO_VIDAS_INICIAL;//el numero de vidas actuales de un jugador se inicializa con la constante dada 
        this.puntajeActual = 0; //el puntaje de un jugador siempre inicia en cero
        this.maximoPuntajeHistorico = 0; //al crear un jugador su puntaje maximo inicia en cero
        this.velocidadDeMovimiento = VELOCIDAD_MOVIMIENTO_BASE;//Se inicializa con una velocidad base (esto es para que despues con un poder se pueda modificar)
    }

    //-----------
    //FUNCIONES
    //-----------

    //se encarga de dibujar la figura del jugador
    void renderJugador(){
        //TODO: PSHAPE DEL JUGADOR BONITO

        //Guarda la figura en el atributo de sprite(para ver mas de este atributo ver en base entidad)
        sprite = createShape(GROUP);

        //calculos basados en posicion de jugador y tamaño
        
        //posicion mitad de triangulo sera X
        int punto2X = getX();

        //posicion punto izquierdo triangulo sera X menos la mitad del ancho total de la figura del jugador
        int punto1X = getX() - ANCHO_JUGADOR/2;

        //posicion punto derecho triangulo sera X mas la mitad del ancho total de la figura del jugador
        int punto3X = getX() + ANCHO_JUGADOR/2;

        //posicion y del punto izquierdo es Y mas la mitad del alto del jugador (por que Y va de 0 en el techo a max en el piso)
        int punto1Y = getY() + ANCHO_JUGADOR/2;
        
        //posicion y del punto derecho es Y mas la mitad del alto del jugador (por que Y va de 0 en el techo a max en el piso)
        int punto3Y = getY() + ANCHO_JUGADOR/2;

        //posicion y del punto izquierdo es Y menos la mitad del alto del jugador (por que Y va de 0 en el techo a max en el piso)
        int punto2y = getY() - ANCHO_JUGADOR/2;
        
        //Crea el triangulo
        PShape cuerpoNave = createShape(TRIANGLE,punto1X,punto1Y,punto2X,punto2Y,punto3X,punto2Y);

        //color del cuerpo sera rojo asi es visible y contrasta con el fondo
        cuerpoNave.setFill(color(255,0,0));

        //TODO: Añadir mas detalles y figuras

        //añade figuras individuales al grupo de figuras
        sprite.addChild(cuerpoNave);

        //dibuja la figura
        shape(figura);

    }

    //mueve la figura a la derecha (eje Y)con una velocidad dada
    //revisa que no se este en el borde, si esta en el borde derecho se queda quieto
    void moverDerecha(){
        if(getX()<getAnchoPantalla()){
            int nuevoY = getY();
            nuevoY += getVelocidadDeMovimiento();
            setY(nuevoY);
        }
    }

    //mueve la figura a la izquierda
    //revisa que no se este en el borde, si esta en el borde izquierdo se queda quieto
    void moverIzquierda(){
        if(getX() > 0 ){
            int nuevoY = getY();
            nuevoY -= getVelocidadDeMovimiento();
            setY(nuevoY);
        }
    }

    //Cuando algun bono se alcanze se aplica un acelere enla velocidad de movimiento base
    void boostVelocidadMovimiento(int boostVelocidad){
        int nuevaVelocidad = getVelocidadDeMovimiento();
        nuevaVelocidad += boostVelocidad;
        setY(nuevaVelocidad);
    }

    //Cuando alguna penalizacion se de se da un acelere enla velocidad de movimiento base
    void penalizacionVelocidadMovimiento(int penalizacionVelocidad){
        int nuevaVelocidad = getVelocidadDeMovimiento();
        nuevaVelocidad -= penalizacionVelocidad;
        setY(nuevaVelocidad);
    }

    //dispara un proyectil normal
    void disparar(){
        sonido();

        //TODO: Aun no se como voy a manejar esto, creo que depende del mundo
        //Depronto hare el mundo como una grilla y en un arreglo de la grilla registro donde se disparo y calculo que en x segundos le pegaria 
        //Depronto delego lo de render a la interfaz del juego

        //Es que el disparo es independiente del jugador entonces funciona particular
    }

    //dispara un proyectil especial (a mitad de velocidad de uno normal)
    void dispararEspecial(){
        sonido();

        //TODO: Aun no se como voy a manejar esto, creo que depende del mundo
        //Depronto hare el mundo como una grilla y en un arreglo de la grilla registro donde se disparo y calculo que en x segundos le pegaria 
        //Depronto delego lo de render a la interfaz del juego

        //Es que el disparo es independiente del jugador entonces funciona particular
    }

    //sonido del jugador cuando dispara
    void sonido(){
        //TODO: en el archivo principal se tienen que llamar esto cuando se detecte que se presiona el boton que este asignado a disparar
        System.out.println("Pew");
    }

    //le quita una vida al jugador cuando le pegan o deja pasar a un invasor
    void quitarVida(){
        setVidas(getVidas()-1);
    }

    //revisa si se ha llegado a 0 vidas
    boolean revisarSiMuerto(){
         if(getVidas()==0){
            return true;
        }
        else{
            return false;
        }
    }

    //suma un numero de puntos al puntaje actual
    void sumarAPuntajeActual(int puntos){
        setPuntajeActual(getPuntajeActual()+puntos);
    }

    //cada draw se va a revisar si el puntaje actual es mayor al puntaje historico.
    //si es mayor se actualiza, de lo contrario no se hace nada
    void actualizarMaximoPuntajeHistorico(){
        if(getPuntajeActual()>getMaximoPuntajeHistorico()){
            setMaximoPuntajeHistorico(puntajeActual);
        }
    }


    ///--------
    // gets y sets
    //---------

    void setVelocidadDeMovimiento(int velocidadDeMovimiento){
        this.velocidadDeMovimiento = velocidadDeMovimiento;
    }

    void setMaximoPuntajeHistorico(int maximoPuntajeHistorico){
        this.maximoPuntajeHistorico = maximoPuntajeHistorico;
    }

    void setPuntajeActual(int puntajeActual){
        this.puntajeActual = puntajeActual;
    }

    void setVidas(int vidas){
        this.vidas = vidas;
    }

    void setNombreJugador(String nombre){
        this.nombreJugador = nombre;
    }

    int getVelocidadDeMovimiento(){
        return this.velocidadDeMovimiento;
    }

    int getMaximoPuntajeHistorico(){
        return this.maximoPuntajeHistorico;
    }

    int getPuntajeActual(){
        return this.puntajeActual;
    }

    int getVidas(){
        return this.vidas;
    }

    String getNombreJugador(){
        return this.nombreJugador;
    }
    
}