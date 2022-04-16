class Jugador extends BaseEntidad{
    //-----------
    //CONSTANTES
    //-----------

    //velocidad en la que se va a mover en el eje x 
    static final VELOCIDAD_MOVIMIENTO_BASE = 5;

    //numero de vidas con las que inicia un jugador
    static final NUMERO_VIDAS_INICIAL = 3;

    //ancho de la figura del jugador
    static final ANCHO_JUGADOR = 20;

    //alto de la figura del jugador
    static final ALTO_JUGADOR = 20;

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

    }


    //sonido del jugador cuando dispara
    void sonido(){
        //TODO: en el archivo principal se tienen que llamar esto cuando se detecte que se presiona el boton izquierdo
        System.out.println("Pew Pew");
    }

    //le quita una vida al jugador cuando le pegan o deja pasar a un invasor
    void quitarVida(){
        
    }

    void revisarSiMuerto(){

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