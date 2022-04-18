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
    Bala bala = new Bala(false,x-1,y+templateBala.altoBala-25,altoPantalla,anchoPantalla,templateBala.danioBalaNE);
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

    boolean estaAlFinalDePantalla(){
        if(y > altoPantalla){
            return true;
        }
        return false;
    }

}

class EnemigoNivel1 extends Enemigo{

    color colorEnemigoN1= color(255,255,255);

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
        sprite.addChild(cuerpoEnemigo);
        shape(sprite);

    }

    
}

class EnemigoNivel2 extends Enemigo{

    color colorEnemigoN2= color(201, 201, 201);

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
        sprite.addChild(cuerpoEnemigo);
        shape(sprite);

    }
    
}

class EnemigoNivel3 extends Enemigo{

    color colorEnemigoN3= color(135, 135, 135);

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
        sprite.addChild(cuerpoEnemigo);
        shape(sprite);

    }
}
class EnemigoNivel4 extends Enemigo{

    color colorEnemigoN4= color(94, 94, 94);
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
        sprite.addChild(cuerpoEnemigo);
        shape(sprite);

    }

    
}