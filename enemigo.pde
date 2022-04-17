class Enemigo extends BaseEntidad{
       
    Enemigo(int posicionInicialX, int posicionInicialY,int altoPantalla, int anchoPantalla){
        super( posicionInicialX,  posicionInicialY, altoPantalla,  anchoPantalla);

        //resto de cosas
        this.velocidadDeMovimiento = VELOCIDAD_MOVIMIENTO_BASE_ENEMIGO;
    }


     //dispara un proyectil normal
    //crea un proyectil tipo enemigo desde la posicion del enemigo para que el mundo como añada a su lista de proyectiles vivos
    Bala disparar(){
             sonido();
        int danio = templateBala.getDanioBalaNormalE();
                    Bala bala = new Bala(false,getX()-1,getY()+templateBala.ALTO_BALA-25,getAltoPantalla(),getAnchoPantalla(),danio);
                    return bala;
                }

    //Sonido del enemigo cuando dispara
            void sonido(){
                    System.out.println("Pow");
            }

    //Mueve el enemigo X posiciones abajo despues de que cierto tiempo ha pasado
                void avanzar(){
                    if(0 < getY() && getY() < getAltoPantalla()){
            int nuevoY = getY();
            nuevoY += getVelocidadDeMovimiento();
            setY(nuevoY);
        }
                }

    //revisa si el enemigo esta al final de la pantalla (Y)
    boolean estaAlFinalDePantalla(){
if(getY() > getAltoPantalla()){
    return true;
}return false;
    }


    int NUMERO_VIDAS_NIVEL_1 = 1;
    int NUMERO_VIDAS_NIVEL_2 = 2;
    int NUMERO_VIDAS_NIVEL_3 = 3;
    int NUMERO_VIDAS_NIVEL_4 = 4;
    int ANCHO_ENEMIGO = 40;
    int ALTO_ENEMIGO = 40;

}

class EnemigoNivel1 extends Enemigo{
color colorEnemigoN1= color(255,255,255);

EnemigoNivel1(int posicionInicialX, int posicionInicialY,int altoPantalla, int anchoPantalla){
        super( posicionInicialX,  posicionInicialY, altoPantalla,  anchoPantalla);//en el tutaorrial decia que con esto sacaba las propiedadesd eenemigo

        this.vidas = NUMERO_VIDAS_NIVEL_1;
    }

void render(){
        sprite = createShape(GROUP);

int puntoX = getX() - ANCHO_ENEMIGO/2;
int puntoY = getY() - ALTO_ENEMIGO/2;

        PShape cuerpoEnemigo = createShape(RECT,puntoX,puntoY,ANCHO_ENEMIGO,ALTO_ENEMIGO);
    cuerpoEnemigo.setFill(colorEnemigoN1);
sprite.addChild(cuerpoEnemigo);
shape(sprite);

    }

    
}

class EnemigoNivel2 extends Enemigo{

color colorEnemigoN2= color(201, 201, 201);

EnemigoNivel2(int posicionInicialX, int posicionInicialY,int altoPantalla, int anchoPantalla){
        super( posicionInicialX,  posicionInicialY, altoPantalla,  anchoPantalla);
         this.vidas = NUMERO_VIDAS_NIVEL_2;
    }

void render(){
sprite = createShape(GROUP);

int puntoX = getX() - ANCHO_ENEMIGO/2;
int puntoY = getY() - ALTO_ENEMIGO/2;

            PShape cuerpoEnemigo = createShape(RECT,puntoX,puntoY,ANCHO_ENEMIGO,ALTO_ENEMIGO);
        cuerpoEnemigo.setFill(colorEnemigoN2);
    sprite.addChild(cuerpoEnemigo);
    shape(sprite);

}

    
}

class EnemigoNivel3 extends Enemigo{

    color colorEnemigoN3= color(135, 135, 135);

    EnemigoNivel3(int posicionInicialX, int posicionInicialY,int altoPantalla, int anchoPantalla){
super( posicionInicialX,  posicionInicialY, altoPantalla,  anchoPantalla);
this.vidas = NUMERO_VIDAS_NIVEL_3;
}

    void render(){
sprite = createShape(GROUP);

int puntoX = getX() - ANCHO_ENEMIGO/2;
int puntoY = getY() - ALTO_ENEMIGO/2;

PShape cuerpoEnemigo = createShape(RECT,puntoX,puntoY,ANCHO_ENEMIGO,ALTO_ENEMIGO);
cuerpoEnemigo.setFill(colorEnemigoN3);
sprite.addChild(cuerpoEnemigo);
shape(sprite);

    }

    
}

class EnemigoNivel4 extends Enemigo{
color colorEnemigoN4= color(94, 94, 94);

EnemigoNivel4(int posicionInicialX, int posicionInicialY,int altoPantalla, int anchoPantalla)
{
        super( posicionInicialX,  posicionInicialY, altoPantalla,  anchoPantalla);
        this.vidas = NUMERO_VIDAS_NIVEL_4;
                                            }

void render(){
            sprite = createShape(GROUP);

    int puntoX = getX() - ANCHO_ENEMIGO/2;int puntoY = getY() - ALTO_ENEMIGO/2;

PShape cuerpoEnemigo = createShape(RECT,puntoX,puntoY,ANCHO_ENEMIGO,ALTO_ENEMIGO);
cuerpoEnemigo.setFill(colorEnemigoN4);sprite.addChild(cuerpoEnemigo);
shape(sprite);
}


}
