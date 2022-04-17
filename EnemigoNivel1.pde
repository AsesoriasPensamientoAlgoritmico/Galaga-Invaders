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
