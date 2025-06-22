+++
title = 'Mi Viaje en el Cifrado RSA: Una Implementación Práctica en Python'
date = 2023-02-15T10:00:00-07:00
draft = false
tags = ['python','programación']
summary = 'Este código es el resultado de mi propio aprendizaje y una forma de entender los fundamentos de uno de los algoritmos criptográficos más importantes y ampliamente utilizados en el mundo.'
+++

¡Hola a todos los entusiastas de la seguridad informática y la programación! Hoy quiero compartirles un proyecto personal que me apasiona: una implementación básica del algoritmo de cifrado **RSA en Python**. Este código es el resultado de mi propio aprendizaje y una forma de entender los fundamentos de uno de los algoritmos criptográficos más importantes y ampliamente utilizados en el mundo.

## ¿Qué es el Algoritmo RSA y por qué me interesó?

El **RSA** (Rivest-Shamir-Adleman) es un **algoritmo de criptografía de clave pública** que nos permite tanto cifrar mensajes como firmar digitalmente. Lo que me fascina de RSA es que su seguridad se basa en un concepto matemático bastante elegante: la dificultad de factorizar números grandes en sus componentes primos. En esencia, RSA utiliza un par de claves:

* **Clave Pública:** Esta clave puede ser compartida con cualquiera. Su función principal es cifrar mensajes o verificar firmas digitales.
* **Clave Privada:** Esta clave es estrictamente confidencial. Se utiliza para descifrar mensajes que fueron cifrados con la clave pública correspondiente o para crear firmas digitales.

La verdadera magia, para mí, reside en la simplicidad con la que un mensaje cifrado con la clave pública solo puede ser descifrado con la clave privada asociada, y viceversa.


## ¿Qué hace mi Gist y para qué lo creé?

Mi código es una **implementación didáctica del algoritmo RSA**. Lo diseñé para que cualquiera pueda generar un par de claves RSA (pública y privada) y luego usar esas mismas claves para cifrar y descifrar un mensaje numérico. Mi objetivo era desmitificar un poco este algoritmo tan crucial.

Puedes acceder al código siguiendo esta liga: https://gist.github.com/montfort/afd5322c60ff9402a5db7b3ab1fa00ae

### Funcionalidades Clave de Mi Código:

1. **Generación de Claves RSA:**
    * El programa me pide, y a ustedes como usuarios, **dos números primos grandes (p y q)**. Estos son los cimientos sobre los cuales se construyen las claves.
    * Calculo `n = p * q` (que forma parte de ambas claves) y `F = (p-1) * (q-1)` (la función totient de Euler, vital para encontrar `e` y `d`).
    * Encuentro la **clave pública `e`**. Es un número primo relativo de `F` (lo que significa que su máximo común divisor con `F` es 1). En mi código, busco el penúltimo valor más alto que cumple esta condición, lo cual fue un detalle interesante a implementar.
    * Finalmente, calculo la **clave privada `d`**, basándome en la relación `e * d ≡ 1 (mod F)`.
    * El resultado son las claves: la **llave pública `(n, e)`** y la **llave privada `(n, d)`**.

2. **Funciones Auxiliares Esenciales que Programé:**
    * `es_primo(num)`: Una función simple para verificar si un número es primo.
    * `mcd(a, b)`: Para calcular el máximo común divisor, algo indispensable en la fase de generación de claves.
    * `exponenciacion_modular(b, n, m)`: Esta es una parte crucial. Realiza una exponenciación modular eficiente (`b^n mod m`). Sin una optimización como esta, las operaciones con números grandes en RSA serían extremadamente lentas.

3. **Cifrado y Descifrado de Mensajes:**
    * El programa permite que introduzca un **mensaje numérico** (M).
    * **Cifro el mensaje (C)** usando la clave pública: `C = M^e (mod n)`.
    * Luego, **descifro el mensaje (M1)** con la clave privada: `M1 = C^d (mod n)`.
    * Para validar, siempre verifico si el mensaje original es idéntico al mensaje descifrado.

4. **Comparación de Eficiencia:**
    * Un detalle que me pareció importante incluir fue una comparación de tiempos. El código mide el tiempo de cifrado y descifrado usando el operador `**` de Python (que puede ser menos eficiente para números grandes) y lo compara con el tiempo de mi función `exponenciacion_modular` optimizada. Esto realmente subraya por qué la eficiencia algorítmica es tan importante en criptografía.

### ¿Para qué creo que sirve este código?

Diseñé este Gist pensando en que fuera una herramienta valiosa para:

* **Estudiantes:** Si estás aprendiendo criptografía o programación, creo que te ayudará a visualizar y comprender los conceptos matemáticos y algorítmicos detrás de RSA de una manera práctica.
* **Educadores:** Espero que pueda ser un recurso útil para demostrar cómo funciona el cifrado de clave pública.
* **Desarrolladores curiosos:** Para aquellos interesados en cómo se aplican los principios de la teoría de números en la criptografía, este código es una base sencilla para explorar.

En resumen, mi "rsa_sample.py" es más que un simple script; es mi contribución para hacer más accesible el fascinante mundo de la criptografía de clave pública. ¡Espero que les sea tan útil y educativo como lo fue para mí crearlo!

Puedes acceder al código siguiendo esta liga:
https://gist.github.com/montfort/afd5322c60ff9402a5db7b3ab1fa00ae
