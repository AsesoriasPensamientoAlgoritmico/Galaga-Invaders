int altoPantalla = 1000;
int anchoPantalla = 1000;

int contadorPerdidas = 0;

boolean primeraIteracion = true;
int contadorVecesFondoGenerado = 0;
ArrayList<PShape> estrellas = new ArrayList<PShape>();

int nivelActual = 0;


//Modo de ejecucion ayuda a diferenciar entre si se esta en el menu principal , el menu de pausa o el juego en si 
int modo = 0;


void setup(){
    size(1000,1000);
}


void draw(){
    dibujarFondo();

    //Menu Principal
    if(modo == 0){
        drawMenuPrincipal();
    }

    //Juego
    else if(modo == 1){
        drawJuego();
    }

    //Menu de Pausa
    else if(modo == 2){
        drawMenuPausa();
    }

    
}


/**
 * Dibuja el menu principal
*/
void drawMenuPrincipal(){
    //Base menu
    fill(color(200));
    rect(0, altoPantalla/10, anchoPantalla, altoPantalla*0.8);

    //Titulo
    fill(color(0));
    textSize(128);
    text("Titulo", 3*(anchoPantalla/10) , 4*(altoPantalla/10)); 

    //Boton iniciar
    noStroke();
    fill(color(100));
    rect(3*(anchoPantalla/10),5*(altoPantalla/10), 3.2*(anchoPantalla/10), (altoPantalla/10));
    fill(color(50));
    textSize(40);
    text("Iniciar",4*(anchoPantalla/10),5.65*(altoPantalla/10)); 

    //Revisar si se esta presionando el boton de inicio
    
    
    if( 3*(anchoPantalla/10) < mouseX && mouseX < 6.2*(anchoPantalla/10)){
        if(mouseY < 5*(altoPantalla/10) + (altoPantalla/10) && 5*(altoPantalla/10) < mouseY){
            //Colorear boton
            noStroke();
            fill(color(10));
            rect(3*(anchoPantalla/10),5*(altoPantalla/10), 3.2*(anchoPantalla/10), (altoPantalla/10));
            fill(color(30));
            textSize(40);
            text("Iniciar",4*(anchoPantalla/10),5.65*(altoPantalla/10));
            if(mousePressed && mouseButton == LEFT ){
                //Cambiar modo
                modo = 1;

                //Re dibujar el fonodo para borrar el menu
                contadorVecesFondoGenerado = 500;
                dibujarFondo();
            }
        }
    }
}

/**
 *
*/
void drawMenuPausa(){
    //Base menu
    fill(color(200));
    rect(2*anchoPantalla/10, 2*altoPantalla/10, anchoPantalla*0.6, altoPantalla*0.6);

    //Boton retornar
    fill(color(100));
    rect(anchoPantalla*0.4, altoPantalla*0.6, anchoPantalla*0.2, altoPantalla*0.1);
    fill(color(0));
    textSize(50);
    text("retornar",anchoPantalla*0.4 + 15, altoPantalla*0.675);

    if(mouseY>altoPantalla*0.6 && mouseY < altoPantalla*0.6 + altoPantalla*0.1){
        if(mouseX >anchoPantalla*0.4 && mouseX <anchoPantalla*0.4  + anchoPantalla*0.2 ){
            fill(color(150));
            rect(anchoPantalla*0.4, altoPantalla*0.6, anchoPantalla*0.2, altoPantalla*0.1);

            fill(color(0));
            textSize(50);
            text("retornar",anchoPantalla*0.4 + 15, altoPantalla*0.675);
            if(mousePressed && mouseButton == LEFT){
                modo = 1;
                //Re dibujar el fonodo para borrar el menu
                contadorVecesFondoGenerado = 500;
                dibujarFondo();
            }

            
        }
    }
}

/**
 *
*/
void drawJuego(){
    //Dibuja el boton de pausa
    fill(color(100));
    ellipse(anchoPantalla-30,30,20,20);

    if(mouseY>0 && mouseY < 60){
        if(mouseX > anchoPantalla-30 && mouseX < anchoPantalla ){
            fill(color(200));
            ellipse(anchoPantalla-30,30,20,20);
            if(mousePressed && mouseButton == LEFT){
                modo = 2;
                //Re dibujar el fonodo para borrar el menu
                contadorVecesFondoGenerado = 500;
                dibujarFondo();
            }

            
        }
    }
    

    //TODO: Crear el resto de elementos del juego
}

/*
 * Dibuja el espacio
*/
void dibujarFondo(){

    //cada 500 iteraciones del draw dibuja un set de nuevas estrellas en el espacio
    if(contadorVecesFondoGenerado == 500 || primeraIteracion == true){
        background(color(0));

        estrellas = new ArrayList<>();
        for(int i = 0 ; i < 100 ; i++){
            float x = random(anchoPantalla);
            float y = random(altoPantalla);
            float size = random(5);
            fill(color(255));
            PShape estrellaActual = createShape(ELLIPSE,x, y, size, size);
            estrellas.add(estrellaActual);
        }

        contadorVecesFondoGenerado = 0;
        primeraIteracion = false;
    }
    //Si no se esta en la iteracion 500 se sigue dibujando las estrellas que se guardaron antes
    else{
        contadorVecesFondoGenerado += 1;
        for(int i = 0;i < estrellas.size();i++){
            shape(estrellas.get(i));
        }
    }
    
}
