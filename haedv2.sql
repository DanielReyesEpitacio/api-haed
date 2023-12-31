-- MariaDB dump 10.17  Distrib 10.4.11-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: haedv2
-- ------------------------------------------------------
-- Server version	10.4.11-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `evaluaciones`
--

DROP TABLE IF EXISTS `evaluaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evaluaciones` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `titulo` varchar(256) NOT NULL,
  `descripcion` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evaluaciones`
--

LOCK TABLES `evaluaciones` WRITE;
/*!40000 ALTER TABLE `evaluaciones` DISABLE KEYS */;
INSERT INTO `evaluaciones` VALUES (1,'Creatividad y desempe├▒o docente',NULL),(2,'Relaci├│n interpersonal',NULL);
/*!40000 ALTER TABLE `evaluaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `intentos`
--

DROP TABLE IF EXISTS `intentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `intentos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `evaluacion_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `fecha` date DEFAULT curdate(),
  PRIMARY KEY (`id`),
  KEY `evaluacion_id` (`evaluacion_id`),
  KEY `intentos_ibfk_2` (`user_id`),
  CONSTRAINT `intentos_ibfk_1` FOREIGN KEY (`evaluacion_id`) REFERENCES `evaluaciones` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `intentos_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `intentos`
--

LOCK TABLES `intentos` WRITE;
/*!40000 ALTER TABLE `intentos` DISABLE KEYS */;
INSERT INTO `intentos` VALUES (4,1,2,'2023-06-10'),(5,1,2,'2023-06-10'),(8,2,1,'2023-06-11'),(9,2,1,'2023-06-11'),(15,2,2,'2023-06-11'),(16,2,3,'2023-06-12'),(17,2,3,'2023-06-12'),(18,2,3,'2023-06-12');
/*!40000 ALTER TABLE `intentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2019_12_14_000001_create_personal_access_tokens_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opciones`
--

DROP TABLE IF EXISTS `opciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opciones` (
  `pregunta_id` int(10) unsigned NOT NULL,
  `opcion` varchar(1024) DEFAULT NULL,
  `feedback` varchar(4096) DEFAULT NULL,
  KEY `fk_pregunta` (`pregunta_id`),
  CONSTRAINT `fk_pregunta` FOREIGN KEY (`pregunta_id`) REFERENCES `preguntas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opciones`
--

LOCK TABLES `opciones` WRITE;
/*!40000 ALTER TABLE `opciones` DISABLE KEYS */;
INSERT INTO `opciones` VALUES (1,'Siempre','En efecto, con la autoformaci├│n el docente concibe su propio desarrollo y enfrenta la responsabilidad del aprendizaje aprovechando su entorno personal, herramientas, experiencia en los procesos y fuentes de informaci├│n disponibles, con lo cual adquiere habilidades para su propio beneficio. Para lograrlo, Elva Mauricio estudiante de posgrado de la Universidad San Ignacio de Loyola, Per├║, recomienda aprovechar los entornos de la comunidad virtual ya que estos conforman un espacio adecuado para la autoformaci├│n de los docentes logrando una formaci├│n abierta en la red ya que se aprovechan las ventajas que brindan estas tecnolog├¡as utilizando, por citar un ejemplo, los c├¡rculos de interaprendizaje. Y, si observamos m├ís a fondo nos podremos dar cuenta de que este proyecto de autoevaluaci├│n tambi├®n invita a la autoformaci├│n y la reflexi├│n personal.'),(1,'Casi siempre','En efecto, con la autoformaci├│n el docente concibe su propio desarrollo y enfrenta la responsabilidad del aprendizaje aprovechando su entorno personal, herramientas, experiencia en los procesos y fuentes de informaci├│n disponibles, con lo cual adquiere habilidades para su propio beneficio. Para lograrlo, Elva Mauricio estudiante de posgrado de la Universidad San Ignacio de Loyola, Per├║, recomienda aprovechar los entornos de la comunidad virtual ya que estos conforman un espacio adecuado para la autoformaci├│n de los docentes logrando una formaci├│n abierta en la red ya que se aprovechan las ventajas que brindan estas tecnolog├¡as utilizando, por citar un ejemplo, los c├¡rculos de interaprendizaje. Y, si observamos m├ís a fondo nos podremos dar cuenta de que este proyecto de autoevaluaci├│n tambi├®n invita a la autoformaci├│n y la reflexi├│n personal.'),(1,'Casi nunca','La autoformaci├│n docente se puede entender como la gesti├│n del conocimiento personal para el desarrollo de saberes, los cuales se ven reflejados en el logro de los aprendizajes de los estudiantes. Si el individuo toma responsabilidad de su formaci├│n acad├®mica mediante su propio ser podr├¡a reorientar su vida y su existencia; incluso podr├¡a percibir en s├¡ mismo otra personalidad sustentada mediante la autonom├¡a que ayuda a fortalecer su formaci├│n. Este proceso se puede denominar como una actividad autodidacta y reflexiva.\r\nLa formaci├│n constante dota al docente de elementos indispensables para sentirse una mejor persona y de mayor conocimiento para la toma de decisiones, es importante estar en constante formaci├│n y no caer en el des├ínimo o en la falta de motivaci├│n para seguir creciendo, sobre todo ahora con los cambios tan acelerados en la tecnolog├¡a. El docente debe conocer diferentes herramientas que le permitan generar estrategias que aplique en sus clases.\r\nLa educaci├│n formal necesita profesionales ÔÇ£con nivel de pensamiento superior, preparados, con disposici├│n, reconocimiento de la otredad, que sepa trabajar de manera colaborativa y que sepa cuestionarÔÇØ (Feliz S. , Samayoa. L. 2015, pg.20)'),(1,'Nunca','La autoformaci├│n docente se puede entender como la gesti├│n del conocimiento personal para el desarrollo de saberes, los cuales se ven reflejados en el logro de los aprendizajes de los estudiantes. Si el individuo toma responsabilidad de su formaci├│n acad├®mica mediante su propio ser podr├¡a reorientar su vida y su existencia; incluso podr├¡a percibir en s├¡ mismo otra personalidad sustentada mediante la autonom├¡a que ayuda a fortalecer su formaci├│n. Este proceso se puede denominar como una actividad autodidacta y reflexiva.\r\nLa formaci├│n constante dota al docente de elementos indispensables para sentirse una mejor persona y de mayor conocimiento para la toma de decisiones, es importante estar en constante formaci├│n y no caer en el des├ínimo o en la falta de motivaci├│n para seguir creciendo, sobre todo ahora con los cambios tan acelerados en la tecnolog├¡a. El docente debe conocer diferentes herramientas que le permitan generar estrategias que aplique en sus clases.\r\nLa educaci├│n formal necesita profesionales ÔÇ£con nivel de pensamiento superior, preparados, con disposici├│n, reconocimiento de la otredad, que sepa trabajar de manera colaborativa y que sepa cuestionarÔÇØ (Feliz S. , Samayoa. L. 2015, pg.20)'),(2,'Siempre','Se refleja la toma de conciencia sobre la importancia de impulsar la cooperaci├│n entre alumnos y entre pares ya que, si la informaci├│n se comparte, se genera un aprendizaje con significado e identidad. Incluso, Cecilia Fierro, en su teor├¡a sobre las dimensiones sugiere enfatizar la funci├│n social adem├ís de reforzar el aspecto valoral considerando las actitudes que aprenden los alumnos en la escuela. El impulso de actividades como la cooperaci├│n entre pares, estimula el pensamiento cr├¡tico, la motivaci├│n y la metacognici├│n.'),(2,'Casi siempre','Se refleja la toma de conciencia sobre la importancia de impulsar la cooperaci├│n entre alumnos y entre pares ya que, si la informaci├│n se comparte, se genera un aprendizaje con significado e identidad. Incluso, Cecilia Fierro, en su teor├¡a sobre las dimensiones sugiere enfatizar la funci├│n social adem├ís de reforzar el aspecto valoral considerando las actitudes que aprenden los alumnos en la escuela. El impulso de actividades como la cooperaci├│n entre pares, estimula el pensamiento cr├¡tico, la motivaci├│n y la metacognici├│n.'),(2,'Casi nunca','El aprendizaje se debe construir dentro de un ambiente colectivo y no en solitario, si la informaci├│n se comparte se genera un aprendizaje con significado e identidad.\r\nCecilia Fierro, en la teor├¡a sobre las dimensiones sugiere enfatizar la funci├│n social y esto  se puede lograr mediante trabajo en equipo e integraci├│n con otras materias. De igual manera, refuerza el aspecto valoral considerando las actitudes que aprenden los alumnos en la escuela.\r\nEl impulso de actividades como la cooperaci├│n entre pares, estimula el pensamiento cr├¡tico, la motivaci├│n y la metacognici├│n'),(2,'Nunca','El aprendizaje se debe construir dentro de un ambiente colectivo y no en solitario, si la informaci├│n se comparte se genera un aprendizaje con significado e identidad.\r\nCecilia Fierro, en la teor├¡a sobre las dimensiones sugiere enfatizar la funci├│n social y esto  se puede lograr mediante trabajo en equipo e integraci├│n con otras materias. De igual manera, refuerza el aspecto valoral considerando las actitudes que aprenden los alumnos en la escuela.\r\nEl impulso de actividades como la cooperaci├│n entre pares, estimula el pensamiento cr├¡tico, la motivaci├│n y la metacognici├│n'),(3,'Siempre','Como bien sabes, promover en el aula el pensamiento reflexivo  genera contextos de aprendizaje innovadores donde el estudiante es capaz de construir su conocimiento m├ís all├í de los contenidos del curso o de la experiencia del docente. Es necesario precisar que en educaci├│n el t├®rmino reflexi├│n tiene sus bases en las aportaciones de la pedagog├¡a activa a principios del siglo XX con Dewey, quien establece las diferencias entre la acci├│n de rutina, fundada en la tradici├│n y la autoridad externa, y la acci├│n reflexiva que es una consideraci├│n activa, persistente y cuidadosa de una creencia o conocimiento a la luz de sus bases y de las consecuencias que produce. Los docentes que asumen la acci├│n reflexiva, entienden la naturaleza din├ímica de la educaci├│n y c├│mo ├®sta depende del contexto y las circunstancias en que se dan, a su vez, afrontan los problemas educativos buscando soluciones y emprendiendo acciones para poder resolverlos (Dewey, 1989, en Tallaferro, 2006).'),(3,'Casi siempre','Como bien sabes, promover en el aula el pensamiento reflexivo  genera contextos de aprendizaje innovadores donde el estudiante es capaz de construir su conocimiento m├ís all├í de los contenidos del curso o de la experiencia del docente. Es necesario precisar que en educaci├│n el t├®rmino reflexi├│n tiene sus bases en las aportaciones de la pedagog├¡a activa a principios del siglo XX con Dewey, quien establece las diferencias entre la acci├│n de rutina, fundada en la tradici├│n y la autoridad externa, y la acci├│n reflexiva que es una consideraci├│n activa, persistente y cuidadosa de una creencia o conocimiento a la luz de sus bases y de las consecuencias que produce. Los docentes que asumen la acci├│n reflexiva, entienden la naturaleza din├ímica de la educaci├│n y c├│mo ├®sta depende del contexto y las circunstancias en que se dan, a su vez, afrontan los problemas educativos buscando soluciones y emprendiendo acciones para poder resolverlos (Dewey, 1989, en Tallaferro, 2006).'),(3,'Casi nunca','Es importante asegurarse de que los alumnos te sigan cuando das un tema, el asentir con la cabeza no siempre significa que est├ín asimilando la informaci├│n. En lo que respecta a educaci├│n, el t├®rmino reflexi├│n tiene sus bases en las aportaciones de la pedagog├¡a activa a principios del siglo XX con Dewey, quien establece las diferencias entre la acci├│n de rutina, fundada en la tradici├│n y la autoridad externa, y la acci├│n reflexiva que es una consideraci├│n activa, persistente y cuidadosa de una creencia o conocimiento a la luz de sus bases y de las consecuencias que produce. Para los docentes que adoptan el primer tipo de acci├│n la pr├íctica educativa obedece a par├ímetros preestablecidos que no se cuestionan. Por el contrario, aquellos que asumen la acci├│n reflexiva, entienden la naturaleza din├ímica de la educaci├│n y c├│mo ├®sta depende del contexto y las circunstancias en que se dan, a su vez, afrontan los problemas educativos buscando soluciones y emprendiendo acciones para poder resolverlos (Dewey, 1989, en Tallaferro, 2006).'),(3,'Nunca','Es importante asegurarse de que los alumnos te sigan cuando das un tema, el asentir con la cabeza no siempre significa que est├ín asimilando la informaci├│n. En lo que respecta a educaci├│n, el t├®rmino reflexi├│n tiene sus bases en las aportaciones de la pedagog├¡a activa a principios del siglo XX con Dewey, quien establece las diferencias entre la acci├│n de rutina, fundada en la tradici├│n y la autoridad externa, y la acci├│n reflexiva que es una consideraci├│n activa, persistente y cuidadosa de una creencia o conocimiento a la luz de sus bases y de las consecuencias que produce. Para los docentes que adoptan el primer tipo de acci├│n la pr├íctica educativa obedece a par├ímetros preestablecidos que no se cuestionan. Por el contrario, aquellos que asumen la acci├│n reflexiva, entienden la naturaleza din├ímica de la educaci├│n y c├│mo ├®sta depende del contexto y las circunstancias en que se dan, a su vez, afrontan los problemas educativos buscando soluciones y emprendiendo acciones para poder resolverlos (Dewey, 1989, en Tallaferro, 2006).'),(4,'Simpre','Es natural que en ocasiones existan tensiones entre maestro y alumnos siempre y cuando no se d├® con excesiva frecuencia. Es por ello que se debe generar empat├¡a con los estudiantes, para que tengan la confianza de expresar sus ideas libremente. Como dice Goleman (2007): ÔÇ£Ver las cosas desde la perspectiva del otro, rompe los estereotipos establecidos y promueve la toleranciaÔÇØ\r\nAl respecto Perrenoud /2007) recomienda:\r\nPrevenir la violencia en la escuela o en la ciudad.\r\nLuchar contra los prejuicios y las discriminaciones sexuales, ├®tnicas y sociales.\r\nParticipar en la creaci├│n de reglas de vida com├║n referentes a las reglas de la disciplina en el centro, las sanciones, la apreciaci├│n de la conducta.\r\nAnalizar la relaci├│n pedag├│gica, la autoridad, la comunicaci├│n en clase.\r\nDesarrollar el sentido de la responsabilidad, la solidaridad, el sentimiento de justicia.\r\nNota: Si el grupo ya est├í muy viciado lo ideal ser├¡a rotar a algunos estudiantes a otros grupos.'),(4,'Casi siempre','Es natural que en ocasiones existan tensiones entre maestro y alumnos siempre y cuando no se d├® con excesiva frecuencia. Es por ello que se debe generar empat├¡a con los estudiantes, para que tengan la confianza de expresar sus ideas libremente. Como dice Goleman (2007): ÔÇ£Ver las cosas desde la perspectiva del otro, rompe los estereotipos establecidos y promueve la toleranciaÔÇØ\r\nAl respecto Perrenoud /2007) recomienda:\r\nPrevenir la violencia en la escuela o en la ciudad.\r\nLuchar contra los prejuicios y las discriminaciones sexuales, ├®tnicas y sociales.\r\nParticipar en la creaci├│n de reglas de vida com├║n referentes a las reglas de la disciplina en el centro, las sanciones, la apreciaci├│n de la conducta.\r\nAnalizar la relaci├│n pedag├│gica, la autoridad, la comunicaci├│n en clase.\r\nDesarrollar el sentido de la responsabilidad, la solidaridad, el sentimiento de justicia.\r\nNota: Si el grupo ya est├í muy viciado lo ideal ser├¡a rotar a algunos estudiantes a otros grupos.'),(4,'Casi nunca','Es natural que en ocasiones existan tensiones entre maestro y alumnos siempre y cuando no se d├® con excesiva frecuencia. \r\nAl respecto Perrenoud /2007) recomienda:\r\nPrevenir la violencia en la escuela o en la ciudad.\r\nLuchar contra los prejuicios y las discriminaciones sexuales, ├®tnicas y sociales.\r\nParticipar en la creaci├│n de reglas de vida com├║n referentes a las reglas de la disciplina en el centro, las sanciones, la apreciaci├│n de la conducta.\r\nAnalizar la relaci├│n pedag├│gica, la autoridad, la comunicaci├│n en clase.\r\nDesarrollar el sentido de la responsabilidad, la solidaridad, el sentimiento de justicia.'),(4,'Nunca','Es natural que en ocasiones existan tensiones entre maestro y alumnos siempre y cuando no se d├® con excesiva frecuencia. \r\nAl respecto Perrenoud /2007) recomienda:\r\nPrevenir la violencia en la escuela o en la ciudad.\r\nLuchar contra los prejuicios y las discriminaciones sexuales, ├®tnicas y sociales.\r\nParticipar en la creaci├│n de reglas de vida com├║n referentes a las reglas de la disciplina en el centro, las sanciones, la apreciaci├│n de la conducta.\r\nAnalizar la relaci├│n pedag├│gica, la autoridad, la comunicaci├│n en clase.\r\nDesarrollar el sentido de la responsabilidad, la solidaridad, el sentimiento de justicia.'),(5,'Siempre','Promover la autoevaluaci├│n en el alumno refleja la experiencia del docente puesto que se educa en la responsabilidad, as├¡ el estudiante  aprende a valorar, criticar y reflexionar sobre el proceso de ense├▒anza y el aprendizaje que ├®l realiza,  porque toma conciencia de cu├íl es su progreso individual, se responsabiliza de sus actividades lo que permite al docente valorar las formas de ense├▒anza, los contenidos y materiales did├ícticos.'),(5,'Casi siempre','Promover la autoevaluaci├│n en el alumno refleja la experiencia del docente puesto que se educa en la responsabilidad, as├¡ el estudiante  aprende a valorar, criticar y reflexionar sobre el proceso de ense├▒anza y el aprendizaje que ├®l realiza,  porque toma conciencia de cu├íl es su progreso individual, se responsabiliza de sus actividades lo que permite al docente valorar las formas de ense├▒anza, los contenidos y materiales did├ícticos.'),(5,'Casi nunca','La autoevaluaci├│n permite educar en la responsabilidad, ya que el estudiante  aprende a valorar, criticar y reflexionar sobre el proceso de ense├▒anza y el aprendizaje que ├®l realiza,  porque toma conciencia de cu├íl es su progreso individual, se responsabiliza de sus actividades lo que permite al docente valorar las formas de ense├▒anza, los contenidos y materiales did├ícticos.\r\nExisten t├®cnicas de autoevaluaci├│n como los foros de discusi├│n o los debates, que los docentes pueden aplicar, en ellas se favorecen las competencias sobre el sustento de posturas personales; consideraci├│n de puntos de vista de manera cr├¡tica y reflexiva; generaci├│n de conciencia c├¡vica y ├®tica as├¡ como la autorregulaci├│n.'),(5,'Nunca','La autoevaluaci├│n permite educar en la responsabilidad, ya que el estudiante  aprende a valorar, criticar y reflexionar sobre el proceso de ense├▒anza y el aprendizaje que ├®l realiza,  porque toma conciencia de cu├íl es su progreso individual, se responsabiliza de sus actividades lo que permite al docente valorar las formas de ense├▒anza, los contenidos y materiales did├ícticos.\r\nExisten t├®cnicas de autoevaluaci├│n como los foros de discusi├│n o los debates, que los docentes pueden aplicar, en ellas se favorecen las competencias sobre el sustento de posturas personales; consideraci├│n de puntos de vista de manera cr├¡tica y reflexiva; generaci├│n de conciencia c├¡vica y ├®tica as├¡ como la autorregulaci├│n.'),(6,'Siempre','Hacer cambios constantes en el modo de ense├▒ar refleja el compromiso del docente por hacer su trabajo cada vez mejor.'),(6,'Casi siempre','Hacer cambios constantes en el modo de ense├▒ar refleja el compromiso del docente por hacer su trabajo cada vez mejor.'),(6,'Casi nunca','Perrenoud recomienda motivar a los estudiantes realizando nuevas situaciones de aprendizaje como actividades de investigaci├│n o proyectos.'),(6,'Nunca','Perrenoud recomienda motivar a los estudiantes realizando nuevas situaciones de aprendizaje como actividades de investigaci├│n o proyectos.'),(7,'Siempre','ÔÇ£La funci├│n de un maestro como profesional que trabaja en una instituci├│n est├í cimentada sobre la base de las relaciones entre las personas que participan en el proceso educativo: alumnos, maestros, directores, padres de familia, estas relaciones son complejas ya que se construyen sobre la base de las diferencias individuales.ÔÇØ Fierro (2015) \r\nEn este caso se refleja un alto nivel de experiencia y seguridad en la toma de decisiones en cuanto a la resoluci├│n de conflictos a nivel educativo.'),(7,'Casi siempre','ÔÇ£La funci├│n de un maestro como profesional que trabaja en una instituci├│n est├í cimentada sobre la base de las relaciones entre las personas que participan en el proceso educativo: alumnos, maestros, directores, padres de familia, estas relaciones son complejas ya que se construyen sobre la base de las diferencias individuales.ÔÇØ Fierro (2015) \r\nEn este caso se refleja un alto nivel de experiencia y seguridad en la toma de decisiones en cuanto a la resoluci├│n de conflictos a nivel educativo.'),(7,'Casi nunca','ÔÇ£La funci├│n de un maestro como profesional que trabaja en una instituci├│n est├í cimentada sobre la base de las relaciones entre las personas que participan en el proceso educativo: alumnos, maestros, directores, padres de familia, estas relaciones son complejas ya que se construyen sobre la base de las diferencias individuales.ÔÇØ Fierro (2015)\r\nPor ello cobra especial importancia tener sentido de an├ílisis y reflexi├│n para  tomar decisiones, y as├¡ tomar acciones que ayuden al logro de los objetivos del grupo,  de la academia o el contexto educativo particular donde se pudiera tener una situaci├│n de conflicto. Es recomendable tomar cursos sobre habilidades docentes para conocer  nuevas formas de actuar ante situaciones diversas en el aula.'),(7,'Nunca','ÔÇ£La funci├│n de un maestro como profesional que trabaja en una instituci├│n est├í cimentada sobre la base de las relaciones entre las personas que participan en el proceso educativo: alumnos, maestros, directores, padres de familia, estas relaciones son complejas ya que se construyen sobre la base de las diferencias individuales.ÔÇØ Fierro (2015)\r\nPor ello cobra especial importancia tener sentido de an├ílisis y reflexi├│n para  tomar decisiones, y as├¡ tomar acciones que ayuden al logro de los objetivos del grupo,  de la academia o el contexto educativo particular donde se pudiera tener una situaci├│n de conflicto. Es recomendable tomar cursos sobre habilidades docentes para conocer  nuevas formas de actuar ante situaciones diversas en el aula.'),(8,'Siempre','Se toman en cuenta las dimensiones interpersonal y social que subraya Cecilia Fierro, aun as├¡ cabe agregar que ÔÇ£El conjunto de decisiones y pr├ícticas de los maestros ante la diversidad de condiciones culturales y socioecon├│micas, que colocan a los alumnos en posiciones distintas frente a la experiencia escolar, constituye sin duda, el espacio donde entra en juego de manera m├ís clara la igualdad de oportunidades educativas.ÔÇØ (Ca├▒edo, 2013, p.107).'),(8,'Casi siempre','Se toman en cuenta las dimensiones interpersonal y social que subraya Cecilia Fierro, aun as├¡ cabe agregar que ÔÇ£El conjunto de decisiones y pr├ícticas de los maestros ante la diversidad de condiciones culturales y socioecon├│micas, que colocan a los alumnos en posiciones distintas frente a la experiencia escolar, constituye sin duda, el espacio donde entra en juego de manera m├ís clara la igualdad de oportunidades educativas.ÔÇØ (Ca├▒edo, 2013, p.107).'),(8,'Casi nunca','Ser docente, significa tener un poco de psic├│logo, tutor, gu├¡a y acompa├▒ante para que los alumnos conf├¡en en la persona que les imparte la clase, por ello es importante involucrarse en estos aspectos para conocer mejor a nuestros estudiantes.ÔÇ£El conjunto de decisiones y pr├ícticas de los maestros ante la diversidad de condiciones culturales y socioecon├│micas, que colocan a los alumnos en posiciones distintas frente a la experiencia escolar, constituye, sin duda, el espacio donde entra en juego de manera m├ís clara la igualdad de oportunidades educativas.ÔÇØ (Ca├▒edo, 2013, p.107).'),(8,'Nunca','Ser docente, significa tener un poco de psic├│logo, tutor, gu├¡a y acompa├▒ante para que los alumnos conf├¡en en la persona que les imparte la clase, por ello es importante involucrarse en estos aspectos para conocer mejor a nuestros estudiantes.ÔÇ£El conjunto de decisiones y pr├ícticas de los maestros ante la diversidad de condiciones culturales y socioecon├│micas, que colocan a los alumnos en posiciones distintas frente a la experiencia escolar, constituye, sin duda, el espacio donde entra en juego de manera m├ís clara la igualdad de oportunidades educativas.ÔÇØ (Ca├▒edo, 2013, p.107).'),(8,'Siempre','Se toman en cuenta las dimensiones interpersonal y social que subraya Cecilia Fierro, aun as├¡ cabe agregar que ÔÇ£El conjunto de decisiones y pr├ícticas de los maestros ante la diversidad de condiciones culturales y socioecon├│micas, que colocan a los alumnos en posiciones distintas frente a la experiencia escolar, constituye sin duda, el espacio donde entra en juego de manera m├ís clara la igualdad de oportunidades educativas.ÔÇØ (Ca├▒edo, 2013, p.107).'),(8,'Casi siempre','Se toman en cuenta las dimensiones interpersonal y social que subraya Cecilia Fierro, aun as├¡ cabe agregar que ÔÇ£El conjunto de decisiones y pr├ícticas de los maestros ante la diversidad de condiciones culturales y socioecon├│micas, que colocan a los alumnos en posiciones distintas frente a la experiencia escolar, constituye sin duda, el espacio donde entra en juego de manera m├ís clara la igualdad de oportunidades educativas.ÔÇØ (Ca├▒edo, 2013, p.107).'),(8,'Casi nunca','Ser docente, significa tener un poco de psic├│logo, tutor, gu├¡a y acompa├▒ante para que los alumnos conf├¡en en la persona que les imparte la clase, por ello es importante involucrarse en estos aspectos para conocer mejor a nuestros estudiantes.ÔÇ£El conjunto de decisiones y pr├ícticas de los maestros ante la diversidad de condiciones culturales y socioecon├│micas, que colocan a los alumnos en posiciones distintas frente a la experiencia escolar, constituye, sin duda, el espacio donde entra en juego de manera m├ís clara la igualdad de oportunidades educativas.ÔÇØ (Ca├▒edo, 2013, p.107).'),(8,'Nunca','Ser docente, significa tener un poco de psic├│logo, tutor, gu├¡a y acompa├▒ante para que los alumnos conf├¡en en la persona que les imparte la clase, por ello es importante involucrarse en estos aspectos para conocer mejor a nuestros estudiantes.ÔÇ£El conjunto de decisiones y pr├ícticas de los maestros ante la diversidad de condiciones culturales y socioecon├│micas, que colocan a los alumnos en posiciones distintas frente a la experiencia escolar, constituye, sin duda, el espacio donde entra en juego de manera m├ís clara la igualdad de oportunidades educativas.ÔÇØ (Ca├▒edo, 2013, p.107).'),(9,'Siempre','La Organizaci├│n de las Naciones Unidas para la Educaci├│n, la Ciencia y la Cultura (UNESCO, por sus siglas en ingl├®s, 2004), aboga por la articulaci├│n familia y fundamenta esta necesidad en tres razones: el reconocimiento de que los padres son los primeros educadores de sus hijos e hijas; el impacto positivo que puede tener una educaci├│n temprana de calidad en el desarrollo y aprendizaje de los ni├▒os; y la familia como un espacio privilegiado para lograr una ampliaci├│n de la cobertura de la educaci├│n de la primera infancia. Bajo esta teor├¡a, al realizar reuniones con los padres de familia para involucrarlos en el aprendizaje de sus hijos se pueden obtener mejores resultados en los ├¡ndices de permanencia escolar.'),(9,'Casi siempre','La Organizaci├│n de las Naciones Unidas para la Educaci├│n, la Ciencia y la Cultura (UNESCO, por sus siglas en ingl├®s, 2004), aboga por la articulaci├│n familia y fundamenta esta necesidad en tres razones: el reconocimiento de que los padres son los primeros educadores de sus hijos e hijas; el impacto positivo que puede tener una educaci├│n temprana de calidad en el desarrollo y aprendizaje de los ni├▒os; y la familia como un espacio privilegiado para lograr una ampliaci├│n de la cobertura de la educaci├│n de la primera infancia. Bajo esta teor├¡a, al realizar reuniones con los padres de familia para involucrarlos en el aprendizaje de sus hijos se pueden obtener mejores resultados en los ├¡ndices de permanencia escolar.'),(9,'Casi nunca',' Como se mencion├│ en la pregunta anterior el entorno del alumno es fundamental para su formaci├│n y el entorno familiar no se puede omitir ya que gran parte de los valores\r\nson copiados de la familia.Mart├¡nez (2004), sugiere que el factor m├ís influyente en el desempe├▒o escolar son las pr├ícticas familiares, incluso por encima de los aspectos demogr├íficos, econ├│micos y comunitarios que rodean al estudiante. Por ello, aun en un ambiente universitario, es importante considerar las relaciones entre las personas que participan en el proceso educativo, incluyendo a los padres de familia.\r\nCabe agregar que, la Organizaci├│n de las Naciones Unidas para la Educaci├│n, la Ciencia y la Cultura (UNESCO, por sus siglas en ingl├®s, 2004), aboga por la articulaci├│n familia y fundamenta esta necesidad en tres razones: el reconocimiento de que los padres son los primeros educadores de sus hijos e hijas; el impacto positivo que puede tener una educaci├│n temprana de calidad en el desarrollo y aprendizaje de los ni├▒os; y la familia como un espacio privilegiado para lograr una ampliaci├│n de la cobertura de la educaci├│n de la primera infancia.'),(9,'Nunca',' Como se mencion├│ en la pregunta anterior el entorno del alumno es fundamental para su formaci├│n y el entorno familiar no se puede omitir ya que gran parte de los valores\r\nson copiados de la familia.Mart├¡nez (2004), sugiere que el factor m├ís influyente en el desempe├▒o escolar son las pr├ícticas familiares, incluso por encima de los aspectos demogr├íficos, econ├│micos y comunitarios que rodean al estudiante. Por ello, aun en un ambiente universitario, es importante considerar las relaciones entre las personas que participan en el proceso educativo, incluyendo a los padres de familia.\r\nCabe agregar que, la Organizaci├│n de las Naciones Unidas para la Educaci├│n, la Ciencia y la Cultura (UNESCO, por sus siglas en ingl├®s, 2004), aboga por la articulaci├│n familia y fundamenta esta necesidad en tres razones: el reconocimiento de que los padres son los primeros educadores de sus hijos e hijas; el impacto positivo que puede tener una educaci├│n temprana de calidad en el desarrollo y aprendizaje de los ni├▒os; y la familia como un espacio privilegiado para lograr una ampliaci├│n de la cobertura de la educaci├│n de la primera infancia.'),(9,'Siempre','La Organizaci├│n de las Naciones Unidas para la Educaci├│n, la Ciencia y la Cultura (UNESCO, por sus siglas en ingl├®s, 2004), aboga por la articulaci├│n familia y fundamenta esta necesidad en tres razones: el reconocimiento de que los padres son los primeros educadores de sus hijos e hijas; el impacto positivo que puede tener una educaci├│n temprana de calidad en el desarrollo y aprendizaje de los ni├▒os; y la familia como un espacio privilegiado para lograr una ampliaci├│n de la cobertura de la educaci├│n de la primera infancia. Bajo esta teor├¡a, al realizar reuniones con los padres de familia para involucrarlos en el aprendizaje de sus hijos se pueden obtener mejores resultados en los ├¡ndices de permanencia escolar.'),(9,'Casi siempre','La Organizaci├│n de las Naciones Unidas para la Educaci├│n, la Ciencia y la Cultura (UNESCO, por sus siglas en ingl├®s, 2004), aboga por la articulaci├│n familia y fundamenta esta necesidad en tres razones: el reconocimiento de que los padres son los primeros educadores de sus hijos e hijas; el impacto positivo que puede tener una educaci├│n temprana de calidad en el desarrollo y aprendizaje de los ni├▒os; y la familia como un espacio privilegiado para lograr una ampliaci├│n de la cobertura de la educaci├│n de la primera infancia. Bajo esta teor├¡a, al realizar reuniones con los padres de familia para involucrarlos en el aprendizaje de sus hijos se pueden obtener mejores resultados en los ├¡ndices de permanencia escolar.'),(9,'Casi nunca',' Como se mencion├│ en la pregunta anterior el entorno del alumno es fundamental para su formaci├│n y el entorno familiar no se puede omitir ya que gran parte de los valores\r\nson copiados de la familia.Mart├¡nez (2004), sugiere que el factor m├ís influyente en el desempe├▒o escolar son las pr├ícticas familiares, incluso por encima de los aspectos demogr├íficos, econ├│micos y comunitarios que rodean al estudiante. Por ello, aun en un ambiente universitario, es importante considerar las relaciones entre las personas que participan en el proceso educativo, incluyendo a los padres de familia.\r\nCabe agregar que, la Organizaci├│n de las Naciones Unidas para la Educaci├│n, la Ciencia y la Cultura (UNESCO, por sus siglas en ingl├®s, 2004), aboga por la articulaci├│n familia y fundamenta esta necesidad en tres razones: el reconocimiento de que los padres son los primeros educadores de sus hijos e hijas; el impacto positivo que puede tener una educaci├│n temprana de calidad en el desarrollo y aprendizaje de los ni├▒os; y la familia como un espacio privilegiado para lograr una ampliaci├│n de la cobertura de la educaci├│n de la primera infancia.'),(9,'Nunca',' Como se mencion├│ en la pregunta anterior el entorno del alumno es fundamental para su formaci├│n y el entorno familiar no se puede omitir ya que gran parte de los valores\r\nson copiados de la familia.Mart├¡nez (2004), sugiere que el factor m├ís influyente en el desempe├▒o escolar son las pr├ícticas familiares, incluso por encima de los aspectos demogr├íficos, econ├│micos y comunitarios que rodean al estudiante. Por ello, aun en un ambiente universitario, es importante considerar las relaciones entre las personas que participan en el proceso educativo, incluyendo a los padres de familia.\r\nCabe agregar que, la Organizaci├│n de las Naciones Unidas para la Educaci├│n, la Ciencia y la Cultura (UNESCO, por sus siglas en ingl├®s, 2004), aboga por la articulaci├│n familia y fundamenta esta necesidad en tres razones: el reconocimiento de que los padres son los primeros educadores de sus hijos e hijas; el impacto positivo que puede tener una educaci├│n temprana de calidad en el desarrollo y aprendizaje de los ni├▒os; y la familia como un espacio privilegiado para lograr una ampliaci├│n de la cobertura de la educaci├│n de la primera infancia.'),(10,'Siempre',' Promover valores como la responsabilidad, la solidaridad y el sentido de justicia ayudan a prevenir discriminaciones o diferencias sociales. Es fundamental promover los valores pero lo m├ís importante es que el docente predique con el ejemplo; la educaci├│n debe basarse en tres cualidades: ser justo, tener equidad y respeto por las personas. La UTP, a trav├®s del Comit├® de Igualdad Laboral y No Discriminaci├│n promueve diferentes cursos de valores que te pueden ser de utilidad.'),(10,'Casi siempre',' Promover valores como la responsabilidad, la solidaridad y el sentido de justicia ayudan a prevenir discriminaciones o diferencias sociales. Es fundamental promover los valores pero lo m├ís importante es que el docente predique con el ejemplo; la educaci├│n debe basarse en tres cualidades: ser justo, tener equidad y respeto por las personas. La UTP, a trav├®s del Comit├® de Igualdad Laboral y No Discriminaci├│n promueve diferentes cursos de valores que te pueden ser de utilidad.'),(10,'Casi nunca','Los valores morales permiten relacionarse y comprender las posturas del otro, cuidar el medio ambiente, la integridad humana, la dignidad todo lo que nos permite vivir en armon├¡a con la sociedad y el mundo. Tambi├®n se debe considerar la dimensi├│n ├®tica que se expresa en las preferencias conscientes e inconscientes. ┬┐Qu├® actitudes aprenden los alumnos en la escuela? Es fundamental promover los valores pero lo m├ís importante es que el docente predique con el ejemplo; la educaci├│n debe basarse en tres cualidades: ser justo, tener equidad y respeto por las personas. La UTP, a trav├®s del Comit├® de Igualdad Laboral y No Discriminaci├│n promueve diferentes cursos de valores que te pueden ser de utilidad.'),(10,'Nunca','Los valores morales permiten relacionarse y comprender las posturas del otro, cuidar el medio ambiente, la integridad humana, la dignidad todo lo que nos permite vivir en armon├¡a con la sociedad y el mundo. Tambi├®n se debe considerar la dimensi├│n ├®tica que se expresa en las preferencias conscientes e inconscientes. ┬┐Qu├® actitudes aprenden los alumnos en la escuela? Es fundamental promover los valores pero lo m├ís importante es que el docente predique con el ejemplo; la educaci├│n debe basarse en tres cualidades: ser justo, tener equidad y respeto por las personas. La UTP, a trav├®s del Comit├® de Igualdad Laboral y No Discriminaci├│n promueve diferentes cursos de valores que te pueden ser de utilidad.'),(10,'Siempre',' Promover valores como la responsabilidad, la solidaridad y el sentido de justicia ayudan a prevenir discriminaciones o diferencias sociales. Es fundamental promover los valores pero lo m├ís importante es que el docente predique con el ejemplo; la educaci├│n debe basarse en tres cualidades: ser justo, tener equidad y respeto por las personas. La UTP, a trav├®s del Comit├® de Igualdad Laboral y No Discriminaci├│n promueve diferentes cursos de valores que te pueden ser de utilidad.'),(10,'Casi siempre',' Promover valores como la responsabilidad, la solidaridad y el sentido de justicia ayudan a prevenir discriminaciones o diferencias sociales. Es fundamental promover los valores pero lo m├ís importante es que el docente predique con el ejemplo; la educaci├│n debe basarse en tres cualidades: ser justo, tener equidad y respeto por las personas. La UTP, a trav├®s del Comit├® de Igualdad Laboral y No Discriminaci├│n promueve diferentes cursos de valores que te pueden ser de utilidad.'),(10,'Casi nunca','Los valores morales permiten relacionarse y comprender las posturas del otro, cuidar el medio ambiente, la integridad humana, la dignidad todo lo que nos permite vivir en armon├¡a con la sociedad y el mundo. Tambi├®n se debe considerar la dimensi├│n ├®tica que se expresa en las preferencias conscientes e inconscientes. ┬┐Qu├® actitudes aprenden los alumnos en la escuela? Es fundamental promover los valores pero lo m├ís importante es que el docente predique con el ejemplo; la educaci├│n debe basarse en tres cualidades: ser justo, tener equidad y respeto por las personas. La UTP, a trav├®s del Comit├® de Igualdad Laboral y No Discriminaci├│n promueve diferentes cursos de valores que te pueden ser de utilidad.'),(10,'Nunca','Los valores morales permiten relacionarse y comprender las posturas del otro, cuidar el medio ambiente, la integridad humana, la dignidad todo lo que nos permite vivir en armon├¡a con la sociedad y el mundo. Tambi├®n se debe considerar la dimensi├│n ├®tica que se expresa en las preferencias conscientes e inconscientes. ┬┐Qu├® actitudes aprenden los alumnos en la escuela? Es fundamental promover los valores pero lo m├ís importante es que el docente predique con el ejemplo; la educaci├│n debe basarse en tres cualidades: ser justo, tener equidad y respeto por las personas. La UTP, a trav├®s del Comit├® de Igualdad Laboral y No Discriminaci├│n promueve diferentes cursos de valores que te pueden ser de utilidad.'),(11,'Siempre','Si los j├│venes que ya no dependen de una calificaci├│n te buscan para hacer preguntas sobre alg├║n aspecto personal puede indicar que has dejado un grado de confianza importante.'),(11,'Casi siempre','Si los j├│venes que ya no dependen de una calificaci├│n te buscan para hacer preguntas sobre alg├║n aspecto personal puede indicar que has dejado un grado de confianza importante.'),(11,'Casi nunca','Ser docente, significa tener un poco de psic├│logo, tutor, gu├¡a y acompa├▒ante para que los alumnos conf├¡en en la persona que les imparte la clase, por ello es importante involucrarse en estos aspectos para conocer mejor a nuestros estudiantes.\r\nPara ser un profesor emp├ítico y poder ser un referente en la formaci├│n de los futuros l├¡deres, es necesario establecer ciertas estrategias, como aprenderse los nombres de cada estudiante, conocerlos y recordar algunos detalles sobre ellos, como sus actividades favoritas y sus gustos musicales. Esto genera en el estudiante una sensaci├│n de bienestar y sobre todo, le hace sentir que importa. (Universia, 2017).'),(11,'Nunca','Ser docente, significa tener un poco de psic├│logo, tutor, gu├¡a y acompa├▒ante para que los alumnos conf├¡en en la persona que les imparte la clase, por ello es importante involucrarse en estos aspectos para conocer mejor a nuestros estudiantes.\r\nPara ser un profesor emp├ítico y poder ser un referente en la formaci├│n de los futuros l├¡deres, es necesario establecer ciertas estrategias, como aprenderse los nombres de cada estudiante, conocerlos y recordar algunos detalles sobre ellos, como sus actividades favoritas y sus gustos musicales. Esto genera en el estudiante una sensaci├│n de bienestar y sobre todo, le hace sentir que importa. (Universia, 2017).');
/*!40000 ALTER TABLE `opciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preguntas`
--

DROP TABLE IF EXISTS `preguntas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `preguntas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `evaluacion_id` int(10) unsigned NOT NULL,
  `pregunta` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `evaluacion_id` (`evaluacion_id`),
  CONSTRAINT `preguntas_ibfk_1` FOREIGN KEY (`evaluacion_id`) REFERENCES `evaluaciones` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preguntas`
--

LOCK TABLES `preguntas` WRITE;
/*!40000 ALTER TABLE `preguntas` DISABLE KEYS */;
INSERT INTO `preguntas` VALUES (1,1,'┬┐Crees que la autoformaci├│n te hace un mejor docente y con m├ís experiencia?'),(2,1,'En tus clases tratas de impulsar o desarrollar la cooperaci├│n entre alumnos y entre pares'),(3,1,'┬┐Haces preguntas reflexivas a tus estudiantes sobre el tema que acabas de explicar?'),(4,1,'┬┐Alguna vez has sentido que tu pr├íctica educativa se desarrolla en un ambiente de tensi├│n, confrontaci├│n o conflicto?'),(5,1,'┬┐Promueves la capacidad de autoevaluaci├│n en el alumno?'),(6,1,'┬┐Haces cambios en tu modo de ense├▒ar (evaluaciones, actividades de ense├▒anza, recursos did├ícticosÔÇª) en cada periodo escolar?'),(7,2,'┬┐Tomas decisiones y asumes riesgos sobre problemas relacionados con tu actividad diaria? (ejemplos: mala conducta de un alumno o toma de decisiones que afecten al grupo).'),(8,2,'┬┐Consideras importante la relaci├│n intrafamiliar, cultural y social tanto tuya como la de tus alumnos en tu labor educativa?'),(9,2,'┬┐Realizas reuniones con padres de familia para involucrarlos en el aprendizaje de sus hijos?'),(10,2,'┬┐Promueves el sentido de los valores como la responsabilidad, la solidaridad, el sentimiento de justicia, para prevenir discriminaciones o diferencias sociales?'),(11,2,'┬┐Tus ex alumnos te buscan para hacerte consultas de su vida personal?');
/*!40000 ALTER TABLE `preguntas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `respuestas`
--

DROP TABLE IF EXISTS `respuestas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `respuestas` (
  `intento_id` int(10) unsigned NOT NULL,
  `pregunta_id` int(10) unsigned NOT NULL,
  `respuesta` varchar(256) DEFAULT NULL,
  KEY `intento_id` (`intento_id`),
  KEY `pregunta_id` (`pregunta_id`),
  CONSTRAINT `respuestas_ibfk_1` FOREIGN KEY (`intento_id`) REFERENCES `intentos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `respuestas_ibfk_2` FOREIGN KEY (`pregunta_id`) REFERENCES `preguntas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `respuestas`
--

LOCK TABLES `respuestas` WRITE;
/*!40000 ALTER TABLE `respuestas` DISABLE KEYS */;
INSERT INTO `respuestas` VALUES (4,1,'Siempre'),(4,2,'Casi siempre'),(4,3,'Nunca'),(4,4,'Casi nunca'),(4,5,'Siempre'),(4,6,'Nunca'),(5,1,'Siempre'),(5,2,'Casi siempre'),(5,3,'Nunca'),(5,4,'Casi nunca'),(5,5,'Siempre'),(5,6,'Nunca'),(15,7,'Nunca'),(15,8,'Nunca'),(15,9,'Nunca'),(15,10,'Nunca'),(15,11,'Nunca'),(16,7,'Casi siempre'),(16,8,'Nunca'),(16,9,'Siempre'),(16,10,'Nunca'),(16,11,'Casi nunca'),(17,7,'Siempre'),(18,7,'Siempre'),(18,8,'Siempre'),(18,9,'Siempre'),(18,10,'Siempre'),(18,11,'Siempre');
/*!40000 ALTER TABLE `respuestas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rol` varchar(256) NOT NULL,
  `descripcion` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'DOCENTE',NULL),(2,'INVESTIGADOR',NULL),(3,'ADMINISTRADOR',NULL);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test` (
  `id` int(11) DEFAULT NULL,
  `holi` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test`
--

LOCK TABLES `test` WRITE;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
/*!40000 ALTER TABLE `test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rol_id` int(10) unsigned NOT NULL DEFAULT 1,
  `nombres` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellidos` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `matricula` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `centro_trabajo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'UNIVERSIDAD TECNOL├ôGICA DE PUEBLA',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sexo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `edad` int(11) DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_matricula_unique` (`matricula`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_rol_id_foreign` (`rol_id`),
  CONSTRAINT `users_rol_id_foreign` FOREIGN KEY (`rol_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,1,'Ernesto','Perez Garc├¡a','UTP00000001','ernestoperez@test.com','UNIVERSIDAD TECNOL├ôGICA DE PUEBLA','$2y$10$UDZoQK2e5weVVT50XPuXOeS71m2Q.V67n4x3RPssSZ0MUmxPFcUsu',NULL,NULL,NULL),(2,1,'Maria','Zarate Garcia','UTP00000002','mariazarate@test.com','UNIVERSIDAD TECNOL├ôGICA DE PUEBLA','$2y$10$jN0x/nSRTNp5z6i4xk1mQ.2k92TMbLB8owB66b5h2Vc4f.FMu.hIe',NULL,NULL,NULL),(3,1,'Samuel','Garc├¡a L├│pez','Utp123487','samuelgarcia@test.com','UNIVERSIDAD TECNOL├ôGICA DE PUEBLA','$2y$10$ZPaD9TkHoX0TzudiRmWHLOmUf.thNEBs0z93Bk15HQLlOFVaIuvKy',NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-12 11:44:16
