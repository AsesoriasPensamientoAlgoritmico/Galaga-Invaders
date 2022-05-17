//guardo esta variable para que cambiar el tamaño de la pantalla sea facil
int altoPantalla = 800;
int anchoPantalla = 800;

boolean primera = true;
int contadorVecesFondoGenerado = 0;

//el jugador tiene que poderse acceder desde todos lados
Jugador jugador;

//Manejo de balas
ArrayList<Bala> listaBalas = new ArrayList<Bala>();

//Listas de enemigos
ArrayList<EnemigoNivel1> listaEnemigosNivel1 = new ArrayList<EnemigoNivel1>();
ArrayList<EnemigoNivel2> listaEnemigosNivel2 = new ArrayList<EnemigoNivel2>();
ArrayList<EnemigoNivel3> listaEnemigosNivel3 = new ArrayList<EnemigoNivel3>();
ArrayList<EnemigoNivel4> listaEnemigosNivel4 = new ArrayList<EnemigoNivel4>();

//Variable para cambiar de pantalla
int modo = 0;
int INICIO = 0;
int INSTRUCCIONES = 1;
int CONTROLES = 2;
int JUEGO = 3;
int GAMEOVER = 4;


PImage imagenInicio;
PImage gameOver;
PImage fondo;
PImage instrucciones;
PImage controles;

void setup(){
    size(800,800);

    int posicionInicialXJugador = anchoPantalla/2;
    int posicionInicialYJugador = int(altoPantalla*0.9);
    
    jugador = new Jugador(posicionInicialXJugador,posicionInicialYJugador,altoPantalla,anchoPantalla, "Felipe");
    
    generarEnemigos();
    
}

void draw(){
    
    if(modo==INICIO){
        drawInicio();
    }
    if(modo == INSTRUCCIONES){
        drawInstrucciones();
    }
    if(modo == CONTROLES){
        drawControles();
    }
    if(modo == JUEGO){
        dibujarFondo();
        drawjuego();
    }
    if(modo == GAMEOVER){
        drawGameOver();
    }
}


void drawInicio(){
    imagenInicio = loadImage("StartScreen.jpg");
    image(imagenInicio,-15,0);
    if(mousePressed){
        if(290 < mouseX && mouseX < 500){
            if(370 < mouseY && mouseY < 430){
                modo = INSTRUCCIONES;
            }
        }
    }
    //290  a 500 X
    //370 a 430 Y
}

void drawInstrucciones(){
    imagenInicio = loadImage("Instrucciones.jpg");
    image(imagenInicio,0,0);
    if(mousePressed){
        if(330 < mouseX && mouseX < 505){
            if(700 < mouseY && mouseY < 760){
                modo = CONTROLES;
            }
        }
    }
}

void drawControles(){
    imagenInicio = loadImage("Controles.jpg");
    image(imagenInicio,0,0);
    if(mousePressed){
        if(330 < mouseX && mouseX < 510){
            if(580 < mouseY && mouseY < 640){
                modo = JUEGO;
            }
        }
    }
}

void drawGameOver(){
    gameOver = loadImage("GameOver.jpg");
    image(gameOver,0,0);

    resetearEstadoJuego();
    if(mousePressed){
        if(215 < mouseX && mouseX < 490){
            if(410 < mouseY && mouseY < 550){
                modo = JUEGO;
            }
        }
    }

}

void drawjuego(){
    
    jugador.renderJugador();//Dibujar jugador
    jugador.revisarSiNuevoPuntajeMaximo();

    //https://processing.org/reference/keyCode.html
    if(keyPressed == true){
        if(key == CODED ){
            if(keyCode == LEFT ){
                jugador.moverIzquierda();
            }
            if(keyCode == RIGHT){
                jugador.moverDerecha();
            }
        }
        if(key != CODED ){
            if(contadorVecesFondoGenerado%20==0){
                Bala nuevaBala = jugador.disparar();//crea bala    
                listaBalas.add(nuevaBala);//añade bala a lista de balas activas
            }
        }
    }

    revisarSiJugadorImpactado();

    //Enemigos
    revisarSiEnemigoImpactado();
    dibujarYAvanzarEnemigos();
    enemigosDisparan();

    //MANEJO BALAS
    dibujarYAvanzarTodasLasBalas();
    revisarBalasFueraDeRango();
    revisarBalasColisonaron();

    //Borrar cosas que ya no existen
    sacarBalasInactivas();
    sacarEnemigosInactivos();
}

void revisarSiJugadorImpactado(){
    for(int i = 0 ; i < listaBalas.size();i++){
        Bala b = listaBalas.get(i);
        if(jugador.x - jugador.anchoJugador/2 <= b.x && b.x <= jugador.x + jugador.anchoJugador/2 ){
            if(jugador.y - jugador.altoJugador/2  <= b.y && b.y <= jugador.y+ jugador.altoJugador/2){
                jugador.quitarVida();
                b.visible = false;
                //revisa si esta muerto
                if(jugador.revisarSiMuerto()== true){
                    modo = GAMEOVER;
                    resetearEstadoJuego();
                }
            }
        }
    }
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

void sacarEnemigosInactivos(){
    for(int i = 0; i < listaEnemigosNivel1.size(); i++){
        EnemigoNivel1 e = listaEnemigosNivel1.get(i);
        if(e.estatus == false){
            listaEnemigosNivel1.remove(e);
        }
    }

    for(int i = 0; i < listaEnemigosNivel2.size(); i++){
        EnemigoNivel2 e = listaEnemigosNivel2.get(i);
        if(e.estatus == false){
            listaEnemigosNivel2.remove(e);
        }
    }

    for(int i = 0; i < listaEnemigosNivel3.size(); i++){
        EnemigoNivel3 e = listaEnemigosNivel3.get(i);
        if(e.estatus == false){
            listaEnemigosNivel3.remove(e);
        }
    }

    for(int i = 0; i < listaEnemigosNivel4.size(); i++){
        EnemigoNivel4 e = listaEnemigosNivel4.get(i);
        if(e.estatus == false){
            listaEnemigosNivel4.remove(e);
        }
    }

}

void revisarSiEnemigoImpactado(){
    for(int i = 0 ; i < listaEnemigosNivel1.size();i++){
        EnemigoNivel1 enemigo = listaEnemigosNivel1.get(i); 
        int posienx = enemigo.x;
        int posieny = enemigo.y;
        for(int j = 0 ; j < listaBalas.size(); j++){
            Bala b = listaBalas.get(j);
            
            if((posienx - enemigo.anchoEnemigo/2 <= b.x && b.x <= posienx + enemigo.anchoEnemigo/2) || (posienx - enemigo.anchoEnemigo/2 <= b.x+b.anchoBala/2 && b.x+b.anchoBala/2 <= posienx + enemigo.anchoEnemigo/2 )|| (posienx - enemigo.anchoEnemigo/2 <= b.x-b.anchoBala/2 && b.x-b.anchoBala/2 <= posienx + enemigo.anchoEnemigo/2 )){
                
                if((posieny - enemigo.altoEnemigo/2  <= b.y && b.y <= posieny + enemigo.altoEnemigo/2)){
                    //reduce la visibilidad de la bala que impacto
                    b.visible = false;

                    //quitar vida
                    enemigo.quitarVida();

                    //revisa si esta muerto
                    if(enemigo.revisarSiMuerto()== true){
                        enemigo.estatus = false;
                    }

                }
            }
        }

    }

    for(int i = 0 ; i < listaEnemigosNivel2.size();i++){
        EnemigoNivel2 enemigo = listaEnemigosNivel2.get(i); 
        int posienx = enemigo.x;
        int posieny = enemigo.y;
        for(int j = 0 ; j < listaBalas.size(); j++){
            Bala b = listaBalas.get(j);
        
            if((posienx - enemigo.anchoEnemigo/2 <= b.x && b.x <= posienx + enemigo.anchoEnemigo/2) || (posienx - enemigo.anchoEnemigo/2 <= b.x+b.anchoBala/2 && b.x+b.anchoBala/2 <= posienx + enemigo.anchoEnemigo/2 )|| (posienx - enemigo.anchoEnemigo/2 <= b.x-b.anchoBala/2 && b.x-b.anchoBala/2 <= posienx + enemigo.anchoEnemigo/2 )){
                if(posieny - enemigo.altoEnemigo/2  <= b.y && b.y <= posieny + enemigo.altoEnemigo/2){
                    
                    //reduce la visibilidad de la bala que impacto
                    b.visible = false;

                    //quitar vida
                    enemigo.quitarVida();

                    //revisa si esta muerto
                    if(enemigo.revisarSiMuerto()== true){
                        enemigo.estatus = false;
                    }

                }
            }
        }

    }

    for(int i = 0 ; i < listaEnemigosNivel3.size();i++){
        EnemigoNivel3 enemigo = listaEnemigosNivel3.get(i); 
        int posienx = enemigo.x;
        int posieny = enemigo.y;
        for(int j = 0 ; j < listaBalas.size(); j++){
            Bala b = listaBalas.get(j);
            
            if((posienx - enemigo.anchoEnemigo/2 <= b.x && b.x <= posienx + enemigo.anchoEnemigo/2) || (posienx - enemigo.anchoEnemigo/2 <= b.x+b.anchoBala/2 && b.x+b.anchoBala/2 <= posienx + enemigo.anchoEnemigo/2 )|| (posienx - enemigo.anchoEnemigo/2 <= b.x-b.anchoBala/2 && b.x-b.anchoBala/2 <= posienx + enemigo.anchoEnemigo/2 )){
                if(posieny - enemigo.altoEnemigo/2  <= b.y && b.y <= posieny + enemigo.altoEnemigo/2){
                    //reduce la visibilidad de la bala que impacto
                    b.visible = false;

                    //quitar vida
                    enemigo.quitarVida();

                    //revisa si esta muerto
                    if(enemigo.revisarSiMuerto()== true){
                        enemigo.estatus = false;
                    }

                }
            }
        }

    }

    for(int i = 0 ; i < listaEnemigosNivel4.size();i++){
        EnemigoNivel4 enemigo = listaEnemigosNivel4.get(i); 
        int posienx = enemigo.x;
        int posieny = enemigo.y;
        for(int j = 0 ; j < listaBalas.size(); j++){
            Bala b = listaBalas.get(j);
            
            if((posienx - enemigo.anchoEnemigo/2 <= b.x && b.x <= posienx + enemigo.anchoEnemigo/2) || (posienx - enemigo.anchoEnemigo/2 <= b.x+b.anchoBala/2 && b.x+b.anchoBala/2 <= posienx + enemigo.anchoEnemigo/2 )|| (posienx - enemigo.anchoEnemigo/2 <= b.x-b.anchoBala/2 && b.x-b.anchoBala/2 <= posienx + enemigo.anchoEnemigo/2 )){
                if(posieny - enemigo.altoEnemigo/2  <= b.y && b.y <= posieny + enemigo.altoEnemigo/2){
                    //reduce la visibilidad de la bala que impacto
                    b.visible = false;

                    //quitar vida
                    enemigo.quitarVida();

                    //revisa si esta muerto
                    if(enemigo.revisarSiMuerto()== true){
                        enemigo.estatus = false;
                    }

                }
            }
        }

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
    //resetear todos a que pueden disparar
    for(int a = 0 ; a < listaEnemigosNivel1.size();a++){
        EnemigoNivel1 e = listaEnemigosNivel1.get(a);
        e.puedeDisparar = true;
    }
    for(int a = 0 ; a < listaEnemigosNivel2.size();a++){
        EnemigoNivel2 e = listaEnemigosNivel2.get(a);
        e.puedeDisparar = true;
    }

    for(int a = 0 ; a < listaEnemigosNivel3.size();a++){
        EnemigoNivel3 e = listaEnemigosNivel3.get(a);
        e.puedeDisparar = true;
    }

    for(int a = 0 ; a < listaEnemigosNivel4.size();a++){
        EnemigoNivel4 e = listaEnemigosNivel4.get(a);
        e.puedeDisparar = true;
    }


    //quita a todos los que no pueden disparar
    for(int a = 0 ; a < listaEnemigosNivel2.size();a++){
        EnemigoNivel2 eN2 = listaEnemigosNivel2.get(a);
        for(int b = 0 ; b < listaEnemigosNivel1.size();b++){
            EnemigoNivel1 eN1 = listaEnemigosNivel1.get(b);
            if(eN2.x == eN1.x){
                eN2.puedeDisparar = false;
            }
        }   
    }

    for(int a = 0 ; a < listaEnemigosNivel3.size();a++){
        EnemigoNivel3 eN3 = listaEnemigosNivel3.get(a);
        for(int b = 0 ; b < listaEnemigosNivel2.size();b++){
            EnemigoNivel2 eN2 = listaEnemigosNivel2.get(b);
            if(eN3.x == eN2.x){
                eN3.puedeDisparar = false;
            }
        }   
    }

    for(int a = 0 ; a < listaEnemigosNivel4.size();a++){
        EnemigoNivel4 eN4 = listaEnemigosNivel4.get(a);
        for(int b = 0 ; b < listaEnemigosNivel3.size();b++){
            EnemigoNivel3 eN3 = listaEnemigosNivel3.get(b);
            if(eN4.x == eN3.x){
                eN4.puedeDisparar = false;
            }
        }   
    }

    //revisa quien esta clear para disparar y los añade a una lista

    ArrayList<Object> eneDisp = new ArrayList<Object>();

    //añaden los que pueden disparar y los mete a una lista
    
    for(int a = 0 ; a < listaEnemigosNivel1.size();a++){
        EnemigoNivel1 e = listaEnemigosNivel1.get(a);
        if(e.puedeDisparar == true){
            eneDisp.add(e);
        }
    }
    for(int a = 0 ; a < listaEnemigosNivel2.size();a++){
        EnemigoNivel2 e = listaEnemigosNivel2.get(a);
        if(e.puedeDisparar == true){
            eneDisp.add(e);
        }
    }

    for(int a = 0 ; a < listaEnemigosNivel3.size();a++){
        EnemigoNivel3 e = listaEnemigosNivel3.get(a);
        if(e.puedeDisparar == true){
            eneDisp.add(e);
        }
    }

    for(int a = 0 ; a < listaEnemigosNivel4.size();a++){
        EnemigoNivel4 e = listaEnemigosNivel4.get(a);
        if(e.puedeDisparar == true){
            eneDisp.add(e);
        }
    }

    //entrer los available para disparar selecciona uno aleatoriamente
    //no se como mas hacer que revise si son de como la clase enemigo X
        
    //con esto dicen que uno puede crear un arreglo de objetos de diferentes clases
    //https://forum.processing.org/two/discussion/12216/how-to-create-an-array-of-different-classes.html
    //el codigo lo saque de un ejemplo en el foro
    if(contadorVecesFondoGenerado % 100 == 0){

        if(eneDisp.size()!=0){
            int ene = int(random(0,eneDisp.size()));
        
            Object o = eneDisp.get(ene);
            
            if (o instanceof EnemigoNivel1) {
                Bala b= ((EnemigoNivel1)o).disparar();
                listaBalas.add(b);
            } 
            else if (o instanceof EnemigoNivel2) {
                Bala b= ((EnemigoNivel2)o).disparar();
                listaBalas.add(b);
            }
            else if (o instanceof EnemigoNivel3) {
                Bala b= ((EnemigoNivel3)o).disparar();
                listaBalas.add(b);
            }
            else if (o instanceof EnemigoNivel4) {
                Bala b= ((EnemigoNivel4)o).disparar();
                listaBalas.add(b);
            }
        }        
    }
    


}

void dibujarYAvanzarTodasLasBalas(){
    for(int i = 0 ; i < listaBalas.size();i++){
        Bala bala = listaBalas.get(i);
        bala.render();
        bala.avanzar();
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
        //cada 5 segundos(como 500 draws) avanza
        if(contadorVecesFondoGenerado==500){
            enemigo.avanzar();
        }
    }
}


void generarEnemigos(){
    int posicionInicialYEnemigosN4 = int(altoPantalla*0.1);
    int posicionInicialYEnemigosN3 = int(altoPantalla*0.2);
    int posicionInicialYEnemigosN2 = int(altoPantalla*0.3);
    int posicionInicialYEnemigosN1 = int(altoPantalla*0.4);

    int posicionInicialXEnemigoIzq = int(anchoPantalla*1/5);
    int posicionInicialXEnemigoMidIzq = int(anchoPantalla*2/5);
    int posicionInicialXEnemigoMidDer = int(anchoPantalla*3/5);
    int posicionInicialXEnemigoDer = int(anchoPantalla*4/5);


    EnemigoNivel1 eneN1A = new EnemigoNivel1( posicionInicialXEnemigoIzq,  posicionInicialYEnemigosN1, altoPantalla,  anchoPantalla);
    EnemigoNivel1 eneN1B = new EnemigoNivel1( posicionInicialXEnemigoMidIzq,  posicionInicialYEnemigosN1, altoPantalla,  anchoPantalla);
    EnemigoNivel1 eneN1C = new EnemigoNivel1( posicionInicialXEnemigoMidDer,  posicionInicialYEnemigosN1, altoPantalla,  anchoPantalla);
    EnemigoNivel1 eneN1D = new EnemigoNivel1( posicionInicialXEnemigoDer,  posicionInicialYEnemigosN1, altoPantalla,  anchoPantalla);
    listaEnemigosNivel1.clear();
    listaEnemigosNivel1.add(eneN1A);
    listaEnemigosNivel1.add(eneN1B);
    listaEnemigosNivel1.add(eneN1C);
    listaEnemigosNivel1.add(eneN1D);

    EnemigoNivel2 eneN2A = new EnemigoNivel2( posicionInicialXEnemigoIzq,  posicionInicialYEnemigosN2, altoPantalla,  anchoPantalla);
    EnemigoNivel2 eneN2B = new EnemigoNivel2( posicionInicialXEnemigoMidIzq,  posicionInicialYEnemigosN2, altoPantalla,  anchoPantalla);
    EnemigoNivel2 eneN2C = new EnemigoNivel2( posicionInicialXEnemigoMidDer,  posicionInicialYEnemigosN2, altoPantalla,  anchoPantalla);
    EnemigoNivel2 eneN2D = new EnemigoNivel2( posicionInicialXEnemigoDer,  posicionInicialYEnemigosN2, altoPantalla,  anchoPantalla);
    listaEnemigosNivel2.clear();
    listaEnemigosNivel2.add(eneN2A);
    listaEnemigosNivel2.add(eneN2B);
    listaEnemigosNivel2.add(eneN2C);
    listaEnemigosNivel2.add(eneN2D);

    EnemigoNivel3 eneN3A = new EnemigoNivel3( posicionInicialXEnemigoIzq,  posicionInicialYEnemigosN3, altoPantalla,  anchoPantalla);
    EnemigoNivel3 eneN3B = new EnemigoNivel3( posicionInicialXEnemigoMidIzq,  posicionInicialYEnemigosN3, altoPantalla,  anchoPantalla);
    EnemigoNivel3 eneN3C = new EnemigoNivel3( posicionInicialXEnemigoMidDer,  posicionInicialYEnemigosN3, altoPantalla,  anchoPantalla);
    EnemigoNivel3 eneN3D = new EnemigoNivel3( posicionInicialXEnemigoDer,  posicionInicialYEnemigosN3, altoPantalla,  anchoPantalla);
    listaEnemigosNivel3.clear();
    listaEnemigosNivel3.add(eneN3A);
    listaEnemigosNivel3.add(eneN3B);
    listaEnemigosNivel3.add(eneN3C);
    listaEnemigosNivel3.add(eneN3D);

    EnemigoNivel4 eneN4A = new EnemigoNivel4( posicionInicialXEnemigoIzq,  posicionInicialYEnemigosN4, altoPantalla,  anchoPantalla);
    EnemigoNivel4 eneN4B = new EnemigoNivel4( posicionInicialXEnemigoMidIzq,  posicionInicialYEnemigosN4, altoPantalla,  anchoPantalla);
    EnemigoNivel4 eneN4C = new EnemigoNivel4( posicionInicialXEnemigoMidDer,  posicionInicialYEnemigosN4, altoPantalla,  anchoPantalla);
    EnemigoNivel4 eneN4D = new EnemigoNivel4( posicionInicialXEnemigoDer,  posicionInicialYEnemigosN4, altoPantalla,  anchoPantalla);
    listaEnemigosNivel4.clear();
    listaEnemigosNivel4.add(eneN4A);
    listaEnemigosNivel4.add(eneN4B);
    listaEnemigosNivel4.add(eneN4C);
    listaEnemigosNivel4.add(eneN4D);
}

void resetearEstadoJuego(){
    generarEnemigos();
    jugador.resetearStats();
}


void dibujarFondo(){   
    fondoCiudad();
    noStroke(); 
    //cambia de fondo
    if(contadorVecesFondoGenerado == 500 || primera == true){
        //selecciona aleatoriamente uno de los tres fondos
        //float seleccionado = random(0,3);
        float seleccionado = 0;
        
        
        contadorVecesFondoGenerado = 0;
        primera = false;
        
    }
    else{
        contadorVecesFondoGenerado += 1;
    }
    //toca meter esto aqui si no todos los rectangulos cambian
    rectMode(CORNER);
}

float nubeax=-anchoPantalla;//asi nos e corta
float nubebx=-anchoPantalla;
float nubecx = -anchoPantalla;
float nubeay = altoPantalla*0.2;
float nubeby = altoPantalla*0.2;
float nubecy = altoPantalla*0.2;
float solx = anchoPantalla*0.1;
float soly = altoPantalla*0.1;
float brillo = 50;
boolean ade = true;

void fondoCiudad(){
    //pone fondo
    fondo = loadImage("GameScreen.jpg");
    image(fondo,0,0);

    //crea sol
    //resplandece sol
    if(contadorVecesFondoGenerado/500 == 0){
        if(ade == true){
            if(brillo ==75){
                ade = false;
            }else{
                
                brillo+=1;
            }
            
        }
        else if(ade == false){
            
            if(brillo == 50){
                ade = true;
            }else{
                brillo-=1;
            }
            
        }
    }
    
    fill(color(255, 150, 38));
    ellipse(solx,soly,brillo,brillo);
    fill(color(255, 247, 38));
    ellipse(solx,soly,50,50);

    //crea nubes
    //mueve nubes
    rectMode(CENTER);
    
    if(contadorVecesFondoGenerado/500 == 0){
        nubeax+=1;
        nubebx+=1;
        nubecx+=1; 
    }
    if(nubeax == anchoPantalla){
        nubeax=100;
        nubebx=100;
        nubecx = 100;
    }
    fill(color(255));

    rect(nubeax,nubeay,anchoPantalla*0.1,20);
    rect(nubebx,nubeby,anchoPantalla*0.05,40);
    rect(nubecx+15,nubecy-10,anchoPantalla*0.02,30);

    rect(nubeax+150,nubeay-100,anchoPantalla*0.1,20);
    rect(nubebx+150,nubeby-100,anchoPantalla*0.05,40);
    rect(nubecx-15+150,nubecy-10-100,anchoPantalla*0.02,40);
        
    rect(nubeax+400,nubeay,anchoPantalla*0.01,50);
    rect(nubebx+400,nubeby,anchoPantalla*0.06,40);
    rect(nubecx-15+400,nubecy-10,anchoPantalla*0.02,30);

    rect(nubeax+200,nubeay+150,anchoPantalla*0.1,50);
    rect(nubebx+200,nubeby+150,anchoPantalla*0.06,60);
    rect(nubecx-15+200,nubecy-10+150,anchoPantalla*0.05,70);

    rect(nubeax+660,nubeay+100,anchoPantalla*0.1,20);
    rect(nubebx+660,nubeby+100,anchoPantalla*0.05,40);
    rect(nubecx-15+660,nubecy-10+100,anchoPantalla*0.02,40);

    rect(nubeax+900,nubeay+100,anchoPantalla*0.01,50);
    rect(nubebx+900,nubeby+100,anchoPantalla*0.07,30);
    rect(nubecx-15+900,nubecy-10+100,anchoPantalla*0.02,20);
    
    rect(nubeax+800,nubeay-50,anchoPantalla*0.1,20);
    rect(nubebx+800,nubeby-50,anchoPantalla*0.05,40);
    rect(nubecx+15+800,nubecy-50-10,anchoPantalla*0.02,30);
}
