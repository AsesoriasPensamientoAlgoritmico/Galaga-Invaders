class BaseEntidad{

    int velMovimientoJ = 5;//velocidad de un jugador(cuantos pixeles se mueve cuando se oprime derecha o izquierda)
    int velMovimientoE = 50;//velocidad de un enemigo(cuantos pixeles se mueve para abajo cada 5 segundos)
    int vidasIniciales;
    int vidas;
    int posicionInicialX;
    int posicionInicialY;
    int x;//Posicion en la que esta la entidad en el eje X actualmente
    int y;//Posicion en la que esta la entidad en el eje Y actualmente
    PShape sprite;//imagen del enemigo
    boolean estatus;//si esta vivo o muerto
    int altoPantalla;
    int anchoPantalla;
    int velocidadDeMovimiento;
    Bala templateBala = new Bala(true,0,0,0,0,0);

   
    //El constructor de un objeto de baseentidad (instancia de la clase)
    BaseEntidad(int pix, int piy,int alto, int ancho ){
        posicionInicialX = pix;
        posicionInicialY = piy;

        altoPantalla = alto;
        anchoPantalla = ancho;
        
        //la posicion actual siempre inciia como la poscion inicial 
        x = pix;
        y = piy;
        estatus = true;//todas las entidads creadas inician como vivas

        //Saque lo de PShape de la documentacion de processing en -> https://processing.org/reference/PShape.html
        sprite = createShape(ELLIPSE, x, y, 80, 80);//circulo 80 diametro en la posicion inicial
    }

    //mata a la entidad al cambiar su estatus(que indica si esta viva o no) a falso para indicar que esta muerta
    void morir(){
        estatus=false;
    }

    //resetea la posicion de la entidad a su posicon inicial
    void resetearAPosicionInicial(){
        x=posicionInicialX;
        y=posicionInicialY;
    }

    

    //le quita una vida a la entidad cuando le pegan o deja pasar a un invasor
    void quitarVida(){
        vidas -= 1;
    }

    //revisa si se ha llegado a 0 vidas
    boolean revisarSiMuerto(){
         if(vidas==0){
            return true;
        }
        else{
            return false;
        }
    }
}