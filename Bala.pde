class Bala{

    int altoBala = 20;
    int anchoBala = 20;

    int velocidadBalaJugador = 3;

    int velocidadBalaEnemigo = 2;

    color verde = color(0,255,0);

    color rojo = color(255,0,0);

    color azul = color(0,0,255);

    //daño bala normal (jugador)
    int danioBalaNJ = 5;

    //daño bala especial (jugador)
    int danioBalaEJ = 10;

    //daño bala enemiga
    int danioBalaNE = 1;

    PShape figura ;
    color colorBala;

    //Posicion bala en el eje x(la poscion inicial sera la de la entidad que lo lanze)
    int x;

    //Posicion bala en el eje y(la posicion incial sera la de la entidad que lo lanze)
    int y;

    //si la bala es visible o no. Una bala solo sera visible si no le ha pegado a una entidad y si esta dentro del marco 
    boolean visible;

    //el daño hecho por la bala
    int danio;

    int altoPantalla;
    int anchoPantalla;

    //la direccion de la bala. Si es 1(positiva) ira de arriba a abajo, si es -1(negativa) ira de abajo a arriba
    int direccionBala;

    int velocidadBala;

    

    //esJugador , si es true es una bala de jugador , si es false 
    Bala(boolean esJugador ,int pix, int piy, int altoP, int anchoP, int danio){
        x = pix;
        y = piy;

        altoPantalla = altoP;
        anchoPantalla = anchoP;

        visible = true;

        figura = createShape(RECT,x,y,altoBala,anchoBala);

        //Es jugador
        if(esJugador == true){
            direccionBala =  -1;//van de abajo a arriba (en direccion de los enemigos)
            velocidadBala = velocidadBalaJugador;

            if(danio == danioBalaNJ){
                colorBala = verde ;
                danio = danioBalaNJ;
            }
            else if(danio == danioBalaEJ){
                colorBala = azul;
                danio = danioBalaEJ;
            }
        }
        //Es enemigo
        else if(esJugador == false){
            direccionBala =  1;//van de arriba a abajo (en direccion al jugador)
            colorBala = rojo;
            danio = danioBalaNE;//por default es uno (no me importa que pasen por parametro por que siempre quitara solo una vida)
            velocidadBala = velocidadBalaEnemigo;//un poco mas lenta que la de jugador por default
        }
    }


    //avanza la posicion de la bala dependiendo de su velocidad y direccion
    void avanzar(){
        int avance = direccionBala * velocidadBala;//se multiplica para que tenga la direccion correcta sin importar que tipo de bala sea
        y += avance;
    }

    //en la parte principal del programa se tiene que usar en conjunto con quitar la vida y con quitar la bala de como la lista de balas que aparecen
    void impacto(){
        visible = false;//vuelve a la bala no visible y la parte principal del programa se encarga de quitar la bala de la pantalla basado en este atributo de visible
    }

    //pregunta si la bala esta fuera de las dimensiones de la pantalla
    //si es cierto se vuelve invisible y despues el programa la eleminara
    void volverInvisibleSiFueraDeRangoPantalla(){
        if(!(0 < x && x < anchoPantalla)){
            visible = false;//vuelve la bala invisible por que se salio de rango
        }
        if(!(0 < y && y < altoPantalla)){
            visible = false;//vuelve la bala invisible por que se salio de rango
        }
    }

    //dibuja la bala
    //el dibujo de una bala en el programa principal tiene que hacerse despues de avanze
    void render(){
        figura = createShape(GROUP);

        PShape cuerpo = createShape(RECT,x,y , anchoBala,altoBala);
        cuerpo.setFill(colorBala);

        figura.addChild(cuerpo);
        
        shape(figura);


        //rectMode(CENTER);
        //rect(x,y, altoBala , anchoBala);
    }


}