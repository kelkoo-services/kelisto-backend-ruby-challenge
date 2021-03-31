***BUILD A CHECKOUT CART* - Diana Damas dianadamas@gmail.com**

Ya que el enunciado del challenge está redactado en inglés, he realizado el programa en inglés también. Este documento, sin embargo, lo escribo en español ya que es el idioma del correo con las explicaciones. En el propio código hay algunas explicaciones también sobre, por ejemplo, cómo podría escalarse una clase.

***El programa es funcional y supera los tests***

INSTRUCCIONES PARA EJECUTAR EL CÓDIGO
    TypeScript necesita entorno Node.js para ejecutarse. (Ver la captura de pantalla Como ejecutar y resultado.JPG )
        Desde la consola de Node.js, acceder a la carpeta donde están los archivos.
        Introducir "node main".
        Si se desean recompliar a JS los archivos TS tras introducir algún cambio, es necesario introducir antes el comando "tsc -t es5 main". Después, "node main".

ENFOQUE
- Escalabilidad como criterio de diseño. He procurado que los objetos creados tengan atributos y métodos que permitan añadir nuevas funcionalidades al programa si se necesitan (aparición de las descripciones por TPV, adición simple de nuevas reglas de precio, etc.).
- Creación de clases en módulos separados que permitan su reutilización.
- Nombres de variables, atributos, clases, etc. lo más descriptivos posible para reducir la necesidad de comentarios.
- Se simula que los objetos están definidos en BBDD a las que el checkout tiene acceso, así que todos tienen un "code" correspondiente al id único de la BBDD:
- Los lenguajes con los que estoy más cómoda ahora mismo son JavaScript y TypeScript, ya que son los que utilizo en la formación que estoy cursando. Mi preferencia personal son los lenguajes con tipado fuerte y clases bien estructuradas, así que he elegido TypeScript.

ESTRATEGIA
- El archivo main.js es el que ejecuta el programa. El resto de los archivos definen clases y sus métodos asociados.
    - La clase Tests define los objetos test, que tienen como atributos un array de productos y el total esperado.
    - La clase Products define los objetos product según los atributos del enunciado.
    - La clase PricingRules define los objetos correspondientes a cada regla de precio con la que aplicar descuentos y ofertas. Como atributos, además del code incluye una descripción (que podría aparecer en la TPV si es una venta física o en la web de finalización de la compra) y un código de "producto involucrado", que no es necesario en este ejercicio pero que puede ser útil en el futuro si, por ejemplo, se quieren hacer ofertas de asociación de productos distintos (se irían añadiendo más atributos según se quieran crear ofertas que involucren dos, tres o más productos).
    - La clase Checkout define los carros de la compra e incluye los métodos "scan" (lee uno por uno los productos de la cesta y los introduce en el carro de salida que debe ser contabilizado) y "total" (suma todos lso precios y aplica las reglas). Las reglas se valoran según una instrucción SWITCH-CASE, que hace sencillo añadir nuevas reglas.
    - He creado dos nuevos tests: uno con una cesta vacía y otro que aplique simultáneamente las dos reglas. El programa supera todos los tests. 

PROBLEMAS ENCONTRADOS
    - No tengo experiencia diseñando y ejecutando test formales. Sería mucho más elegante que el archivo de tests estuviera aparte y el programa accediera a ellos, pero hacer eso me llevaría bastalgo de tiempo de investigación, ya que en este momento no sé hacerlo. He prefrido no demorar el ejercicio.
    - Un programa en TypeScript, en teoría, al ser compilado a JS puede ser accesible desde un navegador, y de este modo solo sería necesario acceder a la consola del mismo en lugar de usar Node.js. La realidad es que, sin usar ningún Framework, la conexión de un TS con el navegador no es trivial y puede dar multitud de errores que no sé solucionar completamente, de modo que he preferido dejarlo así.
