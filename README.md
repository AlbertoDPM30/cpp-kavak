# cpp-kavak
Base de datos para un sistema de registro de propuestas para el CPP KAVAK

## 📜 Tablas
- **disponibilidad:** tabla para productos disponibles.
- **financiamientos:** tabla donde se almacenan los nombres de los planes de Financiamiento y los meses que corresponde.
- **planes_disponibilidad:** Actua como tabla intermedia entre los planes de Financiamiento y los productos disponibles.
- **propuestas:** tabla de propuestas del cliente hacia la compañia.
- **usuarios:** tabla de usuarios que tienen acceso al sistema.

## Relaciones
### Relación entre planes_disponibilidad y disponibilidad
- *Clave foránea:* id_disponibilidad en la tabla planes_disponibilidad.
- *Referencia:* Se vincula a la clave primaria id de la tabla disponibilidad.

### Relación entre planes_disponibilidad y valores_planes
- *Clave foránea:* id_plan en la tabla planes_disponibilidad.
- *Referencia:* Se vincula a la clave primaria id de la tabla valores_planes.

### Relación entre propuestas y disponibilidad
- *Clave foránea:* id_disponibilidad en la tabla propuestas.
- *Referencia:* Se vincula a la clave primaria id de la tabla disponibilidad.

### Relación entre valores_planes y financiamientos
- *Clave foránea:* id_financiamiento en la tabla valores_planes.
- *Referencia:* Se vincula a la clave primaria id de la tabla financiamientos.
