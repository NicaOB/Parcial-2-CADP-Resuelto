# Parcial-2-CADP-Resuelto
Segundo parcial hecho en clase de consulta.

Consideraciones:

El parcial está hecho en su totalidad. Se ve raro, pero todo lo que esta ahi lo saben hacer.

Hoy hablamos en la clase que, cuando dice "se dispone" podríamos evitar codear el cargado de muchos datos. Pregunten en el parcial que deberían hacer cuando aparece la palabra "se dispone" normalmente no deben codear una parte del código.

El enunciado, en el inciso B pide que se retorne, pero no que se informe, por ende, pregunten a la hora de realizar el parcial si deben informar. Si no lo piden, se ahorran unas líneas de código. Yo informe, pero no sabría decirles si es necesario realmente. 

El procedure corteDeControl no es más que el algoritmo de corte de control, simplemente que está modularizado dentro de un proceso. Recuerden que modularizar es muy importante, mi recomendación es modularizar lo justo y lo necesario, no tienen que modularizar cada cosa que pasa en el programa, tranquilos.


Si ven dentro del while anidado en el corte de control, pueden ver la instruccion "dineroGastadoXCliente:= dineroGastadoXCliente + vCat[l^.dato.categoria].precioKilo * l^.dato.cantKilosComprados;" se ve raro.
Si lo piensan por un segundo, cada nodo de la lista está cargada con dni del cliente que compra, la categoría de la compra que realizó, por ejemplo, 1, 2, 3, etc. y por último la cantidad de kilos comprados.
Recuerden que a nosotros nos dan un vector cargado de 1 a 20, donde cada posición tiene un nombre de producto, y el precio por kilo, lo que hace la instrucción recién mencionada es guardar en dineroGastadoXCliente
lo que hay en esa misma variable, más el precio por kilo de la categoría cargada en el nodo del usuario multiplicado por la cantidad de kilos comprados por el cliente. Entonces, en dineroGastadoXCliente
queda guardado el total que gastó el cliente en esa compra. Cada nodo de la lista es una compra única del cliente, por ejemplo:

LISTA =>

nodo 1 : dni = 23, categoría = 3, cantKilosComprados = 3.8;

nodo 2 : dni = 23, categoría = 4, cantKilosComprados = 7.3;

nodo 3 : dni = 23, categoría = 2, cantKilosComprados = 13;

nodo 4 : dni = 23, categoría = 2, cantKilosComprados = 3.6;

nodo 5 : dni = 33, categoría = 2, cantKilosComprados = 3.6;


vCat[

Posición 1: nombre = pan, precioKilo = 120

Posición 2: nombre = medialunas, precioKilo = 330

Posición 3: nombre = pan de pancho, precioKilo = 220

Posición 4: nombre = facturas, precioKilo = 442

...

]

dineroGastadoXCliente:= dineroGastadoXCliente + vCat[l^.dato.categoria].precioKilo * l^.dato.cantKilosComprados;

Reemplacen la anterior ecuación con los valores que les di y van a ver magia, supongan que dineroGastadoXCliente al principio vale 0.

------


Cualquier duda me mandan un whatsapp, estoy para ayudarlos.

Por último, decirles que no se asusten, confíen en que saben, es un parcial, no el final de sus vidas. Si les va mal, se puede volver a intentar, no se preocupen. Den siempre lo mejor de ustedes mismos, sin olvidarse que son humanos y pueden fallar. Exitos, los veo el siguiente semestre en taller de programación :)
