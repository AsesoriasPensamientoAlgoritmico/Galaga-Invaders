class BaseEntidad{
    //-----------
    //CONSTANTES
    //-----------
    //velocidad en la que se va a mover en el eje x el jugador
    static final int VELOCIDAD_MOVIMIENTO_BASE_JUGADOR = 5;

    //velocidad en la que se va a mover en el eje y el jugador
    static final int VELOCIDAD_MOVIMIENTO_BASE_ENEMIGO = 50;

    //-----------
    //ATRIBUTOS
    //-----------

    //El numero de vidas que tienen actualmente un jugador
    int vidas;//se inicializa en las sub clases

    //Posicion inicial en la que se genera la entidad en la pantalla en el eje X
    int posicionInicialX;

    //Posicion inicial en la que se genera la entidad en la pantalla en el eje Y
    int posicionInicialY;

    //Posicion en la que esta la entidad en el eje X actualmente
    int x;

    //Posicion en la que esta la entidad en el eje Y actualmente
    int y;

    //El sprite, o imagen, de la entidad. Se queda en vacio por ahora y despues se inicializa en las subclases (enemigo y jugador)
    PShape sprite;

    //Indica si la entidad esta viva o muerta (viva es true y muerta es false) (esto defnira si se genera o no en la interfaz)
    boolean estatus;

    //Alto de la pantalla (se usara para ubicar a la ciratura en relacion al ambiente en el eje y)
    int altoPantalla;
    
    //Ancho de la pantalla ( se usara para ubicar a la entidad en relacion al amabiente en el eje x)
    int anchoPantalla;

    //La velocidad con la que se mueve horizontalmente la figura
    int velocidadDeMovimiento;

    //ESTO NO ES UNA BALA BALA ES MAS COMO QUE PA ACCEDER A LAS CONSTANTES DE BALA ME TOCA COMO TENEER UN OBJETO (NO SE EN GOOGLE NO ENCONTRE COMO SOLO ACCEDER A LAS CONSTANTES SIN UN OBJETO YA CREADO) ESTA BALA NO SE USARA PARA NADA POR ESO TODO EN CERO
    Bala templateBala = new Bala(true,0,0,0,0,0);

    //-----------
    //CONSTRUCTOR
    //-----------
    
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

        //Sprite no se incializa aqui (mientras tanto dejo un circulo)
        //Saque lo de PShape de la documentacion de processing en -> https://processing.org/reference/PShape.html
        this.sprite = createShape(ELLIPSE, getX(), getY(), 80, 80);//circulo 80 diametro en la posicion inicial
    }

    //-----------
    //FUNCIONES
    //-----------

    //funciones como avanzar y todo eso estaran en enemigo y jugador

    //mata a la entidad al cambiar su estatus(que indica si esta viva o no) a falso para indicar que esta muerta
    void morir(){
        setStatus(false);
    }

    //resetea la posicion de la entidad a su posicon inicial
    void resetearAPosicionInicial(){
        setX(posicionInicialX);
        setY(posicionInicialY);
    }

    //le quita una vida a la entidad cuando le pegan o deja pasar a un invasor
    void quitarVida(){
        setVidas(getVidas()-1);
    }

    //revisa si se ha llegado a 0 vidas
    boolean revisarSiMuerto(){
         if(getVidas()==0){
            return true;
        }
        else{
            return false;
        }
    }

    //-----------
    //Get y set
    // metodos para hablar con las propiedades de una instancia de la clase (objeto)
    //-----------

    void setX(int x) {
        this.x = x;
    }

    void setY(int y) {
        this.y = y;
    }

    void setPosicionInicialX(int posInicialX){
        this.posicionInicialX = posInicialX;
    }

    void setPosicionInicialY(int posInicialY){
        this.posicionInicialY = posInicialY;
    }

    void setSprite(PShape sprite){
        this.sprite = sprite;
    }

    void setStatus(boolean estatus){
        this.estatus = estatus;
    }

    void setAltoPantalla(int altoPantalla){
        this.altoPantalla = altoPantalla;
    }

    void setAnchoPantalla(int anchoPantalla){
        this.anchoPantalla = anchoPantalla;
    }
    
    void setVidas(int vidas){
        this.vidas = vidas;
    }
    
    int getVidas(){
        return this.vidas;
    }

    int getAltoPantalla(){
        return altoPantalla;
    }

    int getAnchoPantalla(){
        return anchoPantalla;
    }

    int getY() {
        return y;
    }

    int getX() {
        return x;
    }

    int getPosicionInicialX(){
        return posicionInicialX;
    }

    int getPosicionIncialY(){
        return posicionInicialY;
    }

    PShape getSprite(){
        return sprite;
    }

    boolean getStatus(){
        return estatus;
    }

    int getVelocidadDeMovimiento(){
        return velocidadDeMovimiento;
    }


}
