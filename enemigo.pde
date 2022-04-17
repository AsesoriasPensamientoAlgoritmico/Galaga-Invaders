class Enemigo extends BaseEntidad{
       
    Enemigo(int posicionInicialX, int posicionInicialY,int altoPantalla, int anchoPantalla){
        super( posicionInicialX,  posicionInicialY, altoPantalla,  anchoPantalla);

        //resto de cosas
        this.velocidadDeMovimiento = VELOCIDAD_MOVIMIENTO_BASE_ENEMIGO;
    }


     //dispara un proyectil normal
    //crea un proyectil tipo enemigo desde la posicion del enemigo para que el mundo como añada a su lista de proyectiles vivos
    Bala disparar(){
             sonido();
        int danio = templateBala.getDanioBalaNormalE();
                    Bala bala = new Bala(false,getX()-1,getY()+templateBala.ALTO_BALA-25,getAltoPantalla(),getAnchoPantalla(),danio);
                    return bala;
                }

    //Sonido del enemigo cuando dispara
            void sonido(){
                    System.out.println("Pow");
            }

    //Mueve el enemigo X posiciones abajo despues de que cierto tiempo ha pasado
                void avanzar(){
                    if(0 < getY() && getY() < getAltoPantalla()){
            int nuevoY = getY();
            nuevoY += getVelocidadDeMovimiento();
            setY(nuevoY);
        }
                }

    //revisa si el enemigo esta al final de la pantalla (Y)
    boolean estaAlFinalDePantalla(){
if(getY() > getAltoPantalla()){
    return true;
}return false;
    }


    int NUMERO_VIDAS_NIVEL_1 = 1;
    int NUMERO_VIDAS_NIVEL_2 = 2;
    int NUMERO_VIDAS_NIVEL_3 = 3;
    int NUMERO_VIDAS_NIVEL_4 = 4;
    int ANCHO_ENEMIGO = 40;
    int ALTO_ENEMIGO = 40;

}
