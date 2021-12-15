-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: medicinas
-- ------------------------------------------------------
-- Server version	8.0.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ROL` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'medico'),(2,'sanitario'),(3,'paciente');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_registro`
--

DROP TABLE IF EXISTS `tb_registro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_registro` (
  `id` int NOT NULL AUTO_INCREMENT,
  `usuario` varchar(20) DEFAULT NULL,
  `clave` char(16) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellidos` varchar(45) NOT NULL,
  `ROLES_ID` int NOT NULL,
  PRIMARY KEY (`id`,`ROLES_ID`),
  UNIQUE KEY `usuario_UNIQUE` (`usuario`),
  KEY `fk_tb_registro_ROLES1_idx` (`ROLES_ID`),
  CONSTRAINT `fk_tb_registro_ROLES1` FOREIGN KEY (`ROLES_ID`) REFERENCES `roles` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_registro`
--

LOCK TABLES `tb_registro` WRITE;
/*!40000 ALTER TABLE `tb_registro` DISABLE KEYS */;
INSERT INTO `tb_registro` VALUES (1,'javierSanitario','1234','Javier','Sanitario',2),(2,'javierMedico','1234','Javier','Medico',1),(3,'javierPaciente','1234','Javier','Paciente',3),(4,'JavierPaciente1','1234','Javier1','Paciente',3);
/*!40000 ALTER TABLE `tb_registro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipos_medicinas`
--

DROP TABLE IF EXISTS `tipos_medicinas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipos_medicinas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `TIPO_MEDICAMENTO` varchar(45) NOT NULL,
  `NOMBRE_MEDICAMENTO` varchar(45) NOT NULL,
  `GENERALIDADES` varchar(500) NOT NULL,
  `INDICACIONES` varchar(500) NOT NULL,
  `CUIDADOS` varchar(500) NOT NULL,
  `RAM` varchar(500) NOT NULL,
  `LINK_FICHA_TECNICA` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nombre` (`NOMBRE_MEDICAMENTO`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos_medicinas`
--

LOCK TABLES `tipos_medicinas` WRITE;
/*!40000 ALTER TABLE `tipos_medicinas` DISABLE KEYS */;
INSERT INTO `tipos_medicinas` VALUES (33,'AMINAS','ADRENALINA / EPINEFRINA','Presentación 1mg/ml ; Administración IV, IM, SC','PCR, Shock anafiláctica, Shock Cardiogénico','Vigilancia estrecha de FC, TA y FR, IM evitar administración en nalgas por riesgo de gangrena gaseosa, Vida media 2-3 min','Dificultad respiratoria, Sudoración, naúseas, vómitos, temblores y mareos','https://cima.aemps.es/cima/dochtml/ft/68552/FT_68552.html'),(34,'AMINAS','NORADRENALINA / NOREPINEFRINA','Presentación 10mg/ml ; Administración IV ; Dosis inicial 8-12 mcg/min','Hipertensión aguda, Coadyuvante temporal en PCR e hipotensión aguda','Vigilancia de TA, vía de perfusión y puntos distales, Dejar permeable y libre la luz de la vía al retirar la perfusión continua, Comprobar la volemia del paciente, Vida media de 20 seg','Necrosis, Bradicardia y palpitaciones, Disminución de gasto cardiaco en uso prolongado','https://cima.aemps.es/cima/dochtml/ft/68552/FT_68552.html'),(35,'AMINAS','NORADRENALINA / NOREPINEFRINA','Presentación 10mg/ml ; Administración IV ; Dosis inicial 8-12 mcg/min','Hipertensión aguda, Coadyuvante temporal en PCR e hipotensión aguda','Vigilancia de TA, vía de perfusión y puntos distales, Dejar permeable y libre la luz de la vía al retirar la perfusión continua, Comprobar la volemia del paciente, Vida media de 20 seg','Necrosis, Bradicardia y palpitaciones, Disminución de gasto cardiaco en uso prolongado','https://cima.aemps.es/cima/dochtml/ft/62002/FT_62002.html'),(36,'AMINAS','EFEDRINA','Presentación 50mg/10ml ; Administración IV ; Dosis 10-25mg cada 5 min, sin exceder de 150mg','HTA en anestesia general y loco-regional, hTA por depresión miocárdica','Vigilancia ECG + TA, Uso limitado a bolos, Efectos permanecen unos 60 min desde su administración, Riesgo de dependencia','Nerviosismo, delirio, inquietud, fatiga, palpitaciones, taquicardia, dolor de pecho, convulsiones','https://cima.aemps.es/cima/pdfs/es/ft/70338/70338_ft.pdf'),(37,'AMINAS','EFEDRINA','Presentación 50mg/10ml ; Administración IV ; Dosis 10-25mg cada 5 min, sin exceder de 150mg','HTA en anestesia general y loco-regional, hTA por depresión miocárdica','Vigilancia ECG + TA, Uso limitado a bolos, Efectos permanecen unos 60 min desde su administración, Riesgo de dependencia','Nerviosismo, delirio, inquietud, fatiga, palpitaciones, taquicardia, dolor de pecho, convulsiones','https://cima.aemps.es/cima/pdfs/es/ft/70338/70338_ft.pdf'),(38,'AMINAS','EFEDRINA','Presentación 50mg/10ml ; Administración IV ; Dosis 10-25mg cada 5 min, sin exceder de 150mg','HTA en anestesia general y loco-regional, hTA por depresión miocárdica','Vigilancia ECG + TA, Uso limitado a bolos, Efectos permanecen unos 60 min desde su administración, Riesgo de dependencia','Nerviosismo, delirio, inquietud, fatiga, palpitaciones, taquicardia, dolor de pecho, convulsiones','https://cima.aemps.es/cima/pdfs/es/ft/70338/70338_ft.pdf'),(39,'AMINAS','FENILEFRINA','Presentación 50mcg/ml ; Administración IV ; Dosis 25-50 mg/min sin exceder de 100mg','HTA durante anestesia espinal, epidural o general','Cuidado en pacientes con HTA, cardiopatías o braquicardias, Los efectos permanecen unos 20 minutos','Bradicardia, arritmias, dolor de cabeza, nerviosismo, hemorragia cerebral, náuseas y midriasis','https://cima.aemps.es/cima/pdfs/es/ft/80352/FT_80352.pdf'),(40,'AMINAS','DOBUTAMINA','Presentación 250mg/20ml ; Administración IV','Estados de hipoperfusión con GC insuficiente para satisfacer demandas, Aumento anormal de presiones de llenado ventricular con riesgo de congestión y edema pulmonar','Se administra sólo en PC, Cuidado con anafilaxia por contener sulfitos, Vigilancia de TAM debido a posibles bajadas de TA, A partir de las 72h puede precisar dosis altas, Semivida de 2 min','Dolor anginoso, HTA, hipocalemia, flebitis, náuseas, cefaleas','https://cima.aemps.es/cima/pdfs/es/ft/61952/FT_61952.pdf'),(41,'AMINAS','DOPAMINA','Presentación 200mg/5ml ; Administración IV','Corrección desequilibrios hemodinámicos en el Shock, traumatismos, septicemias endotóxicas','Corregir hipovolemia con sangre previa a la administración, Control continuo de la volemia, contractilidad miocárdica y perfusión periférica, Incompatibilidad con insulina y NPT','Náuseas, vómitos, cefaleas, gangrena tras administraciones prolongadas, necrosis del tejido circundante y anafilaxia','https://cima.aemps.es/cima/pdfs/es/ft/63331/FT_63331.pdf'),(42,'AMINAS','ISOPRENALINA / ALEUDRINA','Presentación 0.2mg/ml ; Administración IV','Síndrome de Morgagni-Stokes-Adams, bradicardia y bloqueos cardiacos, Situaciones con GC insuficiente','Aumenta la eliminación de la teoflina y puede potenciar la hipocalemia, hiperglucemia y taquicardia, Riesgo de anafilaxia por contenido de sulfitos y semivida de 5 min','Taquicardia, arritmias, hTA, temblores, ectopias ventriculares, cefalea, sofocos','http://cima.aemps.es/cima/pdfs/es/ft/47131/47131_ft.pdf'),(43,'ANTIARRÍTMICOS','AMIODARONA / TRANGOREX','Presentación 150mg/3ml ; Administración IV','RCP, Taquiarritmias asociadas al síndrome de Wolf-parkinson-White, Prevención de la recidiva de la FA y Flutter, Taquiarritmias de naturaleza paroxística','Muy importante monitorizar la función cardiaca y TA, Precaución en casos de hTA e insuficiencia respiratoria severa, Cuidado con su uso en pacientes con VMI y cifras de FiO2 elevadas','Neutropenia, agranulocitis, bradicardia, elevación de las transaminasas, cefalea, HTA e hTA','https://cima.aemps.es/cima/pdfs/es/ft/54723/54723_ft.pdf'),(44,'ANTIARRÍTMICOS','ADENOSINA','Presentación 6mg/2ml ; Administración IV','Taquicardia paroxística sintomática que requiere tratamiento','Se debe administrar en bolo, de manera rápida y con monitorización cardíaca, Debe ser interrumpida inmediatamente si se observa la aparición de angina de pecho o insuficiencia respiratoria, Vida media de 10 segundos','Bradicardia, asistolia, pausa sinusal, visión borrosa, mareo, cefalea, disnea, sabor metálico, presión en el pecho','https://cima.aemps.es/cima/pdfs/es/ft/81546/81546_ft.pdf'),(45,'RELAJANTES NEUROMUSCULARES','CISATRACURIO / NIMBEX','Presentación 2mg/ml ; Administración IV','Relajación neuromuscular durante procedimientos Qx y en UCI, Coadyuvante de anestesia general o sedación para facilitar la IOT y VMI','Se debe controlar la función NMs durante el tratamiento para adecuar la dosis y monitorizar la actividad cerebral, No se puede mezclar con Propofol y se debe tener a mano material para IOT, mantenimiento de ventilación y oxigenación adecuada','Bradicardia, hTA, rubor cutáneo, erupción. broncoespasmo, anafilaxia y miopatías','https://cima.aemps.es/cima/pdfs/es/ft/76000/FT_76000.pdf'),(46,'RELAJANTES NEUROMUSCULARES','ROCURONIO / ESMERÓN','Presentación 10mg/ml ; Administración IV','Coadyuvante en anestesia general para IOT y uso a corto plazo en UCI para IOT','Antes de extubar al paciente se debe asegurar que el efecto del fármaco ha sido eliminado totalmente, Su efecto puede disminuir con Neostigmina, fenitoína o carbamazepina','Anafilaxia, parálisis flácida, taquicardia, colapso circulatorio, shock, apnea, broncoespasmo, fallo respiratorio','https://cima.aemps.es/cima/pdfs/es/ft/61141/61141_ft.pdf'),(47,'RELAJANTES NEUROMUSCULARES','ANECTINE','Presentación 50mg/ml ; Administración IV','Se usa para IOT y para reducir la intensidad de las contracciones musculares inducidas por medios farmacológicos o eléctricos','Se debe monitorizar el BIS durante el tratamiento, Cuidado en pacientes sépticos por agravamiento','Dolores tras su utilización, aumento de la presión intraocular, bradicardia, taquicardia, arritmia y broncoespasmos','https://cima.aemps.es/cima/dochtml/p/33815/P_33815.html'),(48,'ANESTESIA','PROPOFOL','Presentación 10mg/ml ; Administración IV','Anestesia general, Sedación en procedimientos Qx sólo o combinado con anestesia local y Sedación en VMI en UCI','Requiere monitorización respiratoria y hemodinámica, Se puede administrar en un periodo máximo de 7 días, Tiene riesgo de convulsiones en pacientes epilépticos, Necesario cambio de sistema de medicación cada 12 horas','Shock anafiláctico, broncoespasmo, acidosis metabólica, hipercalemia, hiperlipidemia, convulsiones, arritmias y epilepsia','https://cima.aemps.es/cima/pdfs/es/ft/62134/62134_ft.pdf'),(49,'ANESTESIA','MIDAZOLAM','Presentación 1mg/ml ; Administración IV','Sedación consciente y en UCI, Anestesia','Vigilar nivel de sedación y tolerancia hemodinámica','Broncoespasmo, shock anafiláctico, hTA, bradicardia, depresión respiratoria, apnea','https://cima.aemps.es/cima/dochtml/ft/72016/FT_72016.html'),(50,'ANESTESIA','KETAMINA','Presentación 50mg/ml ; Administración IV, IM','Intervenciones diagnósticas y Qx que no requieran relajación muscular, Intervenciones cortas y Coadyuvante de otros agentes anestésicos','Durante la anestesia puede haber movimientos involuntarios tónico-clónicos en las extremidades, Tras el efecto pueden aparecer manifestaciones psicológicas (sueño, alucinaciones...), Administración lenta','Anafilaxia, HTA, Taquicardia, alucinaciones, nistagmus, hipertonía, aumento de presión intraocultar, apnea y depresión respiratoria','https://cima.aemps.es/cima/pdfs/es/ft/47034/FT_47034.pdf'),(51,'ANESTESIA','ETOMIDATO','Presentación 2mg/ml ; Administración IV','Anestesia general en operaciones y procedimientos','No utiliza en PC por disminución de Cortisol tras administraciones, Puede ocasionar una insuficiencia suprarrenal transitoria y disminución de cortisol, Utilizar con precaución en pacientes críticos por un aumento del riesgo de mortalidad','Arritmias, hTA, shock anafiláctico, apnea,laringoespasmo, hiperventilación','https://cima.aemps.es/cima/dochtml/ft/72016/FT_72016.html'),(52,'ANALGÉSICOS','REMIFENTANILO','Presentación 5mg/ml ; Administración IV','Anestesia general en operaciones y procedimientos','Antes de su retirada se debe administrar otra analgesia para evitar cambios hemodinámicos tras su retirada, Se debe diluir hasta obtener concentraciones de entre 50 y 250 mcg/ml, Tras su retirada el efecto dura unos 10 minutos, No mezclar nunca con Propofol','Bradicardia, hTA, depresión respiratoria, apnea, dependencia y dolor de rebote','https://cima.aemps.es/cima/dochtml/ft/76233/FT_76233.html'),(53,'ANALGÉSICOS','FENTANILO','Presentación 0.05mg/ml ; Administración IV','Anestesia general y local, administrado con fármaco neuroléptico o premedicación analgésica, Anestésico con oxígeno en intervenciones','La analgesia profunda va acompañada de una marcada depresión respiratoria que puede persistir o reaparecer en el postoperatorio, No usar nunca con Epinefrina ya que provoca hTA','Movimientos mioclónicos no epilépticos, cefalea, mareos, náuseas, vómitos, dificultad respiratoria, síndrome de abstinencia','https://cima.aemps.es/cima/dochtml/p/41764/Prospecto_41764.html'),(54,'IONES','SULFATO DE MAGNESIO','Presentación 1.5g/10ml ; Administración IV','Torsade de Pointes, Aporte de magnesio durante el reequilibrio electrolítico, Eclampsia','Su administración puede afecar a la transmisión neuromuscular y exacerbar la debilidad que acompaña a la miastenia gravis, Pacientes con deficiencias leves y moderadas de magnesio, No administrar junto a Hidrocortisona, tetraciclina ni tobramicina','PCR o colapso circulatorio, hTA, bradicardia, rubor, náuseas, vómitos, debilidad muscular, cefalea, mareos, somnolencia, confusión, estado comatoso','https://cima.aemps.es/cima/pdfs/es/ft/78350/78350_ft.pdf'),(55,'IONES','GLUCONATO CÁLCICO','Presentación 940g/10ml ; Administración IV, IM','Tratamiento de hipocalcemia aguda','Velocidad lenta de administración inferior a 2ml/min, En IM sólo en glúteos y profundo debido a riesgo de irritación local, Tener cuidado con pacientes en tratamiento con Ceftriaxona, ya que traen reacciones fatales con precipitados de calcio en los pulmones, Evitar dosis altas de vitamina D ','Bradicardia, arritmia, hTA, vasodilatación, colapso circulatorio, náuseas, vómitos, sensación de calor. sudoración','https://cima.aemps.es/cima/pdfs/es/ft/69465/FT_69465.pdf'),(56,'IONES','CLORURO DE CALCIO','Presentación 100g/ml ; Administración IV','Tratamiento de hipocalcemia cuando se requiera un aumento rápido de la concentración de calcio en el suero, Como coadyuvante en reanimación cardiaca','Inyectar despacio con aguja pequeña en gran vaso para reducir al mínimo la irritación venosa, Muy importante evitar altas concentraciones de calcio en corazón ya que pueden causar síncope cardiaco, Puede ser adecuado el uso de calor local','Mareos, somnolencia, arritmias, rubor, sensación de calor, náuseas, vómitos','https://cima.aemps.es/cima/pdfs/es/ft/49072/FT_49072.pdf'),(57,'IONES','CLORURO POTÁSICO','Presentación 1g/ml ; Administración IV','Hipopotasemia, en particular si hay alcalosis hipoclorémica','No administrar en SG5 ya que disminuye la concentración sérica de potasio, Cuidado en su administración a pacientes diuréticos ahorradores de potasio','Acidosis, hipercloremia, arritmia cardiaca y náuseas','https://cima.aemps.es/cima/pdfs/es/ft/60353/60353_ft.pdf'),(58,'IONES','CLORURO POTÁSICO','Presentación 1g/ml ; Administración IV','Hipopotasemia, en particular si hay alcalosis hipoclorémica','No administrar en SG5 ya que disminuye la concentración sérica de potasio, Cuidado en su administración a pacientes diuréticos ahorradores de potasio','Acidosis, hipercloremia, arritmia cardiaca y náuseas','https://cima.aemps.es/cima/pdfs/es/ft/60353/60353_ft.pdf'),(59,'BETABLOQUEANTES','ESMOLOL','Presentación 10mg/ml ; Administración IV','Taquicardia sinusal no compensada, Taquicardia e HTA durante la anestesia','Monitorización continua de TA y ECG. Se debe retirar de forma progresiva para evitar taquicardia e HTA de rebote','HTA y taquicardia de rebote tras retirada, hTA, bradicardia, paro cardiaco','https://cima.aemps.es/cima/pdfs/es/ft/72349/FichaTecnica_72349.html.pdf'),(60,'ANTIHIPERTENSIVOS','CLEVIDIPINO','Presentación 0.5mg/ml ; Administración IV','Reducción rápida de la TA en entorno perioperatorio','Cambio de sistema cada 12 horas por su alto contenido en líquido, Monitorizar TA y FC, retirada acorde a la introducción de antihipertensivo oral','Edema, dolor torácico, hTA, taquicardia refleja','https://cima.aemps.es/cima/pdfs/es/ft/76595/76595_ft.pdf'),(61,'ANTIHIPERTENSIVOS','URADIPILO','Presentación 5mg/ml ; Administración IV','Crisis de hipertensión arterial, Protección perioperatoria contra incrementos tensionales en el curso de la anestesia','Puede interaccionar a dosis altas con barbitúricos prolongando su efecto','Palpitaciones, bradicardia, taquicardia, náuseas, cefalea, vértigos','https://cima.aemps.es/cima/pdfs/es/ft/76741/76741_ft.pdf'),(62,'ANTIHIPERTENSIVOS','HIDRALAZINA','Presentación 20mg/ampolla ; Administración IV, IM','HTA esencial severa, Eclampsia, preeclampsia','Monitorizar TA en todo momento, Dosis de 10 a 40 mg','Cefalea, náuseas, vómitos, diarrea, taquicardia','https://cima.aemps.es/cima/pdfs/es/ft/56236/56236_ft.pdf'),(63,'ANTIHIPERTENSIVOS','SOLINITRINA','Presentación 1mg/ml ; Administración IV','Insuficiencia ventricular congestiva, Cirugía cardíaca, Angina de pecho','Preparar siempre en SG5%, Retirar siempre de forma progresiva','Taquicardia, hTA, ruborización, náuseas, cefalea transitoria','https://cima.aemps.es/cima/pdfs/es/ft/57127/57127_ft.pdf'),(64,'ANTIHIPERTENSIVOS','NITROPRUSIATO','Presentación 50mg ; Administración IV, SL','Crisis HTA refractaria a otros tratamientos, hTA controlada durante la anestesia para reducir sangrado en Qx','Interrumpirla de forma progresiva, Monitorizar en todo momento la TA, Siempre en SG5%','Palpitaciones, hTA, bradicardia, nerviosismo, agitación, desorientación, cefalea, náuseas, dolor abdominal','https://cima.aemps.es/cima/pdfs/es/ft/54575/FT_54575.pdf ');
/*!40000 ALTER TABLE `tipos_medicinas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipos_medicinas_tb_registro`
--

DROP TABLE IF EXISTS `tipos_medicinas_tb_registro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipos_medicinas_tb_registro` (
  `tipos_medicinas_id` int NOT NULL,
  `tb_registro_id` int NOT NULL,
  `datos` longtext,
  PRIMARY KEY (`tipos_medicinas_id`,`tb_registro_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos_medicinas_tb_registro`
--

LOCK TABLES `tipos_medicinas_tb_registro` WRITE;
/*!40000 ALTER TABLE `tipos_medicinas_tb_registro` DISABLE KEYS */;
INSERT INTO `tipos_medicinas_tb_registro` VALUES (3,60,'CLEVIDIPINO: prueba CLEVIDIPINO'),(33,3,'prueba de receta'),(40,3,'otra prueba'),(56,3,'CLORURO DE CALCIO: cloruro de calcio prueba');
/*!40000 ALTER TABLE `tipos_medicinas_tb_registro` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-11 19:52:00
