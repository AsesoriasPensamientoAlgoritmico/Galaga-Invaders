class Jugador extends BaseEntidad{
    
    String nombreJugador;
    int puntajeActual;
    int maximoPuntajeHistorico;
    int numeroVidasComienzo = 3;
    int anchoJugador = 40;
    int altoJugador = 40;

    Jugador(int pix, int piy,int altoPantalla, int anchoPantalla, String nombre ){
        //Hereda de la clase padre que es baseEntidaad
        super(pix,piy,altoPantalla,anchoPantalla);

        nombreJugador = nombre;
        vidas = numeroVidasComienzo;
        puntajeActual = 0; //el puntaje de un jugador siempre inicia en cero
        maximoPuntajeHistorico = 0; //al crear un jugador su puntaje maximo inicia en cero
        velocidadDeMovimiento = velMovimientoJ;
    }

    void renderJugador(){
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

    //Cuando algun bono se alcanze se aplica un acelere enla velocidad de movimiento base
    void boostVelocidadMovimiento(int v){
        velocidadDeMovimiento += v;
    }

    //Cuando alguna penalizacion se de se da un acelere enla velocidad de movimiento base
    void penalizacionVelocidadMovimiento(int v){
        velocidadDeMovimiento -= v;
    }

    Bala disparar(){
        //Imprime sonido pew en consola
        sonido();

        Bala bala = new Bala(true,x-1,y-templateBala.altoBala-25,altoPantalla,anchoPantalla,templateBala.danioNJ);
        return bala;
    }

    //dispara un proyectil especial con mas daño(a mitad de velocidad de uno normal)
    Bala dispararEspecial(){
        //Imprime sonido pew en consola
        sonido();

        Bala bala = new Bala(true,x,y+10,altoPantalla,anchoPantalla,templateBala.danioEJ);
        return bala;
    }

    //sonido del jugador cuando dispara
    void sonido(){
       System.out.println("Pew");//imprime esto
    }

    void sumarAPuntajeActual(int puntos){
        puntajeActual = puntajeActual+puntos;
    }

    void actualizarMaximoPuntajeHistorico(){
        if(puntajeActual>maximoPuntajeHistorico){
            maximoPuntajeHistorico=puntajeActual;
        }
    }
    
}