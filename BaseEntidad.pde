class BaseEntidad{
    
    int VELOCIDAD_MOVIMIENTO_BASE_JUGADOR = 5;

    int VELOCIDAD_MOVIMIENTO_BASE_ENEMIGO = 50;

int vidas;
int posicionInicialX;int posicionInicialY;
int x; //Posicion en la que esta la entidad en el eje X actualmente
int y;//Posicion en la que esta la entidad en el eje Y actualmente
PShape sprite;
boolean estatus;
int altoPantalla;
int anchoPantalla;
int velocidadDeMovimiento;
Bala templateBala = new Bala(true,0,0,0,0,0);//asi puedo acceder a algunas variables

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


    //mata a la entidad al cambiar su estatus(que indica si esta viva o no) a falso para indicar que esta muerta
void morir(){
    setStatus(false);
}

    void resetearAPosicionInicial(){
                setX(posicionInicialX);
    setY(posicionInicialY);
            }

    //le quita una vida a la entidad cuando le pegan o deja pasar a un invasor
void quitarVida(){
vidas-1;
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
