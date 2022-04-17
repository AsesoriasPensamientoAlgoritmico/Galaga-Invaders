int altoPantalla = 1000;
int anchoPantalla = 1000;

int contadorPerdidas = 0;

boolean primeraIteracion = true;
int contadorVecesFondoGenerado = 0;//muchas cosas dependeran de este contador (como el avanze de los enemigos)
ArrayList<PShape> estrellas = new ArrayList<PShape>();


int nivelActual = 0;

//Modo de ejecucion
int modomenuprincipal = 0;
int modojuego = 1;
int modomenupausa = 2;

int modo = modomenuprincipal;

//el jugador tiene que poderse acceder desde todos lados
Jugador jugador;

//Manejo de balas
ArrayList<Bala> listaBalas = new ArrayList<Bala>();

//Listas de enemigos
ArrayList<EnemigoNivel1> listaEnemigosNivel1 = new ArrayList<EnemigoNivel1>();
ArrayList<EnemigoNivel2> listaEnemigosNivel2 = new ArrayList<EnemigoNivel2>();
ArrayList<EnemigoNivel3> listaEnemigosNivel3 = new ArrayList<EnemigoNivel3>();
ArrayList<EnemigoNivel4> listaEnemigosNivel4 = new ArrayList<EnemigoNivel4>();



void setup(){
    size(1000,1000);

    int posicionInicialXJugador = anchoPantalla/2;
    int posicionInicialYJugador = int(altoPantalla*0.9);

    jugador = new Jugador(posicionInicialXJugador,posicionInicialYJugador,altoPantalla,anchoPantalla, "Felipe");
    
    int posicionInicialYEnemigos = int(altoPantalla*0.1);

    int posicionInicialXEnemigoN1 = int(anchoPantalla*1/5);
    EnemigoNivel1 eneN1 = new EnemigoNivel1( posicionInicialXEnemigoN1,  posicionInicialYEnemigos, altoPantalla,  anchoPantalla);
    listaEnemigosNivel1.add(eneN1);

    int posicionInicialXEnemigoN2 = int(anchoPantalla*2/5);
    EnemigoNivel2 eneN2 = new EnemigoNivel2( posicionInicialXEnemigoN2,  posicionInicialYEnemigos, altoPantalla,  anchoPantalla);
    listaEnemigosNivel2.add(eneN2);

    int posicionInicialXEnemigoN3 = int(anchoPantalla*3/5);
    EnemigoNivel3 eneN3 = new EnemigoNivel3( posicionInicialXEnemigoN3,  posicionInicialYEnemigos, altoPantalla,  anchoPantalla);
    listaEnemigosNivel3.add(eneN3);

    int posicionInicialXEnemigoN4 = int(anchoPantalla*4/5);
    EnemigoNivel4 eneN4 = new EnemigoNivel4( posicionInicialXEnemigoN4,  posicionInicialYEnemigos, altoPantalla,  anchoPantalla);
    listaEnemigosNivel4.add(eneN4);
}


void draw(){

    dibujarFondo();
    
    //Menu Principal
    if(modo == modomenuprincipal){
        drawmodomenuprincipal();
    }
    //modojuego
    else if(modo == modojuego){
        drawmodojuego();
        
    }
    //Menu de Pausa
    else if(modo == modomenupausa){
        drawMenuPausa();
    }    
}

void drawmodojuego(){
    
    //Dibuja el boton de pausa
    fill(color(100));
    ellipse(anchoPantalla-30,30,20,20);

    if(mouseY>0 && mouseY < 60){
        if(mouseX > anchoPantalla-30 && mouseX < anchoPantalla ){
            fill(color(200));
            ellipse(anchoPantalla-30,30,20,20);
            if(mousePressed && mouseButton == LEFT){
                modo = modomenupausa;
                //Re dibujar el fonodo para borrar el menu
                contadorVecesFondoGenerado = 500;
                dibujarFondo();
            }          
        }
    }


    //Dibujar jugador
    jugador.renderJugador();

    //https://processing.org/reference/keyCode.html
    if(keyPressed == true){
        if(key == CODED || esTeclaAD()){
            if(keyCode == LEFT || key == 'a' || key == 'A'){
                jugador.moverIzquierda();
            }
            if(keyCode == RIGHT || key == 'd' || key == 'D'){
                jugador.moverDerecha();
            }
        }
        if(key != CODED && !esTeclaAD()){
            if(contadorVecesFondoGenerado%10==0){
                Bala nuevaBala = jugador.disparar();//crea bala    
                listaBalas.add(nuevaBala);//añade bala a lista de balas activas
            }
        }
    }

    //Enemigos

    dibujarYAvanzarEnemigos();
    enemigosDisparan();

    //MANEJO BALAS
    
    dibujarYAvanzarTodasLasBalasActivas();
     revisarImpactosBalas();
    revisarBalasFueraDeRango();
    revisarBalasColisonaron();
    sacarBalasInactivas();
}

void sacarBalasInactivas(){
    for(int i = 0 ; i < listaBalas.size();i++){
        Bala balaActual = listaBalas.get(i);
        if(balaActual.visible==false){
            listaBalas.remove(i);// https://beginnersbook.com/2013/12/java-arraylist-remove-method-example/#:~:text=Method%20remove(int%20index)%20is,(index%20size%20of%20ArrayList).
        }
    }
}

void revisarBalasFueraDeRango(){
  for(int i = 0 ; i < listaBalas.size();i++){
      Bala bala = listaBalas.get(i);
      bala.volverInvisibleSiFueraDeRangoPantalla();
  }
}


void revisarBalasColisonaron(){
  for(int i = 0 ; i < listaBalas.size();i++){
      Bala balaI = listaBalas.get(i);
      for(int j = 0 ; j < listaBalas.size();j++){
        Bala balaJ = listaBalas.get(j);
if(balaI.x < balaJ.x && balaJ.x < balaI.x + balaI.anchoBala){
            if(balaI.y < balaJ.y && balaJ.y < balaI.y + balaI.altoBala){
                balaJ.visible = false;
                balaI.visible = false;
            }
        }
    }
  }
}

//toca cambiar esto para que sea aleatorio
void enemigosDisparan(){
    for(int i = 0; i < listaEnemigosNivel1.size();i++){
        EnemigoNivel1 enemigo = listaEnemigosNivel1.get(i);
        if(contadorVecesFondoGenerado%100==0){
            Bala bala = enemigo.disparar();
            listaBalas.add(bala);
        }
    }

     for(int i = 0; i < listaEnemigosNivel2.size();i++){
        EnemigoNivel2 enemigo = listaEnemigosNivel2.get(i);
        if(contadorVecesFondoGenerado%100==0){
            Bala bala = enemigo.disparar();
            listaBalas.add(bala);
        }
    }

     for(int i = 0; i < listaEnemigosNivel3.size();i++){
        EnemigoNivel3 enemigo = listaEnemigosNivel3.get(i);
        if(contadorVecesFondoGenerado%100==0){
            Bala bala = enemigo.disparar();
            listaBalas.add(bala);
        }
    }

     for(int i = 0; i < listaEnemigosNivel4.size();i++){
        EnemigoNivel4 enemigo = listaEnemigosNivel4.get(i);
        if(contadorVecesFondoGenerado%100==0){
            Bala bala = enemigo.disparar();
            listaBalas.add(bala);
        }
    }

}

void dibujarYAvanzarTodasLasBalasActivas(){
    for(int i = 0 ; i < listaBalas.size();i++){
        Bala bala = listaBalas.get(i);
        bala.render();
        bala.avanzar();
    }
}

//Revisa si alguna de las balas en la lista de balas le impacto a alguien
void revisarImpactosBalas(){
    ArrayList<Bala> listaBalasQueImpactaron = new ArrayList<Bala>();

    for(int i = 0; i < listaBalasQueImpactaron.size();i++){
        Bala balaQueImpacto = listaBalasQueImpactaron.get(i);//saca una de las balas que impacto
       
        balaQueImpacto.visible = false;
    }
}

void dibujarYAvanzarEnemigos(){
    for(int i = 0; i < listaEnemigosNivel1.size();i++){
        EnemigoNivel1 enemigo = listaEnemigosNivel1.get(i);
        enemigo.render();
        if(contadorVecesFondoGenerado==500){
            enemigo.avanzar();
        }
    }

     for(int i = 0; i < listaEnemigosNivel2.size();i++){
        EnemigoNivel2 enemigo = listaEnemigosNivel2.get(i);
        enemigo.render();
        if(contadorVecesFondoGenerado==500){
            enemigo.avanzar();
        }
    }

     for(int i = 0; i < listaEnemigosNivel3.size();i++){
        EnemigoNivel3 enemigo = listaEnemigosNivel3.get(i);
        enemigo.render();
        if(contadorVecesFondoGenerado==500){
            enemigo.avanzar();
        }
    }

     for(int i = 0; i < listaEnemigosNivel4.size();i++){
        EnemigoNivel4 enemigo = listaEnemigosNivel4.get(i);
        enemigo.render();
        if(contadorVecesFondoGenerado==500){
            enemigo.avanzar();
        }
    }

}

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
        background(color(0));
        for(int i = 0;i < estrellas.size();i++){
            shape(estrellas.get(i));
        }
    }
    
}

//revisa si una tecla es WASD
boolean esTeclaAD(){
    if(keyPressed == true){
        if(key == 'a' || key == 'A'){
            return true;
        }
        if(key == 'd' || key == 'D'){
            return true;
        }
    }
    return false;

}

























void drawmodomenuprincipal(){
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
                modo = modojuego;

                //Re dibujar el fonodo para borrar el menu
                contadorVecesFondoGenerado = 500;
                dibujarFondo();
            }
        }
    }
}


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
                modo = modojuego;
                //Re dibujar el fonodo para borrar el menu
                contadorVecesFondoGenerado = 500;
                dibujarFondo();
            }

            
        }
    }
}