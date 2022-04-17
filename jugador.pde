class Jugador extends BaseEntidad{
    //-----------
    //CONSTANTES
    //-----------

    //velocidad en la que se va a mover en el eje x 
    static final int VELOCIDAD_MOVIMIENTO_BASE = 5;

    //numero de vidas con las que inicia un jugador
    static final int NUMERO_VIDAS_INICIAL = 3;

    //ancho de la figura del jugador
    static final int ANCHO_JUGADOR = 40;

    //alto de la figura del jugador
    static final int ALTO_JUGADOR = 40;

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

    //ESTO NO ES UNA BALA BALA ES MAS COMO QUE PA ACCEDER A LAS CONSTANTES DE BALA ME TOCA COMO TENEER UN OBJETO (NO SE EN GOOGLE NO ENCONTRE COMO SOLO ACCEDER A LAS CONSTANTES SIN UN OBJETO YA CREADO) ESTA BALA NO SE USARA PARA NADA POR ESO TODO EN CERO
    Bala templateBala = new Bala(true,0,0,0,0,0);

    //-----------
    //CONSTRUCTOR
    //-----------

    //NOTA: La posicion del jugador se calcula desde el centro de la figura del jugador
    Jugador(int posicionInicialX, int posicionInicialY,int altoPantalla, int anchoPantalla, String nombreJugador ){
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
        int punto2Y = getY() - ANCHO_JUGADOR/2;
        
        //Crea el triangulo
        PShape cuerpoNave = createShape(TRIANGLE,punto1X,punto1Y,punto2X,punto2Y,punto3X,punto3Y);

        //color del cuerpo sera rojo asi es visible y contrasta con el fondo
        cuerpoNave.setFill(color(255,0,0));

        //TODO: Añadir mas detalles y figuras

        //añade figuras individuales al grupo de figuras
        sprite.addChild(cuerpoNave);

        //dibuja la figura
        shape(sprite);

    }

    //mueve la figura a la derecha (eje Y)con una velocidad dada
    //revisa que no se este en el borde, si esta en el borde derecho se queda quieto
    void moverDerecha(){
        if(getX()<getAnchoPantalla()){
            int nuevoX = getX();
            nuevoX += getVelocidadDeMovimiento();
            setX(nuevoX);
        }
    }

    //mueve la figura a la izquierda
    //revisa que no se este en el borde, si esta en el borde izquierdo se queda quieto
    void moverIzquierda(){
        if(getX() > 0 ){
            int nuevoX = getX();
            nuevoX -= getVelocidadDeMovimiento();
            setX(nuevoX);
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
    //crea un proyectil tipo jugador desde la posicion del jugador para que el mundo como añada a su lista de proyectiles vivos
    Bala disparar(){
     
        //TODO: Aun no se como voy a manejar esto 100%
        //La idea es que el mundo tiene una lista de como proyectiles activos (que n le han pegado a nada y que no se han salido de la pantalla).
        //El mundo en cada draw va avanzando los proyectiles y cuando se salen de la pantalla o le pegan a algo le aplican el daño y desaparece el proyectil

        //este metodo solo creara el proyectil para darselo al mundo para añadirlo a su lista.
        
        //Imprime sonido pew en consola
        sonido();

        //saca cual deberia ser el daño
        int danio = templateBala.getDanioBalaNormalJ();

        //crea la bala y la retorna
        //le añado 10 a Y para que no se pegue a si mismo el jugador
        Bala bala = new Bala(true,getX()-1,getY()-templateBala.ALTO_BALA-25,getAltoPantalla(),getAnchoPantalla(),danio);


        return bala;
        
    }

    //dispara un proyectil especial (a mitad de velocidad de uno normal)
    //crea un proyectil tipo jugador desde la posicion del jugador para que el mundo como añada a su lista de proyectiles vivos
    Bala dispararEspecial(){
        //TODO: Aun no se como voy a manejar esto 100%
        //La idea es que el mundo tiene una lista de como proyectiles activos (que n le han pegado a nada y que no se han salido de la pantalla).
        //El mundo en cada draw va avanzando los proyectiles y cuando se salen de la pantalla o le pegan a algo le aplican el daño y desaparece el proyectil

        //este metodo solo creara el proyectil para darselo al mundo para añadirlo a su lista.

    
        //Imprime sonido pew en consola
        sonido();

        int danio = templateBala.getDanioBalaEspecialJ();

        //crea la bala y la retorna
        //le añado 10 a Y para que no se pegue a si mismo el jugador
        Bala bala = new Bala(true,getX(),getY()+10,getAltoPantalla(),getAnchoPantalla(),danio);
        
        return bala;
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
