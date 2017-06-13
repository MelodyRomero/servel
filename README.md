# Servel, tus datos y la leyes  (WIP)

Hace rato que [servel][1] viene  exponiendo de forma irresponsable (no
por  su culpa)  los  datos  del padrón  electoral,  cuyo atributo  mas
sensible es la dirección electoral de los habilitados para votar.

Este proyecto  tiene como propósito  exponer a la ciudadanía  (una vez
mas)  lo  importante  que  es  la   privacidad  de  sus  datos  y  las
consecuencias cuando esta  información no es tratada con  el cuidado y
la delicadeza que se merece.

# Contexto

Servel obligado por la ley [18\.556][3] tiene que presentar de forma publica el
padrón electoral,  este organismo  libera un  conjunto de  archivos en
formato pdf (uno por cada comuna)  con tu nombre, rut, sexo, dirección
y mesa donde votas. (lindo!, ¿o no?). Si esto no te alerta te propongo
te tomes unos segundos y medites lo que es posible hacer con los datos
que contiene este archivo, una conexión  a internet, un poco de tiempo
y  una taza  de buen  café.   Las posibilidades  son amplias,  algunas
inocuas otras no tanto, a continuación listo algunas a modo de ejemplo:

    1. Nombres menos/mas  frecuentes?.
    2. Apellidos menos/mas  frecuentes?.
    3. Hay personas con nombres únicos?, cuantas?
    4. Hay personas con apellidos únicos?, cuantas?
    5. Hay apellidos en peligro de extinción?
    6. Cual es el RUT mas antiguo?
    7. Donde viven esas personas?
    8. Tendrán facebook?

Estas  preguntas   se  pueden  hacer   y  responder  en   un  contexto
global/nacional o  bien desagregado por  comunas, lo que hace  esto un
poco mas interesante.

Las primeras 5  preguntas de la lista tienen respuestas  que se pueden
catalogar  de "dato  rosa",  no  así con  las  últimas  tres.  Con  la
dirección  electoral  de  una  persona  (que en  muchos  casos  es  su
dirección residencia) es posible obtener las coordenadas geográficas y
ver  esto  en  un  mapa,  créeme  que esto  es  muy  sencillo,  si  la
pagina [rutificador][2] ha causado un poco de molestia, imagínate una
pagina  como esa  pero cuando  consultas por  un nombre/rut  además te
muestra la dirección  electoral de esa persona, y  que también intente
ver si encuentra tu pagina de Facebook.

Bien es sabido  que las bases de datos (con  información personal) por
estos días  son un  producto, en  el sentido que  hay empresas  que se
dedican a  la recolección  de datos  y luego  los venden,  por ejemplo
muchas empresas de  supermercados a cambio de unos  puntos tu entregas
tu RUT  (y con  ello tus  hábitos de  compras), con  lo cual  se puede
deducir tu ingreso, número de integrantes familiares entre otros.

Aveces  me  pregunto de  el  porque  a  la  mayoría de  nosotros  esto
pareciera no preocuparnos, una de las razones a mi parecer, es que los
individuos u organizaciones que realizan  estas practicas lo hacen, en
palabras simples, a escondidas,  e inconscientemente pensamos que esos
individuos  no existen  y si  existen no  me conocen,  que es  solo un
conjunto de datos dentro de un mar gigantesco de información.


# Objetivos

A modo  de "juego" y  con fines educativos  e ilustrativos (y  por que
últimamente ando  un poco  ocioso) intentare mostrar  lo fácil  que es
manipular estos  datos y cruzarlos con  otros, y que nos  demos cuenta
que así  como lo estoy  asiendo yo  cualquiera puede hacerlo,  es mas,
dejare públicamente todas las herramientas que valla desarrollando con
el objetivo de enfatizar en este punto.





[1]: https://www.servel.cl/
[2]: https://chile.rutificador.com/
[3]: https://www.servel.cl/inscripciones-electorales-y-servicio-electoral/
