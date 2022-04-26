class BaseEntidad{

    int velMovimientoJ = 5;//velocidad de un jugador(cuantos pixeles se mueve cuando se oprime derecha o izquierda)
    int velMovimientoE = 50;//velocidad de un enemigo(cuantos pixeles se mueve para abajo cada 5 segundos)
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
}