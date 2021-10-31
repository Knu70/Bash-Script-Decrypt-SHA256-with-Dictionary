# Bash Script Decrypt SHA256 with Dictionary
Script en Bash que recibe dos argumentos:

<ul>

  <li type="disc">El primer argumento es la ruta del fichero hashes. Los hashes están en sha256.</li>
  
  <li type="disc">El segundo argumento es la ruta del fichero diccionario.</li>

</ul>

El fichero lee las palabras en texto plano del diccionario, las hashea en sha256 (sin salto de linea) y va comparando con las palabras del fichero hashes.
