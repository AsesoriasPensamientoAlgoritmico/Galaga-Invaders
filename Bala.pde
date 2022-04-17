class Bala{

    int ALTO_BALA = 20;
    int ANCHO_BALA = 20;
    int VELOCIDAD_BAJA_JUGADOR_BASE = 3;
    int VELOCIDAD_BAJA_ENEMIGO_BASE = 2;
    color VERDE = color(0,255,0);
    color ROJO = color(255,0,0);
    color AZUL = color(0,0,255);
    int DANIO_BALA_NORMAL_J = 5;//bala normal jugador
    //bala especial jugador
    int DANIO_BALA_ESPECIAL_J = 10;
    //bala normal enemigo
    int DANIO_BALA_NORMAL_E = 1;


    PShape figura = createShape(RECT,getX(),getY(),ALTO_BALA , ANCHO_BALA);
    //color de la bala (verde/azul(jugador) o rojo(enemigo))
    color colorBala;

    //Posicion bala en el eje x
    int x;
    //Posicion bala en el eje y
    int y;

    boolean visible;//esto existe para asegurar que "mate" las balas cuando ya le pegaron a algo o cuando ya se salieron de la pantalla

    int danio;

    int altoPantalla;
    int anchoPantalla;

    //la direccion de la bala. Si es 1(positiva) ira de arriba a abajo, si es -1(negativa) ira de abajo a arriba
    int direccionBala;
    int velocidadBala;
    

    //esJugador , si es true es una bala de jugador , si es false 
    Bala(boolean esJugador ,int posicionInicialX, int posicionInicialY, int altoPantalla, int anchoPantalla, int danioHecho){
    x = posicionInicialX;
    y = posicionInicialY;

    altoPantalla = altoPantalla;
    anchoPantalla = anchoPantalla;

    visible = true;

            //Es jugador
    if(esJugador == true){
            direccionBala =  -1;//van de abajo a arriba (en direccion de los enemigos)
            velocidadBala = VELOCIDAD_BAJA_JUGADOR_BASE;

            if(danioHecho == DANIO_BALA_NORMAL_J){
            colorBala = VERDE ;
            danio = DANIO_BALA_NORMAL_J;
            }
            else if(danioHecho == DANIO_BALA_ESPECIAL_J){
        colorBala = AZUL;
        danio = DANIO_BALA_ESPECIAL_J;
            }
        }
        //Es enemigo
        else if(esJugador == false){
            direccionBala =  1;//van de arriba a abajo (en direccion al jugador)
    colorBala = ROJO;
    danio = DANIO_BALA_NORMAL_E;
    velocidadBala = VELOCIDAD_BAJA_ENEMIGO_BASE;
        }
    }

    void avanzar(){
        int avance = getDireccionBala() * getVelocidadBala();//se multiplica para que tenga la direccion correcta sin importar que tipo de bala sea
        int nuevaPosicionY = getY() + avance;
        setY(nuevaPosicionY);
    }
    void impacto(){
        setVisible(false);//vuelve a la bala no visible y la parte principal del programa se encarga de quitar la bala de la pantalla basado en este atributo de visible
    }

    //pregunta si la bala esta fuera de las dimensiones de la pantalla
    void volverInvisibleSiFueraDeRangoPantalla(){
        if(!(0 < getX() && getX() < getAnchoPantalla())){
            setVisible(false);//vuelve la bala invisible por que se salio de rango
        }
        if(!(0 < getY() && getY() < getAltoPantalla())){
            setVisible(false);//vuelve la bala invisible por que se salio de rango
        }
    }

    //dibuja la bala
    //el dibujo de una bala en el programa principal tiene que hacerse despues de avanze
    void render(){
        figura = createShape(GROUP);

        PShape cuerpo = createShape(RECT,getX(),getY() , ANCHO_BALA,ALTO_BALA);
        cuerpo.setFill(getColorBala());

        figura.addChild(cuerpo);
        
        shape(figura);


        //rectMode(CENTER);//asi es mas facil como pensar en crear el rectangulo
        //rect(getX(),getY(), ALTO_BALA , ANCHO_BALA);//TODO: CREO QUE ESTO VA A CAUSAR UN ERROR POR QUE SI SE GENERA DONDE ESTA EL JUGADOR O EL ENEMIGO EN ELSIGUIENTE CICLO DE DRAW HABRA UN PROBLEMA POR QUE SE VA A PEGAR A SI MISMO
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

    int getX(){
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

    boolean getVisible(){
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
        else if(direccion > 0 ){
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

    int getDanioBalaNormalJ(){
        return DANIO_BALA_NORMAL_J;
    }

    int getDanioBalaNormalE(){
        return DANIO_BALA_NORMAL_E;
    }

    int getDanioBalaEspecialJ(){
        return DANIO_BALA_ESPECIAL_J;
    }

    int getAnchoBala(){
        return ANCHO_BALA;
    }

    int getAltoBala(){
        return ALTO_BALA;
    }

}
