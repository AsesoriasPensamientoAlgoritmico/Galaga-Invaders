int altoPantalla = 800;
int anchoPantalla = 800;

int contadorPerdidas = 0;

boolean primera = true;
int contadorVecesFondoGenerado = 0;//muchas cosas dependeran de este contador (como el avanze de los enemigos)
//ArrayList<PShape> estrellas = new ArrayList<PShape>();

int fondo;//dice que fondo esta seleccionado activamente

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
ArrayList<EnemigoNivel1> listaEnemigosNivel = new ArrayList<EnemigoNivel1>();
ArrayList<EnemigoNivel2> listaEnemigosNivel2 = new ArrayList<EnemigoNivel2>();
ArrayList<EnemigoNivel3> listaEnemigosNivel3 = new ArrayList<EnemigoNivel3>();
ArrayList<EnemigoNivel4> listaEnemigosNivel4 = new ArrayList<EnemigoNivel4>();



void setup(){
    size(800,800);

    int posicionInicialXJugador = anchoPantalla/2;
    int posicionInicialYJugador = int(altoPantalla*0.9);
    

    jugador = new Jugador(posicionInicialXJugador,posicionInicialYJugador,altoPantalla,anchoPantalla, "Felipe");
    


    int posicionInicialYEnemigosA4 = int(altoPantalla*0.1);//Y mas arriba


    int posicionInicialXEnemigoB1 = int(anchoPantalla*1/5);//X mas a la izquierda
    int posicionInicialXEnemigoB2 = int(anchoPantalla*2/5);
    int posicionInicialXEnemigoB3 = int(anchoPantalla*3/5);
    int posicionInicialXEnemigoB4 = int(anchoPantalla*4/5);//X mas a la derecha

    //Enemigos nivel 4
    EnemigoNivel4 e1n4 = new EnemigoNivel4( posicionInicialXEnemigoB1 ,posicionInicialYEnemigosA4,altoPantalla,anchoPantalla );
    listaEnemigosNivel4.add(e1n4);

    //Enemigos nivel 3
    EnemigoNivel3 e1n3 = new EnemigoNivel3( posicionInicialXEnemigoB2 ,posicionInicialYEnemigosA4,altoPantalla,anchoPantalla );
    listaEnemigosNivel3.add(e1n3);
    

    //Enemigos nivel 2
    EnemigoNivel2 e1n2 = new EnemigoNivel2( posicionInicialXEnemigoB3 ,posicionInicialYEnemigosA4,altoPantalla,anchoPantalla );
    listaEnemigosNivel2.add(e1n2);
    

    //Enemigos nivel 1
    EnemigoNivel1 e1n1 = new EnemigoNivel1( posicionInicialXEnemigoB4 ,posicionInicialYEnemigosA4,altoPantalla,anchoPantalla );
    listaEnemigosNivel.add(e1n1);

}


void draw(){

    //dibujarFondoViejo();
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
    //Dinujar el contador de vidas


    //Dibujar el puntaje

    
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

                //Se selecciona 1 de 3 fondos
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
            if(contadorVecesFondoGenerado%20==0){
                Bala nuevaBala = jugador.disparar();//crea bala    
                listaBalas.add(nuevaBala);//añade bala a lista de balas activas
            }
        }
    }


    revisarSiJugadorImpactado();
    

    
    revisarSiEnemigoImpactado();
    revisarBalasFueraDeRango();
    revisarBalasColisonaron();

    sacarBalasInactivas();
    sacarEnemigosInactivos();

    //Enemigos

    dibujarYAvanzarEnemigos();
    enemigosDisparan();

    dibujarYAvanzarTodasLasBalasActivas();

    
}



void revisarSiJugadorImpactado(){
    for(int i = 0 ; i < listaBalas.size();i++){
        Bala b = listaBalas.get(i);
        if(jugador.x - jugador.anchoJugador/2 <= b.x && b.x <= jugador.x + jugador.anchoJugador/2 ){
            if(jugador.y - jugador.altoJugador/2  <= b.y && b.y <= jugador.y+ jugador.altoJugador/2){
                jugador.quitarVida();
                b.visible = false;
            }
        }
    }
}

void sacarEnemigosInactivos(){
    for(int i = 0; i < listaEnemigosNivel.size(); i++){
        EnemigoNivel1 e = listaEnemigosNivel.get(i);
        if(e.estatus == false){
            listaEnemigosNivel.remove(e);
            jugador.sumarAPuntajeActual(100);
        }
    }

    for(int i = 0; i < listaEnemigosNivel2.size(); i++){
        EnemigoNivel2 e = listaEnemigosNivel2.get(i);
        if(e.estatus == false){
            listaEnemigosNivel2.remove(e);
            jugador.sumarAPuntajeActual(100);
        }
    }

    for(int i = 0; i < listaEnemigosNivel3.size(); i++){
        EnemigoNivel3 e = listaEnemigosNivel3.get(i);
        if(e.estatus == false){
            listaEnemigosNivel3.remove(e);
            jugador.sumarAPuntajeActual(100);
        }
    }

    for(int i = 0; i < listaEnemigosNivel4.size(); i++){
        EnemigoNivel4 e = listaEnemigosNivel4.get(i);
        if(e.estatus == false){
            listaEnemigosNivel4.remove(e);
            jugador.sumarAPuntajeActual(100);
        }
    }

}

void revisarSiEnemigoImpactado(){
    for(int i = 0 ; i < listaEnemigosNivel.size();i++){
        EnemigoNivel1 enemigo = listaEnemigosNivel.get(i); 
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
if(balaI.x <= balaJ.x && balaJ.x <= balaI.x + balaI.anchoBala){
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
    for(int a = 0 ; a < listaEnemigosNivel.size();a++){
        EnemigoNivel1 e = listaEnemigosNivel.get(a);
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
        for(int b = 0 ; b < listaEnemigosNivel.size();b++){
            EnemigoNivel1 eN1 = listaEnemigosNivel.get(b);
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
    
    for(int a = 0 ; a < listaEnemigosNivel.size();a++){
        EnemigoNivel1 e = listaEnemigosNivel.get(a);
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
    for(int i = 0; i < listaEnemigosNivel.size();i++){
        EnemigoNivel1 enemigo = listaEnemigosNivel.get(i);
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


void dibujarFondo(){
    //si esta en menu principal solo poner negro
    if(modo == modomenuprincipal){
        background(color(0));
    }
    
    //cambia de fondo
    else if(contadorVecesFondoGenerado == 500 || primera == true){
        //selecciona aleatoriamente uno de los tres fondos
        //float seleccionado = random(0,3);
        float seleccionado = 0;
        background(color(132, 153, 232));

        if(seleccionado == 0){
            fondo = 0;
            fondoCiudad();
        }
        if(seleccionado == 1){
            fondo = 1;
            fondoParque();
        }
        if(seleccionado == 2){
            fondo = 2;
            fondoCarnaval();
        }

        contadorVecesFondoGenerado = 0;
        primera = false;
        
    }
    else{
        contadorVecesFondoGenerado += 1;
        background(color(132, 153, 232));

        if(fondo == 0){
            fondoCiudad();
        }
        if(fondo == 1){
            fondoParque();
        }
        if(fondo == 2){
            fondoCarnaval();
        }
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
    //fondo gris azul
    background(color(132, 153, 232));

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

    

    //crea fondo atras
    fill(color(73, 53, 71));
    rect(0,altoPantalla-300,100,350);
    rect(200,altoPantalla-300,100,350);
    rect(400,altoPantalla-300,100,350);
    rect(600,altoPantalla-300,150,350);
    rect(800,altoPantalla-300,100,320);
    rect(1000,altoPantalla-300,100,350);

    rect(100,altoPantalla-250,150,300);
    rect(300,altoPantalla-250,100,200);
    rect(700,altoPantalla-250,150,300);
    rect(900,altoPantalla-250,100,110);

    fill(color(200));
    rect(10,altoPantalla-300,13,13);
    fill(color(250));
    rect(10,altoPantalla-300,10,10);

    fill(color(200));
    rect(50,altoPantalla-300-20,13,13);
    fill(color(250));
    rect(50,altoPantalla-300-20,10,10);

    fill(color(200));
    rect(150,altoPantalla-300-20,23,23);
    fill(color(250));
    rect(150,altoPantalla-300-20,20,20);

    fill(color(200));
    rect(400,altoPantalla-300-20,13,13);
    fill(color(250));
    rect(400,altoPantalla-300-20,10,10);

    fill(color(200));
    rect(600,altoPantalla-300-50,13,13);
    fill(color(250));
    rect(600,altoPantalla-300-50,10,10);

    fill(color(200));
    rect(630,altoPantalla-300-20,23,23);
    fill(color(250));
    rect(630,altoPantalla-300-20,20,20);

    fill(color(200));
    rect(800,altoPantalla-300-20,13,13);
    fill(color(250));
    rect(800,altoPantalla-300-20,10,10);

    fill(color(200));
    rect(830,altoPantalla-300-105,13,13);
    fill(color(250));
    rect(830,altoPantalla-300-105,10,10);

    fill(color(200));
    rect(230,altoPantalla-300-105,13,13);
    fill(color(250));
    rect(230,altoPantalla-300-105,10,10);

    fill(color(200));
    rect(390,altoPantalla-300-120,13,13);
    fill(color(250));
    rect(390,altoPantalla-300-120,10,10);

    fill(color(200));
    rect(590,altoPantalla-300-120,13,13);
    fill(color(250));
    rect(590,altoPantalla-300-120,10,10);
    
    //crea fondo adelante
    fill(color(168, 151, 166));
    rect(anchoPantalla/2,altoPantalla-100,anchoPantalla,200);
    rect(anchoPantalla/2,altoPantalla-200,200,250);
    rect(50,altoPantalla-150,130,150);
    rect(150,altoPantalla-200,150,170);
    rect(200,altoPantalla-150,130,150);
    rect(350,altoPantalla-200,150,170);
    rect(420,altoPantalla-150,130,150);
    rect(650,altoPantalla-200,150,170);
    rect(800,altoPantalla-150,130,150);
    rect(1000,altoPantalla-200,150,170);

    for(int i = 0;i<anchoPantalla;i++){
        if(i%70==0){
            fill(color(200));
            rect(i,altoPantalla-120,15,15);
            fill(color(250));
            rect(i+15,altoPantalla-170,13,13);

            if(!(200<i && i < 290)){
                if(!(885<i&&i<945)){
                    fill(color(200));
                rect(i,altoPantalla-210,15,15);
                }
                
                if(!(735<i&&i<945)){
                    fill(color(250));
                    rect(i+15,altoPantalla-260,13,13);
                }
                
            }

            
        }
    }
    fill(color(200));
                rect(295,altoPantalla-210,15,15);
                ;
    fill(color(200));
                rect(210,altoPantalla-210,15,15);
                fill(color(250));
                rect(305,altoPantalla-260,15,15);
                rect(210,altoPantalla-260,13,13);

    


    //crea piso
    fill(color(123, 206, 139));
    rect(anchoPantalla/2,altoPantalla-30,anchoPantalla,100);


}

void fondoCarnaval(){
    background(color(132, 153, 232));
}

void fondoParque(){
    background(color(132, 153, 232));
}

//Tenia este fondo antes cuando era del espacio
//void dibujarFondoViejo(){

    //cada 500 iteraciones del draw dibuja un set de nuevas estrellas en el espacio
    //if(contadorVecesFondoGenerado == 500 || primera == true){
      //  background(color(0));

        //estrellas = new ArrayList<>();
        //for(int i = 0 ; i < 100 ; i++){
          //  float x = random(anchoPantalla);
            //float y = random(altoPantalla);
            //float size = random(5);
            //fill(color(255));
            //PShape estrellaActual = createShape(ELLIPSE,x, y, size, size);
            //estrellas.add(estrellaActual);
        //}

        //contadorVecesFondoGenerado = 0;
        //primera = false;
    //}
    //Si no se esta en la iteracion 500 se sigue dibujando las estrellas que se guardaron antes
    //else{
        //contadorVecesFondoGenerado += 1;
        //background(color(0));
        //for(int i = 0;i < estrellas.size();i++){
          //  shape(estrellas.get(i));
        //}
    //}
    
//}

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
    rectMode(CORNER);
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
                //dibujarFondoViejo();
                dibujarFondo();
            }
        }
    }
}


void drawMenuPausa(){
    rectMode(CORNER);
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
                //dibujarFondoViejo();
                dibujarFondo();
            }

            
        }
    }
}