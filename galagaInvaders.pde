int altoPantalla = 1000;
int anchoPantalla = 1000;

int contadorPerdidas = 0;

boolean primeraIteracion = true;
int contadorVecesFondoGenerado = 0;//muchas cosas dependeran de este contador (como el avanze de los enemigos)
ArrayList<PShape> estrellas = new ArrayList<PShape>();


int nivelActual = 0;

//Modo de ejecucion ayuda a diferenciar entre si se esta en el menu principal , el menu de pausa o el juego en si 

int MENU_PRINCIPAL = 0;
int JUEGO = 1;
int MENU_PAUSA = 2;

int modo = MENU_PRINCIPAL;

//el jugador tiene que poderse acceder desde todos lados
Jugador jugador;

//Manejo de balas
//NO SE POR UQE NO ESTA FUNCIONANDO, ESTA IMPRIMIENDO EN CONSOLA PERO SLO NO MUESTRA LAS BALAS Y SI LES ESTOY HACIENDO RENDER 
ArrayList<Bala> listaBalas = new ArrayList<Bala>();

void setup(){
    size(1000,1000);

    //toca inicializar el jugador aca si no manda un error raro
    int posicionInicialX = anchoPantalla/2;
    int posicionInicialY = int(altoPantalla*0.9);

    //crea el jugador(existe pero aun no se ha dibujado)
    jugador = new Jugador(posicionInicialX,posicionInicialY,altoPantalla,anchoPantalla, "Felipe");
    
}


void draw(){
    
    

    dibujarFondo();
    
   
    
    //Menu Principal
    if(modo == MENU_PRINCIPAL){
        drawMenuPrincipal();
    }
    //Juego
    else if(modo == JUEGO){
        drawJuego();
        
    }
    //Menu de Pausa
    else if(modo == MENU_PAUSA){
        drawMenuPausa();
    }    
}


/**
 *
*/
void drawJuego(){
    

    //AAAA 
    if(contadorVecesFondoGenerado%100==0){
        System.out.println(listaBalas);//estoy revisando si se a`naden las balas  
    }
    
    //Dibuja el boton de pausa
    fill(color(100));
    ellipse(anchoPantalla-30,30,20,20);


    
        

    //Revisa si se esta oprimiendo el boton de pausa 
    //AUN NO SE COMO VOY A HACER QUE ESTO PAUSE TODO 
    if(mouseY>0 && mouseY < 60){
        if(mouseX > anchoPantalla-30 && mouseX < anchoPantalla ){
            fill(color(200));
            ellipse(anchoPantalla-30,30,20,20);
            if(mousePressed && mouseButton == LEFT){
                modo = MENU_PAUSA;
                //Re dibujar el fonodo para borrar el menu
                contadorVecesFondoGenerado = 500;
                dibujarFondo();
            }          
        }
    }

    //TODO: Crear el resto de elementos del juego

    //Dibujar jugador
    jugador.renderJugador();

    


    //lo de key coded lo saque esta pagina por que queria que funcionara con las flechas -> https://processing.org/reference/keyCode.html
    if(keyPressed == true){

        //maneja las flechas que controlan el movimiento del jugador
        if(key == CODED || esTeclaAD()){
            if(keyCode == LEFT || key == 'a' || key == 'A'){
                jugador.moverIzquierda();
            }
            if(keyCode == RIGHT || key == 'd' || key == 'D'){
                jugador.moverDerecha();
            }
        }
        if(key != CODED && !esTeclaAD()){
            //maneja cuando se oprime espacio, que controla las balas normales
            
            //este if existe por que el draw es tan rapido que estaba registrando multiples disparos con solo oprimir una tecla y entonces lo solucione con el contador que tenia para el fondo
            //% es modulo que revisa cual es el residuo de el contador divido 10. Entonces solo dejo hacer disparo cada vez que es un multiplo de 10. Por que 10, con prueba y error era como un tiempo normal

            if(contadorVecesFondoGenerado%10==0){
                Bala nuevaBala = jugador.disparar();//crea bala    
                listaBalas.add(nuevaBala);//añade bala a lista de balas activas
            }
            
        }
        //TODO: ENCONTRAR OTRA TECLA PARA LAS BALAS ESPECIALES
    }

    //MANEJO BALAS
    
    //revisa que balas impactaron , hace lo que tiene que hacer(vidas y todo eso) y vuelve invisibles a las balas que impactaron
    revisarImpactosBalas();
    //revisa que balas se salieron del rango
    revisarBalasFueraDeRango();
    //sacar balas inactivas (que ya le pegaron a algo o se salieron del espacio)
    sacarBalasInactivas();
    //dibujar balas en lista de balas activas y avanzarlas
    dibujarYAvanzarTodasLasBalasActivas();

}

//recorre la lista de balas para revisar cuales estan inactivas (visible == false)
// comom reviarImpactoBalas y revisarBalasFueraDeRango ya volvieron invisibles a las balas que debian es solo revisar en la lista cuales estan invisibles
void sacarBalasInactivas(){

    for(int i = 0 ; i < listaBalas.size();i++){
        Bala balaActual = listaBalas.get(i);
        if(balaActual.getVisible()==false){
            listaBalas.remove(i);//en esta pagina aparecia que asi podia remover con el indice -> https://beginnersbook.com/2013/12/java-arraylist-remove-method-example/#:~:text=Method%20remove(int%20index)%20is,(index%20size%20of%20ArrayList).
        }
    }
}

void revisarBalasFueraDeRango(){

  for(int i = 0 ; i < listaBalas.size();i++){
      Bala bala = listaBalas.get(i);
      bala.volverInvisibleSiFueraDeRangoPantalla();//automaticamente las vuelve invisibles si estan fuera del rango
  }
}

//pinta todas las balas activas y despues las avanza
void dibujarYAvanzarTodasLasBalasActivas(){
    for(int i = 0 ; i < listaBalas.size();i++){
        Bala bala = listaBalas.get(i);
        bala.render();
        bala.avanzar();
    }
}

//Revisa si alguna de las balas en la lista de balas le impacto a alguien 
//Tambien esta encargado de hacer todas las operaciones de quitar vidas restar hp de los enemigos si le pegaron , etc
void revisarImpactosBalas(){
    //Arreglo para guardar balas que impactaron
    ArrayList<Bala> listaBalasQueImpactaron = new ArrayList<Bala>();

    //TODO: hacer lo de vidas y todo lo demas que toque y poner balas que impactaron een la lista
    //cada operacion de impacto termina con que se remueve la bala

    //Sacar balas que impactaron
    for(int i = 0; i < listaBalasQueImpactaron.size();i++){
        Bala balaQueImpacto = listaBalasQueImpactaron.get(i);//saca una de las balas que impacto
       
        balaQueImpacto.setVisible(false);//vuelve invisibles o inactivas a las balas que impactaron
    }

    
    
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
        background(color(0));
        for(int i = 0;i < estrellas.size();i++){
            shape(estrellas.get(i));
        }
    }
    
}

//Esta funcion esta encargado de revisar si alguna bala existente le pego a algun enemico o si alguna bala le pego al jugador
//Se ejecuta despues de avanzar balas
void escanearPorGolpesBala(){
    //TODO: se tiene que sacar de la lista de balas las balas que ya se salieron de la pantalla y las que ya impactaron
}

//Esta funcion esta encargada de avanzar las balas activas
void avanzarTodasLasBalas(){
    //TODO: avanzar solamente las balas activas
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
                modo = JUEGO;

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
                modo = JUEGO;
                //Re dibujar el fonodo para borrar el menu
                contadorVecesFondoGenerado = 500;
                dibujarFondo();
            }

            
        }
    }
}
