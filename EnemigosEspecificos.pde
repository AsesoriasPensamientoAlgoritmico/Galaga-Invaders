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
