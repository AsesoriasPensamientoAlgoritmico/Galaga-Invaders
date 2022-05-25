class Jugador extends BaseEntidad{
    
    String nombreJugador;
    int anchoJugador = 40;
    int altoJugador = 40;
    int NUMEROVIDAS = 3;
    int puntajeActual = 0;
    int puntajeMaximo = 0;

    PShape imagenJugador;

    Jugador(int pix, int piy,int altoPantalla, int anchoPantalla, String nombre ){
        //Hereda de la clase padre que es baseEntidaad
        super(pix,piy,altoPantalla,anchoPantalla);

        vidas = NUMEROVIDAS;
        vidasIniciales = NUMEROVIDAS;
        nombreJugador = nombre;
        velocidadDeMovimiento = velMovimientoJ;
        imagenJugador = loadShape("Jugador.svg");
        
    }

    void renderJugador(){
        
         shape(imagenJugador,this.x-40,this.y-40,80,80);

        /*
        
        //agrupa las formas que componen el jugador
        sprite = createShape(GROUP);

        PShape cuerpoJugador = createShape(RECT,x - anchoJugador/2,y - altoJugador/2,anchoJugador,altoJugador);
        cuerpoJugador.setFill(color(226, 194, 167));
        PShape oreja1 = createShape(RECT,x - anchoJugador/2-7,y - altoJugador/2 + 15,altoJugador/5,altoJugador/5);
        oreja1.setFill(color(226, 194, 167));

        PShape oreja2 = createShape(RECT,x + anchoJugador/2,y - altoJugador/2 + 15,altoJugador/5,altoJugador/5);
        oreja2.setFill(color(226, 194, 167));
        
        PShape boca = createShape(RECT,x - anchoJugador/4,y + altoJugador/4,anchoJugador*0.5,altoJugador/5);
        boca.setFill(color(137, 137, 137));

        PShape ojo1 = createShape(RECT,x - anchoJugador/4,y - altoJugador/4,altoJugador/6,altoJugador/6);
        ojo1.setFill(color(137, 137, 137));
        
        PShape ojo2 = createShape(RECT,x + anchoJugador/4 - 5,y - altoJugador/4,altoJugador/6,altoJugador/6);
        ojo2.setFill(color(137, 137, 137));

        sprite.addChild(cuerpoJugador);
        sprite.addChild(boca);
        sprite.addChild(ojo1);
        sprite.addChild(ojo2);
        sprite.addChild(oreja1);
        sprite.addChild(oreja2);
        shape(sprite);
        */
    }

    void moverDerecha(){
        //asi se pega con los bordes
        if(x<anchoPantalla){
            x += velocidadDeMovimiento; 
        }
    }

    void moverIzquierda(){
        if(x > 0 ){
            x -= velocidadDeMovimiento; 
        }
    }

    Bala disparar(){

        Bala bala = new Bala(true,x-1,y-templateBala.altoBala-25,altoPantalla,anchoPantalla,templateBala.danioNJ);
        return bala;
    }

    //resetea la posicion y vidas de una entidad
    void resetearStats(){
        resetearAPosicionInicial();
        resetearVidas();
        resetearPuntajeActual();

    }

    void resetearVidas(){
        vidas = vidasIniciales;
    }

    void resetearPuntajeActual(){
        puntajeActual = 0;
    }

    void revisarSiNuevoPuntajeMaximo(){
        if(puntajeActual > puntajeMaximo){
            puntajeMaximo = puntajeActual;
        }
    }

}