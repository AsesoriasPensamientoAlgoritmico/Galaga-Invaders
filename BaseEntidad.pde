class BaseEntidad{

    int velMovimientoJ = 5;//velocidad de un jugador
    int velMovimientoE = 50;//velocidad de un enemigo
    int vidas;
    int posicionInicialX;
    int posicionInicialY;
    int x;//Posicion en la que esta la entidad en el eje X actualmente
    int y;//Posicion en la que esta la entidad en el eje Y actualmente
    PShape sprite;
    boolean estatus;
    int altoPantalla;
    int anchoPantalla;
    int velocidadDeMovimiento;

    //ESTO NO ES UNA BALA BALA ES MAS COMO QUE PA ACCEDER A LAS CONSTANTES DE BALA ME TOCA COMO TENEER UN OBJETO (NO SE EN GOOGLE NO ENCONTRE COMO SOLO ACCEDER A LAS CONSTANTES SIN UN OBJETO YA CREADO) ESTA BALA NO SE USARA PARA NADA POR ESO TODO EN CERO
    Bala templateBala = new Bala(true,0,0,0,0,0);

   
    //El constructor de un objeto de baseentidad (instancia de la clase)
    BaseEntidad(int posicionInicialX, int posicionInicialY,int altoPantalla, int anchoPantalla ){
        this.posicionInicialX = posicionInicialX;
        this.posicionInicialY = posicionInicialY;

        this.altoPantalla = altoPantalla;
        this.anchoPantalla = anchoPantalla;
        
        //la posicion actual siempre inciia como la poscion inicial 
        this.x = posicionInicialX;
        this.y = posicionInicialY;
        this.estatus = true;//todas las entidads creadas inician como vivas

        //Saque lo de PShape de la documentacion de processing en -> https://processing.org/reference/PShape.html
        this.sprite = createShape(ELLIPSE, x, y, 80, 80);//circulo 80 diametro en la posicion inicial
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