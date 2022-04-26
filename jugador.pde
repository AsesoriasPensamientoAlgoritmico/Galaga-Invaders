class Jugador extends BaseEntidad{
    
    String nombreJugador;
    int anchoJugador = 40;
    int altoJugador = 40;

    Jugador(int pix, int piy,int altoPantalla, int anchoPantalla, String nombre ){
        //Hereda de la clase padre que es baseEntidaad
        super(pix,piy,altoPantalla,anchoPantalla);

        nombreJugador = nombre;
        velocidadDeMovimiento = velMovimientoJ;
    }

    void renderJugador(){
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

}