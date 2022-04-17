class Bala{
    //-----------
    //CONSTANTES
    //-----------

    //alto del objeto de bala
    static final int ALTO_BALA = 3;

    //ancho del objeto de la bala
    static final int ANCHO_BALA = 1;

    //velocidad de movimiento base de la bala normal de un jugador
    static final int VELOCIDAD_BAJA_JUGADOR_BASE = 3;

    //velocidad de movimiento base de la bala de un enemigo
    static final int VELOCIDAD_BAJA_ENEMIGO_BASE = 2;

    //SEGURAMENTE AÑADA MAS VELOCIDADES DEPENDIENDO DEL NIVEL PERO WELL GET THERE WHEN WE GET THERE

    //color verde
    static final color VERDE = color(0,255,0);

    //color rojo
    static final color ROJO = color(255,0,0);

    //color azul
    static final color AZUL = color(0,0,255);

    //daño bala normal (solo son para jugador)
    static final int DANIO_BALA_NORMAL_J = 5;

    //daño bala especial (solo son para jugador)
    static final int DANIO_BALA_ESPECIAL_J = 10;

    //daño bala enemiga (solo pueden quitar una vida)
    static final int DANIO_BALA_NORMAL_E = 1;

    //-----------
    //ATRIBUTOS
    //-----------

    //color de la bala (verde/azul(jugador) o rojo(enemigo))
    color colorBala;

    //Posicion bala en el eje x(la poscion inicial sera la de la entidad que lo lanze)
    int x;//sera constante 

    //Posicion bala en el eje y(la posicion incial sera la de la entidad que lo lanze)
    int y;

    //si la bala es visible o no. Una bala solo sera visible si no le ha pegado a una entidad y si esta dentro del marco 
    boolean visible;//esto existe para asegurar que "mate" las balas cuando ya le pegaron a algo o cuando ya se salieron de la pantalla

    //el daño hecho por la bala
    int danio;

    //Alto de la pantalla (se usara para ubicar a la ciratura en relacion al ambiente en el eje y)
    int altoPantalla;
    
    //Ancho de la pantalla ( se usara para ubicar a la entidad en relacion al amabiente en el eje x)
    int anchoPantalla;

    //la direccion de la bala. Si es 1(positiva) ira de arriba a abajo, si es -1(negativa) ira de abajo a arriba
    int direccionBala;

    //la velocidad de la bala (otra variable definira la direccion)
    int velocidadBala;

    //-----------
    //CONSTRUCTOR
    //-----------

    //esJugador , si es true es una bala de jugador , si es false 
    Bala(boolean esJugador ,int posicionInicialX, int posicionInicialY, int altoPantalla, int anchoPantalla, int danioHecho, int velocidadBala){
        this.x = posicionInicialX;
        this.y = posicionInicialY;

        this.altoPantalla = altoPantalla;
        this.anchoPantalla = anchoPantalla;

        this.visible = true;

        //Es jugador
        if(esJugador == true){
            this.direccionBala =  -1;//van de abajo a arriba (en direccion de los enemigos)
            this.velocidadBala = VELOCIDAD_BAJA_JUGADOR_BASE;

            if(danioHecho == DANIO_BALA_NORMAL_J){
                this.colorBala = VERDE ;
                this.danio = DANIO_BALA_NORMAL_J;
            }
            else if(danioHecho == DANIO_BALA_ESPECIAL_J){
                this.colorBala = AZUL;
                this.danio = DANIO_BALA_ESPECIAL_J;
                
            }
        }
        //Es enemigo
        else if(esJugador == false){
            this.direccionBala =  1;//van de arriba a abajo (en direccion al jugador)
            this.colorBala = ROJO;
            this.danio = DANIO_BALA_NORMAL_E;//por default es uno (no me importa que pasen por parametro por que siempre quitara solo una vida)
            this.velocidadBala = VELOCIDAD_BAJA_ENEMIGO_BASE;//un poco mas lenta que la de jugador por default
        }
    }


    //-----------
    //FUNCIONES
    //-----------

    //avanza la posicion de la bala dependiendo de su velocidad y direccion
    void avanzarBala(){
        int avance = getDireccionBala() * getVelocidadBala();//se multiplica para que tenga la direccion correcta sin importar que tipo de bala sea
        int nuevaPosicionY = getY() + avance;//si es negativo el avance pues se resta y ya
        setY(nuevaPosicionY);
    }

    //en la parte principal del programa se tiene que usar en conjunto con quitar la vida y con quitar la bala de como la lista de balas que aparecen
    void impacto(){
        setVisible(false);//vuelve a la bala no visible y la parte principal del programa se encarga de quitar la bala de la pantalla basado en este atributo de visible
    }

    //pregunta si la bala esta fuera de las dimensiones de la pantalla
    //si es cierto se vuelve invisible y despues el programa la eleminara
    boolean estaFueraDeRango(){
        if(0 < getX() && getX() < getAnchoPantalla()){
            if(0 < getY() && getY() < getAltoPantalla()){
                setVisible(false);//vuelve la bala invisible por que se salio de rango
            }    
        }
    }

    //dibuja la bala
    //el dibujo de una bala en el programa principal tiene que hacerse despues de avanze
    void render(){
        ellipseMode(CENTER);//asi es mas facil como pensar en crear el rectangulo
        ellipse(getX(),getY(), ALTO_BALA , ANCHO_BALA);//TODO: CREO QUE ESTO VA A CAUSAR UN ERROR POR QUE SI SE GENERA DONDE ESTA EL JUGADOR O EL ENEMIGO EN ELSIGUIENTE CICLO DE DRAW HABRA UN PROBLEMA POR QUE SE VA A PEGAR A SI MISMO
    }

    //-------
    //get y set
    //-------

    void setColorBala(color colorBala){
        this.colorBala = colorBala;
    }

    color getColorBala(){
        return colorBala;
    }

    void setX(int x){
        this.x = x;
    }

    int getX(int x){
        return x;
    }

    void setY(int y){
        this.y = y;
    }

    int getY(){
        return y;
    }

    void setVisible(boolean visible){
        this.visible = visible;
    }

    int getVisible(){
        return visible;
    }

    void setDanio(int danio){
        this.danio = danio;
    }

    int getDanio(){
        return danio;
    }

    void setAltoPantalla(int altoPantalla){
        this.altoPantalla = altoPantalla;
    }

    void setAnchoPantalla(int anchoPantalla){
        this.anchoPantalla = anchoPantalla;
    }

    int getAltoPantalla(){
        return altoPantalla;
    }

    int getAnchoPantalla(){
        return anchoPantalla;
    }

    void setDireccionBala(int direccion){
        if(direccion < 0){
            this.direccionBala = -1;
        }
        else(direccion > 0 ){
            this.direccionBala = 1;
        }
    }

    int getDireccionBala(){
        return direccionBala;
    }

    void setVelocidadBala(int velocidadBala){
        this.velocidadBala = velocidadBala;
    }

    int getVelocidadBala(){
        return velocidadBala;
    }

}