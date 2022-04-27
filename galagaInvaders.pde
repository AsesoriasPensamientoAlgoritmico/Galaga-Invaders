//guardo esta variable para que cambiar el tamaño de la pantalla sea facil
int altoPantalla = 800;
int anchoPantalla = 800;

boolean primera = true;
int contadorVecesFondoGenerado = 0;//muchas cosas dependeran de este contador (como el avanze de los enemigos)
//ArrayList<PShape> estrellas = new ArrayList<PShape>();

int fondo;//dice que fondo esta seleccionado activamente

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
    size(800,800);

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
    drawjuego();
}

void drawjuego(){
    
    jugador.renderJugador();//Dibujar jugador

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


void dibujarFondo(){   
    noStroke(); 
    //cambia de fondo
    if(contadorVecesFondoGenerado == 500 || primera == true){
        //selecciona aleatoriamente uno de los tres fondos
        //float seleccionado = random(0,3);
        float seleccionado = 0;
        background(color(132, 153, 232));
        fondoCiudad();
        
        contadorVecesFondoGenerado = 0;
        primera = false;
        
    }
    else{
        contadorVecesFondoGenerado += 1;
        background(color(132, 153, 232));

        fondoCiudad();
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
