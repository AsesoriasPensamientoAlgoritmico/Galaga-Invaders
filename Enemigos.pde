class Enemigo extends BaseEntidad{
    
int vidasN1 = 1;
int vidasN2 = 2;
int vidasN3 = 3;
int vidasN4 = 4;

int anchoEnemigo = 40;
int altoEnemigo = 40;



Enemigo(int pix, int piy,int altoP, int anchoP){
    super( pix,  piy, altoP,  anchoP);

    //resto de cosas
    velocidadDeMovimiento = velMovimientoE;
}

    Bala disparar(){
        sonido();
    Bala bala = new Bala(false,x-1,y+templateBala.altoBala-25,altoPantalla,anchoPantalla,templateBala.danioNE);
    return bala;
    }

    //Sonido del enemigo cuando dispara
    void sonido(){
        System.out.println("Pow");
    }

    //Mueve el enemigo X posiciones abajo despues de que cierto tiempo ha pasado
    void avanzar(){
        if(0 < y && y < altoPantalla){
            y += velocidadDeMovimiento;
        }
    }

    //No funciona :(
    boolean estaAlFinalDePantalla(){
        if(y > altoPantalla){
            return true;
        }
        return false;
    }

}

class EnemigoNivel1 extends Enemigo{

    color colorEnemigoN1= color(85, 219, 125);

    EnemigoNivel1(int posicionInicialX, int posicionInicialY,int altoPantalla, int anchoPantalla){
        super( posicionInicialX,  posicionInicialY, altoPantalla,  anchoPantalla);

        //inicializa vidas
        vidas = vidasN1;
    }

    void render()
    {
        sprite = createShape(GROUP);

        PShape cuerpoEnemigo = createShape(RECT,x - anchoEnemigo/2,y - altoEnemigo/2,anchoEnemigo,altoEnemigo);
        cuerpoEnemigo.setFill(colorEnemigoN1);

        PShape oreja1 = createShape(RECT,x - anchoEnemigo/2-7,y - altoEnemigo/2 + 15,altoEnemigo/5,altoEnemigo/5);
        oreja1.setFill(colorEnemigoN1);

        PShape oreja2 = createShape(RECT,x + anchoEnemigo/2,y - altoEnemigo/2 + 15,altoEnemigo/5,altoEnemigo/5);
        oreja2.setFill(colorEnemigoN1);
        
        PShape boca = createShape(RECT,x - anchoEnemigo/4,y + altoEnemigo/4,anchoEnemigo*0.5,altoEnemigo/5);
        boca.setFill(color(137, 137, 137));

        PShape ojo1 = createShape(RECT,x - anchoEnemigo/4,y - altoEnemigo/4,altoEnemigo/6,altoEnemigo/6);
        ojo1.setFill(color(137, 137, 137));
        
        PShape ojo2 = createShape(RECT,x + anchoEnemigo/4 - 5,y - altoEnemigo/4,altoEnemigo/6,altoEnemigo/6);
        ojo2.setFill(color(137, 137, 137));

        sprite.addChild(cuerpoEnemigo);
        sprite.addChild(boca);
        sprite.addChild(ojo1);
        sprite.addChild(ojo2);
        sprite.addChild(oreja1);
        sprite.addChild(oreja2);
        shape(sprite);

    }

    
}

class EnemigoNivel2 extends Enemigo{

    color colorEnemigoN2= color(85, 219, 219);

        EnemigoNivel2(int posicionInicialX, int posicionInicialY,int altoPantalla, int anchoPantalla)
        {
            super( posicionInicialX,  posicionInicialY, altoPantalla,  anchoPantalla);

            vidas = vidasN2;
            }

    void render()
    {
        sprite = createShape(GROUP);

        PShape cuerpoEnemigo = createShape(RECT,x - anchoEnemigo/2,y - altoEnemigo/2,anchoEnemigo,altoEnemigo);
        cuerpoEnemigo.setFill(colorEnemigoN2);
        PShape oreja1 = createShape(RECT,x - anchoEnemigo/2-7,y - altoEnemigo/2 + 15,altoEnemigo/5,altoEnemigo/5);
        oreja1.setFill(colorEnemigoN2);

        PShape oreja2 = createShape(RECT,x + anchoEnemigo/2,y - altoEnemigo/2 + 15,altoEnemigo/5,altoEnemigo/5);
        oreja2.setFill(colorEnemigoN2);
        
        PShape boca = createShape(RECT,x - anchoEnemigo/4,y + altoEnemigo/4,anchoEnemigo*0.5,altoEnemigo/5);
        boca.setFill(color(137, 137, 137));

        PShape ojo1 = createShape(RECT,x - anchoEnemigo/4,y - altoEnemigo/4,altoEnemigo/6,altoEnemigo/6);
        ojo1.setFill(color(137, 137, 137));
        
        PShape ojo2 = createShape(RECT,x + anchoEnemigo/4 - 5,y - altoEnemigo/4,altoEnemigo/6,altoEnemigo/6);
        ojo2.setFill(color(137, 137, 137));

        sprite.addChild(cuerpoEnemigo);
        sprite.addChild(boca);
        sprite.addChild(ojo1);
        sprite.addChild(ojo2);
        sprite.addChild(oreja1);
        sprite.addChild(oreja2);
        shape(sprite);

    }
    
}

class EnemigoNivel3 extends Enemigo{

    color colorEnemigoN3= color(234, 216, 82);

    EnemigoNivel3(int posicionInicialX, int posicionInicialY,int altoPantalla, int anchoPantalla)
    {
    super( posicionInicialX,  posicionInicialY, altoPantalla,  anchoPantalla);

        //inicializa vidas
        vidas = vidasN3;
    }

    void render()
    {
        sprite = createShape(GROUP);

        PShape cuerpoEnemigo = createShape(RECT,x - anchoEnemigo/2,y - altoEnemigo/2,anchoEnemigo,altoEnemigo);
        cuerpoEnemigo.setFill(colorEnemigoN3);

        PShape oreja1 = createShape(RECT,x - anchoEnemigo/2-7,y - altoEnemigo/2 + 15,altoEnemigo/5,altoEnemigo/5);
        oreja1.setFill(colorEnemigoN3);

        PShape oreja2 = createShape(RECT,x + anchoEnemigo/2,y - altoEnemigo/2 + 15,altoEnemigo/5,altoEnemigo/5);
        oreja2.setFill(colorEnemigoN3);
        
        PShape boca = createShape(RECT,x - anchoEnemigo/4,y + altoEnemigo/4,anchoEnemigo*0.5,altoEnemigo/5);
        boca.setFill(color(137, 137, 137));

        PShape ojo1 = createShape(RECT,x - anchoEnemigo/4,y - altoEnemigo/4,altoEnemigo/6,altoEnemigo/6);
        ojo1.setFill(color(137, 137, 137));
        
        PShape ojo2 = createShape(RECT,x + anchoEnemigo/4 - 5,y - altoEnemigo/4,altoEnemigo/6,altoEnemigo/6);
        ojo2.setFill(color(137, 137, 137));

        sprite.addChild(cuerpoEnemigo);
        sprite.addChild(boca);
        sprite.addChild(ojo1);
        sprite.addChild(ojo2);
        sprite.addChild(oreja1);
        sprite.addChild(oreja2);
        shape(sprite);

    }
}

class EnemigoNivel4 extends Enemigo{

    color colorEnemigoN4= color(247, 76, 76);
    EnemigoNivel4(int posicionInicialX, int posicionInicialY,int altoPantalla, int anchoPantalla){
        super( posicionInicialX,  posicionInicialY, altoPantalla,  anchoPantalla);

        //inicializa vidas
        vidas = vidasN4;
    }

    void render()
    {
        sprite = createShape(GROUP);

        PShape cuerpoEnemigo = createShape(RECT,x - anchoEnemigo/2,y - altoEnemigo/2,anchoEnemigo,altoEnemigo);
        cuerpoEnemigo.setFill(colorEnemigoN4);
        PShape oreja1 = createShape(RECT,x - anchoEnemigo/2-7,y - altoEnemigo/2 + 15,altoEnemigo/5,altoEnemigo/5);
        oreja1.setFill(colorEnemigoN4);

        PShape oreja2 = createShape(RECT,x + anchoEnemigo/2,y - altoEnemigo/2 + 15,altoEnemigo/5,altoEnemigo/5);
        oreja2.setFill(colorEnemigoN4);
        
        PShape boca = createShape(RECT,x - anchoEnemigo/4,y + altoEnemigo/4,anchoEnemigo*0.5,altoEnemigo/5);
        boca.setFill(color(137, 137, 137));

        PShape ojo1 = createShape(RECT,x - anchoEnemigo/4,y - altoEnemigo/4,altoEnemigo/6,altoEnemigo/6);
        ojo1.setFill(color(137, 137, 137));
        
        PShape ojo2 = createShape(RECT,x + anchoEnemigo/4 - 5,y - altoEnemigo/4,altoEnemigo/6,altoEnemigo/6);
        ojo2.setFill(color(137, 137, 137));

        sprite.addChild(cuerpoEnemigo);
        sprite.addChild(boca);
        sprite.addChild(ojo1);
        sprite.addChild(ojo2);
        sprite.addChild(oreja1);
        sprite.addChild(oreja2);
        shape(sprite);

    }

    
}