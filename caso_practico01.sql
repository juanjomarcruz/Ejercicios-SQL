CREATE TABLE IF NOT EXISTS alumnos(
id SERIAL PRIMARY KEY NOT NULL,
Nombre VARCHAR(255) NOT NULL,
Apellidos VARCHAR(255) NOT NULL);

CREATE TABLE IF NOT EXISTS cursos(
id SERIAL PRIMARY KEY NOT NULL,
Nombre_curso VARCHAR(25) NOT NULL,
Duracion_semanas INT NOT NULL,
Fecha_inicio DATE NOT NULL);

CREATE TABLE IF NOT EXISTS inscripciones(
id SERIAL PRIMARY KEY NOT NULL,
alumno_id INT NOT NULL,
CONSTRAINT FK_alummno_id FOREIGN KEY (alumno_id) REFERENCES alumnos(id),
curso_id INT NOT NULL,
CONSTRAINT FK_curso_id FOREIGN KEY (curso_id) REFERENCES cursos(id),
Fecha_inscripcion DATE NOT NULL);

CREATE TABLE IF NOT EXISTS participaciones(
id SERIAL PRIMARY KEY NOT NULL,
alumno_id INT NOT NULL,
CONSTRAINT FK_alummno_id FOREIGN KEY (alumno_id) REFERENCES alumnos(id),
curso_id INT NOT NULL,
CONSTRAINT FK_curso_id FOREIGN KEY (curso_id) REFERENCES cursos(id),
tipo_participacion VARCHAR(10) CHECK (tipo_participacion IN('Foro','Github','Clase')),
Fecha_participacion DATE NOT NULL);

INSERT INTO alumnos(nombre,apellidos) VALUES
('Juan','Pérez'),
('María','González');

INSERT INTO cursos(nombre_curso,duracion_semanas,fecha_inicio) VALUES
('Python',12,'2023-01-15'),
('SQL',8,'2023-02-01');

INSERT INTO inscripciones(alumno_id,curso_id,fecha_inscripcion) VALUES
(1,1,'2023-01-20'),
(2,1,'2023-01-22');

INSERT INTO participaciones(alumno_id,curso_id,tipo_participacion,fecha_participacion) VALUES
(1,1,'Foro','2023-01-21'),
(2,1,'Clase','2023-01-25');

SELECT a.Nombre as Nombre_Alumno, a.Apellidos as Apellido_Alumno, c.Nombre_curso as Nombre_curso, i.fecha_inscripcion as Fecha_Inscripción, p.tipo_participacion as Vía_Participación, p.fecha_participacion as Fecha_Participación
FROM public.alumnos a
INNER JOIN public.inscripciones i ON a.id=i.alumno_id
INNER JOIN public.cursos c ON i.curso_id=c.id
INNER JOIN public.participaciones p ON a.id=p.alumno_id
WHERE a.Nombre='Juan' AND a.Apellidos='Pérez'