-- MariaDB dump 10.17  Distrib 10.4.11-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: haed
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
  `titulo` varchar(250) COLLATE utf8mb4_spanish_ci NOT NULL,
  `descripcion` varchar(1024) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evaluaciones`
--

LOCK TABLES `evaluaciones` WRITE;
/*!40000 ALTER TABLE `evaluaciones` DISABLE KEYS */;
INSERT INTO `evaluaciones` VALUES (1,'Primera evaluacion de prueba','Esta es una evaluacion para realizar testing'),(2,'Prueba desde API','unknow description'),(3,'Evaluación haed','Primer cuestionario de la plataforma'),(4,'Evaluación reflexiva','Dirigido a que el participante reconozca y analice los hechos de  manera libre mediante una observación científica no estructurada.');
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
-- Table structure for table `feedbacks`
--

DROP TABLE IF EXISTS `feedbacks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feedbacks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `opcion_id` int(10) unsigned NOT NULL,
  `feedback` varchar(2000) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `opcion_id` (`opcion_id`),
  CONSTRAINT `feedbacks_ibfk_1` FOREIGN KEY (`opcion_id`) REFERENCES `opciones` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedbacks`
--

LOCK TABLES `feedbacks` WRITE;
/*!40000 ALTER TABLE `feedbacks` DISABLE KEYS */;
INSERT INTO `feedbacks` VALUES (1,1,'feedback a'),(2,3,'feedback'),(3,9,'Un docente debe actualizarse constantemente en su área de experiencia para transmitir a los alumnos conocimientos actuales y estar al día en los avances de su profesión por lo anterior es necesario tomar conciencia sobre esta  necesidad.'),(4,10,'La capacitación periódica del docente  en su área de especialidad y  el uso de las tecnologías potencia a largo plazo el progreso de los estudiantes, cuyo desarrollo en conocimientos, habilidades y competencias permitirá que se desenvuelvan con éxito en el ámbito profesional.'),(5,11,'El docente tiene conciencia de que el aprendizaje debe darse durante toda la vida, mientras más capacitación tenga, mejores herramientas didácticas ofrecerá a sus alumnos.'),(6,12,'Existe conciencia sobre la necesidad de una actualización constante para su especialización en algún área, lo que hará que el dicente se vuelva experto en un tema concreto.'),(7,17,'Las universidades constantemente cambian los formatos, programas y planeaciones de acuerdo a los avances de la tecnología y requerimientos actuales del campo laboral. Por ello también se hace necesario  conocer nuevos modelos de enseñanza  ya que las generaciones de estudiantes también evolucionan constantemente y las formas en cómo ellos enfrentan los proceso de aprendizaje son diferentes, si se comprenden estas variables se podrá adaptar diversas situaciones de enseñanza para enriquecer las clases.\r\nEs muy importante capacitarse ya que nos permite producir conceptos nuevos, a partir de la actualización de temáticas diferentes,  Identificando problemas,  probando formas de resolverlos usando información de vanguardia y así potenciar la curiosidad, motivación por aprender.'),(8,18,'No todos los docentes fueron formados para dar clases, algunos han adquirido esa experiencia a través de los años, por ello es indispensable capacitarse para adquirir conocimientos, técnicas, metodologías y nuevas habilidades en la práctica docente.\r\nEs necesario  conocer nuevos modelos de enseñanza  ya que las generaciones de estudiantes también evolucionan constantemente y las formas en cómo ellos enfrentan los proceso de aprendizaje son diferentes, si se comprenden estas variables se podrá adaptar diversas situaciones de enseñanza para enriquecer las clases.'),(9,19,'Cuanto más técnicas y metodologías se adquieran para la forma de enseñar, mejor será el trabajo docente y como resultado mejores estudiantes se formarán para la vida.'),(10,20,'Existe conciencia sobre la necesidad de una actualización constante en el aspecto pedagógico. Continuando con el pensamiento reflexivo, la pedagogía en ese sentido nos abre las puertas a un pensamiento más crítico y así concebir formas nuevas de pensar la vida cotidiana, mejores técnicas de enseñanza aprendizaje y una mejora continua en los procesos educativos. \r\nComo dice (Brailovsky, 2018): “Estudiar Pedagogía sirve para tener opiniones fundadas acerca de los problemas de la educación.”'),(11,21,'\"Formar en las nuevas tecnologías, es formar la opinión, el sentido crítico, el pensamiento hipotético y deductivo, las facultades de observación y de investigación, la imaginación, la capacidad de memorizar y clasificar, la lectura y el análisis de textos e imágenes, la representación de las redes, desafíos y estrategias de comunicación”. (Perrenoud,2007)\r\nEs muy importante estar dispuesto a incorporar nuevas tecnologías y herramientas como apoyo para potenciar los procesos educativos. \r\nLas habilidades que  Greg Thompson (2014) propone:\r\n1) Buscar en la web de manera eficiente esto implica aprender a realizar búsquedas efectivas de información en la red.\r\n2) Uso de dispositivos móviles (laptops, teléfonos inteligentes, tabletas) para investigar, usar APPs para enriquecer procesos de aprendizaje. \r\n3) Uso de  redes sociales para compartir, externar dudas o aclararlas, compartir y distribuir información \r\n4) Manejo de procesadores de texto (Word), hojas de cálculo para gestionar los materiales.\r\n5) Hacer presentaciones personalizadas usando herramientas tecnológicas novedosas \r\n6) Uso de correo electrónico el cual además de ser utilizado para gestionar y organizar la información es un medio de comunicación muy eficaz, en este mismo sentido.\r\n7) Uso de herramientas de MS Office permite crear documentos, presentaciones, realizar encuestas y/o evaluaciones usando los formularios, hacer estadísticas.\r\n8) Usar dispositivos de almacenamiento como Dropbox, Google Drive, Skydrive o Pearltree lo cual permite disponer la información en cualquier momento y desde cualquier dispositivo.\r\n9)  Crear videos educativos para compartirse a través de Youtube y crear blogs para compartir intercambiar ideas, documentar actividades que enriquezcan el proceso educativo.'),(12,22,'Walter(2014) señala que la profesionalización docente logra que los académicos inserten los contenidos de forma ordenada, organizada y articulada; lo anterior, permite que las estrategias de enseñanza favorezcan el aprendizaje y permitan gestionar el conocimiento a través del uso de esquemas, tales como mapas mentales, mapas conceptuales, analogías, uso de wikis, imágenes, esquemas, presentaciones electrónicas, entre otros, para facilitar e impactar el aprendizaje, otorgando a los alumnos materiales con contenido significativo para permitir al proceso de la información darse de forma sustantiva.\r\nLas habilidades que  Greg Thompson (2014) propone:\r\n\r\n1) Buscar en la web de manera eficiente esto implica aprender a realizar búsquedas efectivas de información en la red.\r\n2) Uso de dispositivos móviles (laptops, teléfonos inteligentes, tabletas) para investigar, usar APPs para enriquecer procesos de aprendizaje. \r\n3) Uso de  redes sociales para compartir, externar dudas o aclararlas, compartir y distribuir información \r\n4) Manejo de procesadores de texto (Word), hojas de cálculo para gestionar los materiales.\r\n5) Hacer presentaciones personalizadas usando herramientas tecnológicas novedosas \r\n6) Uso de correo electrónico el cual además de ser utilizado para gestionar y organizar la información es un medio de comunicación muy eficaz, en este mismo sentido.\r\n7) Uso de herramientas de MS Office permite crear documentos, presentaciones, realizar encuestas y/o evaluaciones usando los formularios, hacer estadísticas.\r\n8) Usar dispositivos de almacenamiento como Dropbox, Google Drive, Skydrive o Pearltree lo cual permite disponer la información en cualquier momento y desde cualquier dispositivo.\r\n9)  Crear videos educativos para compartirse a través de Youtube y crear blogs para compartir intercambiar ideas, documentar actividades que enriquezcan el proceso educativo.'),(13,23,'López (2017) nos dice: “Con la incorporación de las Tecnologías de la Información y Comunicación (TIC) el estudiante se ha enfrentado a un nuevo esquema para aprender, y el profesor a uno nuevo para enseñar. La actitud, esto es, la predisposición aprendida para dar respuesta de manera consistente favorable o desfavorable hacia el uso de computadoras, correo electrónico, teléfonos móviles, tabletas, páginas web y el uso del internet se han convertido en un tema fundamental en el ámbito educativo”.\r\nSi los docentes se involucran más en el uso de estas herramientas, podrán proporcionar estrategias de aprendizaje en actividades presenciales, virtuales o mixtas. La UTP a través de su nodo SINED ofrece cursos para desarrollar habilidades tecnológicas en el docente.'),(14,20,'López (2017): La incorporación gradual y transversal de las Tecnologías de la Información y Comunicación (TIC) es fundamental mediante el uso de recursos que vayan más allá de la explicación didáctica unilateral docente/alumno, para pasar a la incorporación de una serie de apoyos que permitan el intercambio, la comunicación y la interacción entre todos los miembros del acto educativo”\r\nEn este caso la toma de consciencia de este aspecto es evidente.\r\nLa UTP a través de su nodo SINED ofrece cursos para desarrollar habilidades tecnológicas en el docente.'),(15,25,'Existen diferentes circunstancias por las cuales los alumnos bostezan, la mayoría de las veces se debe a que algunos estudiantes universitarios trabajan antes de asistir a clases por lo que les es complicado poner atención por mucho tiempo, para ello puedes establecer actividades que provoquen su intervención, generar dinámicas de ejercicios físicos si los contenidos temáticos son muy teóricos, con esto oxigenan el cerebro y estarán más atentos en clase.'),(16,26,'También se debe tomar en cuenta el tipo de aprendizaje de los alumnos, algunos son kinestésicos por lo que necesitan dibujar o hacer movimientos para lograr la concentración pero no por ello dejan de prestar atención.'),(17,27,'También se debe tomar en cuenta el tipo de aprendizaje de los alumnos, algunos son kinestésicos por lo que necesitan dibujar o hacer movimientos para lograr la concentración pero no por ello dejan de prestar atención.'),(18,28,'También se debe tomar en cuenta el tipo de aprendizaje de los alumnos, algunos son kinestésicos por lo que necesitan dibujar o hacer movimientos para lograr la concentración pero no por ello dejan de prestar atención.'),(19,29,'Es necesario identificar si los estudiantes están hablando en clase por distracción o porque hacen preguntas entre ellos con respecto al tema que se explica porque de eso dependerá la técnica a seguir.'),(20,30,'Es importante observar a nuestro interlocutor para poder darnos una idea de la atención y el entendimiento que pudieran tener hacia nosotros. ');
/*!40000 ALTER TABLE `feedbacks` ENABLE KEYS */;
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
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pregunta_id` int(10) unsigned NOT NULL,
  `descripcion` varchar(500) COLLATE utf8mb4_spanish_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pregunta_id` (`pregunta_id`),
  CONSTRAINT `opciones_ibfk_1` FOREIGN KEY (`pregunta_id`) REFERENCES `preguntas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opciones`
--

LOCK TABLES `opciones` WRITE;
/*!40000 ALTER TABLE `opciones` DISABLE KEYS */;
INSERT INTO `opciones` VALUES (1,1,'opcion a'),(2,1,'opcion b'),(3,2,'opcion a'),(4,2,'opcion b'),(5,3,'opcion a'),(6,3,'opcion b'),(7,4,'opcion a'),(8,4,'opcion b'),(9,5,'Generalmente no tomo cursos'),(10,5,'Una vez al año'),(11,5,'Dos veces al año'),(12,5,'Tres o mas veces al año'),(17,6,'Generalmente no tomo cursos'),(18,6,'Una vez al año'),(19,6,'Dos veces al año'),(20,6,'Tres o mas veces al año'),(21,7,'7 Generalmente no tomo cursos'),(22,7,'7 Una vez al año'),(23,7,'7 Dos veces al año'),(24,7,'7 Tres o mas veces al año'),(25,8,'Bostezan'),(26,8,'Te miran fijamente'),(27,8,'Chatean'),(28,8,'Dibujan'),(29,8,'Cuchichean'),(30,8,'No me doy cuenta');
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
  `pregunta` varchar(500) COLLATE utf8mb4_spanish_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `evaluacion_id` (`evaluacion_id`),
  CONSTRAINT `preguntas_ibfk_1` FOREIGN KEY (`evaluacion_id`) REFERENCES `evaluaciones` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preguntas`
--

LOCK TABLES `preguntas` WRITE;
/*!40000 ALTER TABLE `preguntas` DISABLE KEYS */;
INSERT INTO `preguntas` VALUES (1,1,'Pregunta 1'),(2,1,'Pregunta 2'),(3,1,'Pregunta 3'),(4,1,'Pregunta 4'),(5,4,'¿Qué tan a menudo tomas cursos para seguirte capacitando en tu área de experiencia?'),(6,4,'¿Qué tan a menudo tomas cursos para seguirte capacitando en habilidades pedagógicas?'),(7,4,'¿Qué tan a menudo tomas cursos para seguirte capacitando en habilidades de tecnologías de la información?'),(8,4,'Si observas a tus alumnos ¿qué suelen hacer durante tu clase?');
/*!40000 ALTER TABLE `preguntas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `nombres` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellidos` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `matricula` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `centro_trabajo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'UNIVERSIDAD TECNOLÓGICA DE PUEBLA',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `administrador` tinyint(1) NOT NULL DEFAULT 0,
  `sexo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `edad` int(11) DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_matricula_unique` (`matricula`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'nombre test','apellidos test','matricula-test','email@test.com','UNIVERSIDAD TECNOLÓGICA DE PUEBLA','123456',0,NULL,NULL,NULL),(4,'nombre test','apellidos test','matricula-test-2','email-2@test.com','UNIVERSIDAD TECNOLÓGICA DE PUEBLA','$2y$10$zxOcdoyYLvF2tfQZJI0F8eiibTcqmxG14F/.rH4wWy9AImuIOrwDm',0,NULL,NULL,NULL),(5,'Daniel','Reyes Epitacio','Utp015426','email1@test.com','UNIVERSIDAD TECNOLÓGICA DE PUEBLA','$2y$10$7E8hsgXHqbFB2Ob1bA32reA1YTvmpRJcBHkZdzvOR9hlCne4MS0.6',0,NULL,NULL,NULL);
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

-- Dump completed on 2023-05-30 15:01:59
