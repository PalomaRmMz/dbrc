<?php
  require '../../fpdf/fpdf.php';
	require_once '../../../controladores/conndb.php';

  date_default_timezone_set('America/Mexico_city');

  // $clave_elector = $_POST["clave_elector"];
 //$clave_elector = 'ABCD123';
  $clave_elector = $_GET["name"];
  $candidatura = $_GET["candidatura"];

  $query = "";
  $fila = [];

  
  if($candidatura == 6){

    $query = "SELECT
    candidatura_sindicatura.nombre,
    candidatura_sindicatura.apellido_paterno,
    candidatura_sindicatura.apellido_materno,
    tipo_eleccion.nombre as candidatura,
    partidos_politicos.nombre_partido as partido_politico,
    candidatura_sindicatura.fec_nacimiento,
    candidatura_sindicatura.genero,
    candidatura_sindicatura.clave_elector,
    candidatura_sindicatura.propietario_suplente,
    candidatura_sindicatura.curp,
    candidatura_sindicatura.tiempo_residencia,
    candidatura_sindicatura.sobrenombre,
    candidatura_sindicatura.user_capturista
    FROM candidatura_sindicatura, tipo_eleccion, partidos_politicos
    WHERE clave_elector = '$clave_elector' AND candidatura = $candidatura
    AND candidatura_sindicatura.candidatura = tipo_eleccion.id_eleccion
    AND candidatura_sindicatura.partido_politico = partidos_politicos.id_partido";

$stmt = $DB_con->prepare($query);
$stmt->execute();
$res = $stmt->get_result();

if($res->num_rows < 1 ) {

  $fila = array("datos" => 1);

} else if ($res->num_rows == 1) {

  $candidatos = $res->fetch_assoc();
  $fila = array(
    "nombre" => $candidatos["nombre"],
    "apellido_paterno" => $candidatos["apellido_paterno"],
    "apellido_materno" => $candidatos["apellido_materno"],
    "candidatura" => $candidatos["candidatura"],
    "partido_politico" => $candidatos["partido_politico"],      
    "fec_nacimiento" => $candidatos["fec_nacimiento"],
    "genero" => $candidatos["genero"],
    "clave_elector" => $candidatos["clave_elector"],
    "curp" => $candidatos["curp"],
    "propietario_suplente" => $candidatos["propietario_suplente"],
    "tiempo_residencia" => $candidatos["tiempo_residencia"],
    "sobrenombre" => $candidatos["sobrenombre"],
    "user_capturista" => $candidatos["user_capturista"],
    "datos" => 2
  );

  $clave_electores = $_GET["name"];

  $stmtdoc = $DB_con->prepare("SELECT * FROM candidatura_documentado WHERE clave_elector = '".$clave_electores."' AND id_tipo_registro =  '".$candidatura."' ");
  $stmtdoc->execute();
  $res = $stmtdoc->get_result();
  $candidatodocs = $res -> fetch_assoc();

  $documentos = array(

  "CARTA3D3" => $candidatodocs["carta_3_3"],
  "CARTA_REELECCION" => $candidatodocs["carta_reeleccion"],
  "CONS_AUTORIZACION" => $candidatodocs["const_autorizacion_organo"],
  "MANIFES_AUTOADCRIPCION" => $candidatodocs["manifes_autoadcripcion"],
  "CONST_VINCULO_COMUNI" => $candidatodocs["constancia_vinculo_comuni"],

  "SNR" => $candidatodocs["doc_snr_ine"],
  "ACT" => $candidatodocs["act_de_nacimiento"],
  "SNR" => $candidatodocs["doc_snr_ine"],
  "COPIA" => $candidatodocs["copia_act_de_nacimiento"],
  "SEPARACION" => $candidatodocs["const_separacion_cargo"],
  "ESCRITO" => $candidatodocs["escrito_bajo"],
  "NP" => $candidatodocs["const_act_no_penales"],
  "REG" => $candidatodocs["solicitud_registro"],
  "CRED" => $candidatodocs["cred_para_votar"],
  "ACEPTACION" => $candidatodocs["const_acept_postulacion"],
  "RESIDENCIA" => $candidatodocs["const_residencia"],
  "MANIFIESTO" => $candidatodocs["manifiesto"],
  "CAPACIDAD" => $candidatodocs["capacidad_economica"],
  "RFC" => $candidatodocs["cedula_rfc"],
  );

  $stmtUsus = $DB_con->prepare("SELECT SUBSTRING_INDEX( distrito, '-', 1 ) AS NumDistrito, distrito.nombre AS NombreDistrito FROM candidatura_diputado, distrito
                                WHERE clave_elector = '$clave_elector' AND distrito.id_distrito = candidatura_diputado.distrito");
  $stmtUsus->execute();
  $res = $stmtUsus->get_result();
  $candidatosUsus = $res -> fetch_assoc();

  $filass = array(
      "NumDistrito" => $candidatosUsus["NumDistrito"],
      "NombreDistrito" => $candidatosUsus["NombreDistrito"],
      "datos" => 2
  );

  // $has = "'.date('d-m-Y').'""'.date('d-m-Y').'"

  $tipoDoc = "coppM";

  $has = md5(date("H:i:s"));
  $datos = array(
    $tipoDoc,
    $candidatos["user_capturista"],
    " ",
    " ",
    " ",
    date('Y-m-d'),
    date('H:i:s'),
    $has,
    $clave_elector,
    $candidatura
  );
  
  $query = "SELECT  folioDoc, has  FROM registro WHERE registro.clave_original = '$clave_elector' AND registro.tipo_doc = '$tipoDoc'; ";
  $stmt = $DB_con->prepare($query);
  $stmt->execute();
  $folio = $stmt->get_result();
  $folioR = $folio->fetch_assoc();

  // echo $query;

  if($folio->num_rows == 1){
    // echo 'dentro';
    $datos = $stmt->get_result();      
    $aaa = array(
      "id" => $folioR["folioDoc"],
      "has" => $folioR['has'],
      "datos" => 2
    );
    $fila['has'] = $aaa['has'];
  } else {
    // echo 'generar';
    $query = verProcedimiento("CALL generarFolio( ", $datos );
    $st = $DB_con->prepare($query);      
    $st->execute();
    $st = null;

    $query = "SELECT  folioDoc, has  FROM registro WHERE registro.clave_original = '$clave_elector' AND registro.tipo_doc = '$tipoDoc'; ";
    $stmt = $DB_con->prepare($query);
    $stmt->execute();
    $folio = $stmt->get_result();
    $folioR = $folio->fetch_assoc();

    $hola = $res -> fetch_assoc();
    $aaa = array(
      "id" => $folioR["folioDoc"],
      "has" => $folioR['has'],
      "datos" => 2
    );
    $fila['has'] = $aaa['has'];
  }

  class PDF extends FPDF {

    //Pie de página
    function Footer() {
      // Ex-Fábrica San Manuel S/N, Col. Barrio Nuevo C.P.90640, San Miguel Contla, Santa Cruz Tlaxcala. 01 (246) 4650340
      $this->SetY(-20);
      $this->SetFont('Arial','I',8);
      // $this->MultiCell(180,6, utf8_decode('',0,0,'C'));
      $this->MultiCell(180,6, utf8_decode('Ex-Fábrica San Manuel S/N, Col. Barrio Nuevo C.P.90640, San Miguel Contla, Santa Cruz Tlaxcala. 01 (246) 4650340'),0,'C', 0 );
    }
 }


$pdf = new PDF();
$pdf->AddPage();

$pdf->SetFont('Arial','B',11);
$pdf-> Cell(100,80, ''.utf8_decode($fila['partido_politico']).'');

$pdf->Image('../../../assets/img/logoite.png',130,10,-300);
$pdf->Ln(5);
$pdf->SetFont('Arial','B',10);
$pdf->Text(11,42,utf8_decode('FOLIO ' .utf8_decode($aaa['id']).''));

$pdf->SetFont('Arial','',10);
$pdf->Text(150,40,utf8_decode('Asunto: Requerimiento'));
$pdf->Ln(40);
// $pdf->SetFont('Arial','B',10);
// $pdf->Cell(100,0,utf8_decode('ASPIRANTE A CANDIDATO POR EL PARTIDO POLÍTICO ___________'));
// $pdf->Ln(6);
$pdf->SetFont('Arial','B',10);
$pdf->Cell(100,0,'P R E S E N T E');

$pdf->Ln(8);
$pdf->SetFont('Arial','',9);
$pdf->MultiCell(180,6, utf8_decode('De la revisión efectuada a la documentación que anexó a la solicitud de registro de la/el ciudadano/a '.$fila['nombre'].' '.$fila['apellido_paterno'].' '.$fila['apellido_materno'].' que presentó ante este Consejo General para ser registrado/a al cargo de SINDICATURA '.strtoupper(utf8_decode($fila['propietario_suplente'])).' en ejercicio de las atribuciones que me confieren los artículos 62 fracción I y XIX, 153 y 155 de la Ley de Instituciones y Procedimientos Electorales para el Estado de Tlaxcala, me permito comunicarle que una vez realizado el análisis de la información y documentación remitida por Usted, se identificó que se omitió el cumplimiento del (los) requisito (s) siguiente (s):'),0,'J', 0 );
$pdf->Ln(20);
$pdf->SetFont('Arial','',9);
$corX = 115;

if (utf8_decode($documentos['SNR'])  != 'true') {
 $pdf->Text(15,$corX,utf8_decode('-'));
  $pdf->Text(20,$corX,utf8_decode('Documento emitido por el SNR del INE.'),0,'C', 0);
  $corX = $corX+5;
} else {/* */}
  if ( utf8_decode($documentos['REG']) != 'true') {
        $pdf->Text(15,$corX,utf8_decode('-'));
  $pdf->Text(20,$corX,utf8_decode('Solicitud de Registro.'),0,'C', 0);
  $corX = $corX+5;
} else {/* */}
  if ( utf8_decode($documentos['ACT']) != 'true') {
        $pdf->Text(15,$corX,utf8_decode('-'));
  $pdf->Text(20,$corX,utf8_decode('Copia certificada del acta de nacimiento.'),0,'C', 0);
  $corX = $corX+5;
}else {/* */}
  if ( utf8_decode($documentos['COPIA']) == 'NO') {
        $pdf->Text(15,$corX,utf8_decode('-'));
  $pdf->Text(20,$corX,utf8_decode('Copia certificada del acta de nacimiento del Padre o Madre Tlaxcalteca.'),0,'C', 0);
  $corX = $corX+5;
} else {/* */}
  if ( utf8_decode($documentos['CRED']) != 'true') {
        $pdf->Text(15,$corX,utf8_decode('-'));
  $pdf->Text(20,$corX,utf8_decode('Credencial para votar vigente.'),0,'C', 0);
  $corX = $corX+5;
} else {/* */}
  if ( utf8_decode($documentos['ACEPTACION']) != 'true') {
        $pdf->Text(15,$corX,utf8_decode('-'));
  $pdf->Text(20,$corX,utf8_decode('Constancia de aceptación de postulación.'),0,'C', 0);
  $corX = $corX+5;
}else {/* */}
  if ( utf8_decode($documentos['SEPARACION']) == 'NO') {
        $pdf->Text(15,$corX,utf8_decode('-'));
  $pdf->Text(20,$corX,utf8_decode('Constancia de Separación del cargo o función pública.'),0,'C', 0);
  $corX = $corX+5;
}else {/* */}
  if ( utf8_decode($documentos['RESIDENCIA']) != 'true') {
        $pdf->Text(15,$corX,utf8_decode('-'));
  $pdf->Text(20,$corX,utf8_decode('Constancia de Radicación.'),0,'C', 0);
  $corX = $corX+5;
}else {/* */}
  if ( utf8_decode($documentos['NP']) != 'true') {
        $pdf->Text(15,$corX,utf8_decode('-'));
  $pdf->Text(20,$corX,utf8_decode('Carta de antecedentes no penales.'),0,'C', 0);
  $corX = $corX+5;
}else {/* */}
  if ( utf8_decode($documentos['ESCRITO']) != 'true') {
        $pdf->Text(15,$corX,utf8_decode('-'));
  $pdf->Text(20,$corX,utf8_decode('Escrito bajo protesta de decir verdad que no se encuentra inhabilitado para ocupar un cargo público.'),0,'C', 0);
  $corX = $corX+5;
}else {/* */}
  if ( utf8_decode($documentos['MANIFIESTO']) != 'true') {
        $pdf->Text(15,$corX,utf8_decode('-'));
  $pdf->Text(20,$corX,utf8_decode('Manifestación de partido político.'),0,'C', 0);
  $corX = $corX+5;
}else {/* */}
  if ( utf8_decode($documentos['CAPACIDAD']) != 'true') {
  $pdf->Text(15,$corX,utf8_decode('-'));
  $pdf->Text(20,$corX,utf8_decode('Informe de capacidad económica.'),0,'C', 0);
  $corX = $corX+5;
}else {/* */}
  if ( utf8_decode($documentos['RFC']) != 'true') {
        $pdf->Text(15,$corX,utf8_decode('-'));
  $pdf->Text(20,$corX,utf8_decode('Cédula de identificación fiscal.'),0,'C', 0);
  $corX = $corX+5;
}else {
  /* */
}


if ( utf8_decode($documentos['CARTA3D3']) != 'true') {
  $pdf->Text(15,$corX,utf8_decode('-'));
  $pdf->Text(20,$corX,utf8_decode('Carta 3 de 3.'),0,'C', 0);
  $corX = $corX+5;
}else {/* */}
if ( utf8_decode($documentos['CARTA_REELECCION']) == 'NO') {
  $pdf->Text(15,$corX,utf8_decode('-'));
  $pdf->Text(20,$corX,utf8_decode('Carta reelección.'),0,'C', 0);
  $corX = $corX+5;
}else {/* */}
if ( utf8_decode($documentos['CONS_AUTORIZACION']) == 'NO') {
  $pdf->Text(15,$corX,utf8_decode('-'));
  $pdf->Text(20,$corX,utf8_decode('Constancia de autorización del órgano partidista en caso de reelección.'),0,'C', 0);
  $corX = $corX+5;
}else {/* */}
if ( utf8_decode($documentos['MANIFES_AUTOADCRIPCION']) == 'NO') {
  $pdf->Text(15,$corX,utf8_decode('-'));
  $pdf->Text(20,$corX,utf8_decode('Manifestación de autoadscripción indígena.'),0,'C', 0);
  $corX = $corX+5;
}else {/* */}
if ( utf8_decode($documentos['CONST_VINCULO_COMUNI']) == 'NO') {
  $pdf->Text(15,$corX,utf8_decode('-'));
  $pdf->Text(20,$corX,utf8_decode('Constancias que acrediten el vínculo comunitario.'),0,'C', 0);
  $corX = $corX+5;
}else {/* */}


$pdf->Ln(50);

$pdf->SetFont('Arial','',9);
$pdf->MultiCell(180,5, utf8_decode('

En tal virtud, con fundamento en el artículo 155, párrafo segundo de la Ley de Instituciones y Procedimientos Electorales para el Estado de Tlaxcala; se le requiere para que, a más tardar dentro de las 48 horas, contadas partir de la notificación de presente, subsane los requisitos omitidos.') ,0,'J', 0);
$pdf->Ln(2);
$pdf->SetFont('Arial','',9);
$pdf->MultiCell(180,5, utf8_decode('Lo anterior, apercibido (a) de que, en caso de incumplimiento al presente requerimiento dentro del término señalado, aplicará lo previsto por el artículo 154 de la Ley en cita.'),0,'J', 0 );
$pdf->Ln(2);
$pdf->SetFont('Arial','',9);
$pdf->MultiCell(180,5, utf8_decode('Sin otro particular, reciba un cordial saludo.') );
$pdf->Ln(2);
$pdf->SetFont('Arial','B',9);
$pdf->Text(80,225,utf8_decode('A T E N T A M E N T E'));
$pdf->Image('../../../assets/img/image.png',85,225,-200);
$pdf->Ln(10);
$pdf->SetFont('Arial','',9);
$pdf->Text(15,230,utf8_decode('Ex Fábrica de San Manuel s/n San Miguel Contla, Santa Cruz Tlaxcala, Tlaxcala, a '.date('d').' de '.$meses[date('n')].' de '.date("Y").' ') ,0,'C', 0);
$pdf->Ln(8);
$pdf->SetFont('Arial','B',9);
$pdf->Text(65,260,utf8_decode('XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') );
$pdf->Text(50,265,utf8_decode('CONSEJERO/A PRESIDENTE/A DEL INSTITUTO TLAXCALTECA') );
$pdf->Text(85,270,utf8_decode('DE ELECCIONES') );
$pdf->SetFont('Arial','I',9);
// echo var_dump($fila);
$pdf->Text(10,290,utf8_decode('Clave-Unica: '.$fila['has'].' '));

$pdf->Output();

} else {
  $fila = array('datos' => 3);
}

  }
  else if($candidatura == 7){

    $query = "SELECT
    candidatura_regiduria.nombre,
    candidatura_regiduria.apellido_paterno,
    candidatura_regiduria.apellido_materno,
    tipo_eleccion.nombre as candidatura,
    partidos_politicos.nombre_partido as partido_politico,
    candidatura_regiduria.fec_nacimiento,
    candidatura_regiduria.genero,
    candidatura_regiduria.clave_elector,
    candidatura_regiduria.propietario_suplente,
    candidatura_regiduria.curp,
    candidatura_regiduria.tiempo_residencia,
    candidatura_regiduria.sobrenombre,
    candidatura_regiduria.user_capturista
    FROM candidatura_regiduria, tipo_eleccion, partidos_politicos
    WHERE clave_elector = '$clave_elector' AND candidatura = $candidatura
    AND candidatura_regiduria.candidatura = tipo_eleccion.id_eleccion
    AND candidatura_regiduria.partido_politico = partidos_politicos.id_partido
    ";

    
  $stmt = $DB_con->prepare($query);
  $stmt->execute();
  $res = $stmt->get_result();

  if($res->num_rows < 1 ) {

    $fila = array("datos" => 1);

  } else if ($res->num_rows == 1) {

    $candidatos = $res->fetch_assoc();
    $fila = array(
      "nombre" => $candidatos["nombre"],
      "apellido_paterno" => $candidatos["apellido_paterno"],
      "apellido_materno" => $candidatos["apellido_materno"],
      "candidatura" => $candidatos["candidatura"],
      "partido_politico" => $candidatos["partido_politico"],      
      "fec_nacimiento" => $candidatos["fec_nacimiento"],
      "genero" => $candidatos["genero"],
      "clave_elector" => $candidatos["clave_elector"],
      "curp" => $candidatos["curp"],
      "propietario_suplente" => $candidatos["propietario_suplente"],
      "tiempo_residencia" => $candidatos["tiempo_residencia"],
      "sobrenombre" => $candidatos["sobrenombre"],
      "user_capturista" => $candidatos["user_capturista"],
      "datos" => 2
    );

    $clave_electores = $_GET["name"];

    $stmtdoc = $DB_con->prepare("SELECT * FROM candidatura_documentado WHERE clave_elector = '".$clave_electores."' AND id_tipo_registro =  '".$candidatura."' ");
    $stmtdoc->execute();
    $res = $stmtdoc->get_result();
    $candidatodocs = $res -> fetch_assoc();

    $documentos = array(

    "CARTA3D3" => $candidatodocs["carta_3_3"],
    "CARTA_REELECCION" => $candidatodocs["carta_reeleccion"],
    "CONS_AUTORIZACION" => $candidatodocs["const_autorizacion_organo"],
    "MANIFES_AUTOADCRIPCION" => $candidatodocs["manifes_autoadcripcion"],
    "CONST_VINCULO_COMUNI" => $candidatodocs["constancia_vinculo_comuni"],

    "SNR" => $candidatodocs["doc_snr_ine"],
    "ACT" => $candidatodocs["act_de_nacimiento"],
    "SNR" => $candidatodocs["doc_snr_ine"],
    "COPIA" => $candidatodocs["copia_act_de_nacimiento"],
    "SEPARACION" => $candidatodocs["const_separacion_cargo"],
    "ESCRITO" => $candidatodocs["escrito_bajo"],
    "NP" => $candidatodocs["const_act_no_penales"],
    "REG" => $candidatodocs["solicitud_registro"],
    "CRED" => $candidatodocs["cred_para_votar"],
    "ACEPTACION" => $candidatodocs["const_acept_postulacion"],
    "RESIDENCIA" => $candidatodocs["const_residencia"],
    "MANIFIESTO" => $candidatodocs["manifiesto"],
    "CAPACIDAD" => $candidatodocs["capacidad_economica"],
    "RFC" => $candidatodocs["cedula_rfc"],
    );

    $stmtUsus = $DB_con->prepare("SELECT SUBSTRING_INDEX( distrito, '-', 1 ) AS NumDistrito, distrito.nombre AS NombreDistrito FROM candidatura_diputado, distrito
                                  WHERE clave_elector = '$clave_elector' AND distrito.id_distrito = candidatura_diputado.distrito");
    $stmtUsus->execute();
    $res = $stmtUsus->get_result();
    $candidatosUsus = $res -> fetch_assoc();

    $filass = array(
        "NumDistrito" => $candidatosUsus["NumDistrito"],
        "NombreDistrito" => $candidatosUsus["NombreDistrito"],
        "datos" => 2
    );

    // $has = "'.date('d-m-Y').'""'.date('d-m-Y').'"

    $tipoDoc = "coppM";

    $has = md5(date("H:i:s"));
    $datos = array(
      $tipoDoc,
      $candidatos["user_capturista"],
      " ",
      " ",
      " ",
      date('Y-m-d'),
      date('H:i:s'),
      $has,
      $clave_elector,
      $candidatura
    );
    
    $query = "SELECT  folioDoc, has  FROM registro WHERE registro.clave_original = '$clave_elector' AND registro.tipo_doc = '$tipoDoc'; ";
    $stmt = $DB_con->prepare($query);
    $stmt->execute();
    $folio = $stmt->get_result();
    $folioR = $folio->fetch_assoc();

    // echo $query;

    if($folio->num_rows == 1){
      // echo 'dentro';
      $datos = $stmt->get_result();      
      $aaa = array(
        "id" => $folioR["folioDoc"],
        "has" => $folioR['has'],
        "datos" => 2
      );
      $fila['has'] = $aaa['has'];
    } else {
      // echo 'generar';
      $query = verProcedimiento("CALL generarFolio( ", $datos );
      $st = $DB_con->prepare($query);      
      $st->execute();
      $st = null;

      $query = "SELECT  folioDoc, has  FROM registro WHERE registro.clave_original = '$clave_elector' AND registro.tipo_doc = '$tipoDoc'; ";
      $stmt = $DB_con->prepare($query);
      $stmt->execute();
      $folio = $stmt->get_result();
      $folioR = $folio->fetch_assoc();

      $hola = $res -> fetch_assoc();
      $aaa = array(
        "id" => $folioR["folioDoc"],
        "has" => $folioR['has'],
        "datos" => 2
      );
      $fila['has'] = $aaa['has'];
    }

    class PDF extends FPDF {

      //Pie de página
      function Footer() {
        // Ex-Fábrica San Manuel S/N, Col. Barrio Nuevo C.P.90640, San Miguel Contla, Santa Cruz Tlaxcala. 01 (246) 4650340
        $this->SetY(-20);
        $this->SetFont('Arial','I',8);
        // $this->MultiCell(180,6, utf8_decode('',0,0,'C'));
        $this->MultiCell(180,6, utf8_decode('Ex-Fábrica San Manuel S/N, Col. Barrio Nuevo C.P.90640, San Miguel Contla, Santa Cruz Tlaxcala. 01 (246) 4650340'),0,'C', 0 );
      }
   }


  $pdf = new PDF();
  $pdf->AddPage();

	$pdf->SetFont('Arial','B',11);
	$pdf-> Cell(100,80, ''.utf8_decode($fila['partido_politico']).'');

	$pdf->Image('../../../assets/img/logoite.png',130,10,-300);
	$pdf->Ln(5);
	$pdf->SetFont('Arial','B',10);
  $pdf->Text(11,42,utf8_decode('FOLIO ' .utf8_decode($aaa['id']).''));

	$pdf->SetFont('Arial','',10);
  $pdf->Text(150,40,utf8_decode('Asunto: Requerimiento'));
  $pdf->Ln(40);
  // $pdf->SetFont('Arial','B',10);
  // $pdf->Cell(100,0,utf8_decode('ASPIRANTE A CANDIDATO POR EL PARTIDO POLÍTICO ___________'));
	// $pdf->Ln(6);
	$pdf->SetFont('Arial','B',10);
  $pdf->Cell(100,0,'P R E S E N T E');

	$pdf->Ln(8);
	$pdf->SetFont('Arial','',9);
	$pdf->MultiCell(180,6, utf8_decode('De la revisión efectuada a la documentación que anexó a la solicitud de registro de la/el ciudadano/a '.$fila['nombre'].' '.$fila['apellido_paterno'].' '.$fila['apellido_materno'].' que presentó ante este Consejo General para ser registrado/a al cargo de REGIDURIA '.strtoupper(utf8_decode($fila['propietario_suplente'])).' en ejercicio de las atribuciones que me confieren los artículos 62 fracción I y XIX, 153 y 155 de la Ley de Instituciones y Procedimientos Electorales para el Estado de Tlaxcala, me permito comunicarle que una vez realizado el análisis de la información y documentación remitida por Usted, se identificó que se omitió el cumplimiento del (los) requisito (s) siguiente (s):'),0,'J', 0 );
  $pdf->Ln(20);
  $pdf->SetFont('Arial','',9);
  $corX = 115;

  if (utf8_decode($documentos['SNR'])  != 'true') {
   $pdf->Text(15,$corX,utf8_decode('-'));
    $pdf->Text(20,$corX,utf8_decode('Documento emitido por el SNR del INE.'),0,'C', 0);
    $corX = $corX+5;
  } else {/* */}
    if ( utf8_decode($documentos['REG']) != 'true') {
          $pdf->Text(15,$corX,utf8_decode('-'));
    $pdf->Text(20,$corX,utf8_decode('Solicitud de Registro.'),0,'C', 0);
    $corX = $corX+5;
  } else {/* */}
    if ( utf8_decode($documentos['ACT']) != 'true') {
          $pdf->Text(15,$corX,utf8_decode('-'));
    $pdf->Text(20,$corX,utf8_decode('Copia certificada del acta de nacimiento.'),0,'C', 0);
    $corX = $corX+5;
  }else {/* */}
    if ( utf8_decode($documentos['COPIA']) == 'NO') {
          $pdf->Text(15,$corX,utf8_decode('-'));
    $pdf->Text(20,$corX,utf8_decode('Copia certificada del acta de nacimiento del Padre o Madre Tlaxcalteca.'),0,'C', 0);
    $corX = $corX+5;
  } else {/* */}
    if ( utf8_decode($documentos['CRED']) != 'true') {
          $pdf->Text(15,$corX,utf8_decode('-'));
    $pdf->Text(20,$corX,utf8_decode('Credencial para votar vigente.'),0,'C', 0);
    $corX = $corX+5;
  } else {/* */}
    if ( utf8_decode($documentos['ACEPTACION']) != 'true') {
          $pdf->Text(15,$corX,utf8_decode('-'));
    $pdf->Text(20,$corX,utf8_decode('Constancia de aceptación de postulación.'),0,'C', 0);
    $corX = $corX+5;
  }else {/* */}
    if ( utf8_decode($documentos['SEPARACION']) == 'NO') {
          $pdf->Text(15,$corX,utf8_decode('-'));
    $pdf->Text(20,$corX,utf8_decode('Constancia de Separación del cargo o función pública.'),0,'C', 0);
    $corX = $corX+5;
  }else {/* */}
    if ( utf8_decode($documentos['RESIDENCIA']) != 'true') {
          $pdf->Text(15,$corX,utf8_decode('-'));
    $pdf->Text(20,$corX,utf8_decode('Constancia de Radicación.'),0,'C', 0);
    $corX = $corX+5;
  }else {/* */}
    if ( utf8_decode($documentos['NP']) != 'true') {
          $pdf->Text(15,$corX,utf8_decode('-'));
    $pdf->Text(20,$corX,utf8_decode('Carta de antecedentes no penales.'),0,'C', 0);
    $corX = $corX+5;
  }else {/* */}
    if ( utf8_decode($documentos['ESCRITO']) != 'true') {
          $pdf->Text(15,$corX,utf8_decode('-'));
    $pdf->Text(20,$corX,utf8_decode('Escrito bajo protesta de decir verdad que no se encuentra inhabilitado para ocupar un cargo público.'),0,'C', 0);
    $corX = $corX+5;
  }else {/* */}
    if ( utf8_decode($documentos['MANIFIESTO']) != 'true') {
          $pdf->Text(15,$corX,utf8_decode('-'));
    $pdf->Text(20,$corX,utf8_decode('Manifestación de partido político.'),0,'C', 0);
    $corX = $corX+5;
  }else {/* */}
    if ( utf8_decode($documentos['CAPACIDAD']) != 'true') {
    $pdf->Text(15,$corX,utf8_decode('-'));
    $pdf->Text(20,$corX,utf8_decode('Informe de capacidad económica.'),0,'C', 0);
    $corX = $corX+5;
  }else {/* */}
    if ( utf8_decode($documentos['RFC']) != 'true') {
          $pdf->Text(15,$corX,utf8_decode('-'));
    $pdf->Text(20,$corX,utf8_decode('Cédula de identificación fiscal.'),0,'C', 0);
    $corX = $corX+5;
  }else {
    /* */
  }


  if ( utf8_decode($documentos['CARTA3D3']) != 'true') {
    $pdf->Text(15,$corX,utf8_decode('-'));
    $pdf->Text(20,$corX,utf8_decode('Carta 3 de 3.'),0,'C', 0);
    $corX = $corX+5;
  }else {/* */}
  if ( utf8_decode($documentos['CARTA_REELECCION']) == 'NO') {
    $pdf->Text(15,$corX,utf8_decode('-'));
    $pdf->Text(20,$corX,utf8_decode('Carta reelección.'),0,'C', 0);
    $corX = $corX+5;
  }else {/* */}
  if ( utf8_decode($documentos['CONS_AUTORIZACION']) == 'NO') {
    $pdf->Text(15,$corX,utf8_decode('-'));
    $pdf->Text(20,$corX,utf8_decode('Constancia de autorización del órgano partidista en caso de reelección.'),0,'C', 0);
    $corX = $corX+5;
  }else {/* */}
  if ( utf8_decode($documentos['MANIFES_AUTOADCRIPCION']) == 'NO') {
    $pdf->Text(15,$corX,utf8_decode('-'));
    $pdf->Text(20,$corX,utf8_decode('Manifestación de autoadscripción indígena.'),0,'C', 0);
    $corX = $corX+5;
  }else {/* */}
  if ( utf8_decode($documentos['CONST_VINCULO_COMUNI']) == 'NO') {
    $pdf->Text(15,$corX,utf8_decode('-'));
    $pdf->Text(20,$corX,utf8_decode('Constancias que acrediten el vínculo comunitario.'),0,'C', 0);
    $corX = $corX+5;
  }else {/* */}


  $pdf->Ln(50);

  $pdf->SetFont('Arial','',9);
  $pdf->MultiCell(180,5, utf8_decode('

En tal virtud, con fundamento en el artículo 155, párrafo segundo de la Ley de Instituciones y Procedimientos Electorales para el Estado de Tlaxcala; se le requiere para que, a más tardar dentro de las 48 horas, contadas partir de la notificación de presente, subsane los requisitos omitidos.') ,0,'J', 0);
  $pdf->Ln(2);
  $pdf->SetFont('Arial','',9);
  $pdf->MultiCell(180,5, utf8_decode('Lo anterior, apercibido (a) de que, en caso de incumplimiento al presente requerimiento dentro del término señalado, aplicará lo previsto por el artículo 154 de la Ley en cita.'),0,'J', 0 );
  $pdf->Ln(2);
  $pdf->SetFont('Arial','',9);
  $pdf->MultiCell(180,5, utf8_decode('Sin otro particular, reciba un cordial saludo.') );
  $pdf->Ln(2);
  $pdf->SetFont('Arial','B',9);
  $pdf->Text(80,225,utf8_decode('A T E N T A M E N T E'));
  $pdf->Image('../../../assets/img/image.png',85,225,-200);
  $pdf->Ln(10);
  $pdf->SetFont('Arial','',9);
  $pdf->Text(15,230,utf8_decode('Ex Fábrica de San Manuel s/n San Miguel Contla, Santa Cruz Tlaxcala, Tlaxcala, a '.date('d').' de '.$meses[date('n')].' de '.date("Y").' ') ,0,'C', 0);
  $pdf->Ln(8);
  $pdf->SetFont('Arial','B',9);
  $pdf->Text(65,260,utf8_decode('XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') );
  $pdf->Text(50,265,utf8_decode('CONSEJERO/A PRESIDENTE/A DEL INSTITUTO TLAXCALTECA') );
  $pdf->Text(85,270,utf8_decode('DE ELECCIONES') );
  $pdf->SetFont('Arial','I',9);
  // echo var_dump($fila);
  $pdf->Text(10,290,utf8_decode('Clave-Unica: '.$fila['has'].' '));

  $pdf->Output();

  } else {
    $fila = array('datos' => 3);
  }
 
  } else{

    $query = "SELECT
    candidatura_ayuntamiento.nombre,
    candidatura_ayuntamiento.apellido_paterno,
    candidatura_ayuntamiento.apellido_materno,
    tipo_eleccion.nombre as candidatura,
    partidos_politicos.nombre_partido as partido_politico,
    candidatura_ayuntamiento.fec_nacimiento,
    candidatura_ayuntamiento.genero,
    candidatura_ayuntamiento.clave_elector,
    candidatura_ayuntamiento.propietario_suplente,
    candidatura_ayuntamiento.curp,
    candidatura_ayuntamiento.tiempo_residencia,
    candidatura_ayuntamiento.sobrenombre,
    candidatura_ayuntamiento.user_capturista
    FROM candidatura_ayuntamiento, tipo_eleccion, partidos_politicos
    WHERE clave_elector = '$clave_elector' AND candidatura = $candidatura
    AND candidatura_ayuntamiento.candidatura = tipo_eleccion.id_eleccion
    AND candidatura_ayuntamiento.partido_politico = partidos_politicos.id_partido";

  }

  $stmt = $DB_con->prepare($query);
  $stmt->execute();
  $res = $stmt->get_result();

  if($res->num_rows < 1 ) {

    $fila = array("datos" => 1);

  } else if ($res->num_rows == 1) {

    $candidatos = $res->fetch_assoc();
    $fila = array(
      "nombre" => $candidatos["nombre"],
      "apellido_paterno" => $candidatos["apellido_paterno"],
      "apellido_materno" => $candidatos["apellido_materno"],
      "candidatura" => $candidatos["candidatura"],
      "partido_politico" => $candidatos["partido_politico"],      
      "fec_nacimiento" => $candidatos["fec_nacimiento"],
      "genero" => $candidatos["genero"],
      "clave_elector" => $candidatos["clave_elector"],
      "curp" => $candidatos["curp"],
      "propietario_suplente" => $candidatos["propietario_suplente"],
      "tiempo_residencia" => $candidatos["tiempo_residencia"],
      "sobrenombre" => $candidatos["sobrenombre"],
      "user_capturista" => $candidatos["user_capturista"],
      "datos" => 2
    );

    $clave_electores = $_GET["name"];

    $stmtdoc = $DB_con->prepare("SELECT * FROM candidatura_documentado WHERE clave_elector = '".$clave_electores."' AND id_tipo_registro =  '".$candidatura."' ");
    $stmtdoc->execute();
    $res = $stmtdoc->get_result();
    $candidatodocs = $res -> fetch_assoc();

    $documentos = array(

    "CARTA3D3" => $candidatodocs["carta_3_3"],
    "CARTA_REELECCION" => $candidatodocs["carta_reeleccion"],
    "CONS_AUTORIZACION" => $candidatodocs["const_autorizacion_organo"],
    "MANIFES_AUTOADCRIPCION" => $candidatodocs["manifes_autoadcripcion"],
    "CONST_VINCULO_COMUNI" => $candidatodocs["constancia_vinculo_comuni"],

    "SNR" => $candidatodocs["doc_snr_ine"],
    "ACT" => $candidatodocs["act_de_nacimiento"],
    "SNR" => $candidatodocs["doc_snr_ine"],
    "COPIA" => $candidatodocs["copia_act_de_nacimiento"],
    "SEPARACION" => $candidatodocs["const_separacion_cargo"],
    "ESCRITO" => $candidatodocs["escrito_bajo"],
    "NP" => $candidatodocs["const_act_no_penales"],
    "REG" => $candidatodocs["solicitud_registro"],
    "CRED" => $candidatodocs["cred_para_votar"],
    "ACEPTACION" => $candidatodocs["const_acept_postulacion"],
    "RESIDENCIA" => $candidatodocs["const_residencia"],
    "MANIFIESTO" => $candidatodocs["manifiesto"],
    "CAPACIDAD" => $candidatodocs["capacidad_economica"],
    "RFC" => $candidatodocs["cedula_rfc"],
    );

    $stmtUsus = $DB_con->prepare("SELECT SUBSTRING_INDEX( distrito, '-', 1 ) AS NumDistrito, distrito.nombre AS NombreDistrito FROM candidatura_diputado, distrito
                                  WHERE clave_elector = '$clave_elector' AND distrito.id_distrito = candidatura_diputado.distrito");
    $stmtUsus->execute();
    $res = $stmtUsus->get_result();
    $candidatosUsus = $res -> fetch_assoc();

    $filass = array(
        "NumDistrito" => $candidatosUsus["NumDistrito"],
        "NombreDistrito" => $candidatosUsus["NombreDistrito"],
        "datos" => 2
    );

    // $has = "'.date('d-m-Y').'""'.date('d-m-Y').'"

    $tipoDoc = "coppM";

    $has = md5(date("H:i:s"));
    $datos = array(
      $tipoDoc,
      $candidatos["user_capturista"],
      " ",
      " ",
      " ",
      date('Y-m-d'),
      date('H:i:s'),
      $has,
      $clave_elector,
      $candidatura
    );
    
    $query = "SELECT  folioDoc, has  FROM registro WHERE registro.clave_original = '$clave_elector' AND registro.tipo_doc = '$tipoDoc'; ";
    $stmt = $DB_con->prepare($query);
    $stmt->execute();
    $folio = $stmt->get_result();
    $folioR = $folio->fetch_assoc();

    // echo $query;

    if($folio->num_rows == 1){
      // echo 'dentro';
      $datos = $stmt->get_result();      
      $aaa = array(
        "id" => $folioR["folioDoc"],
        "has" => $folioR['has'],
        "datos" => 2
      );
      $fila['has'] = $aaa['has'];
    } else {
      // echo 'generar';
      $query = verProcedimiento("CALL generarFolio( ", $datos );
      $st = $DB_con->prepare($query);      
      $st->execute();
      $st = null;

      $query = "SELECT  folioDoc, has  FROM registro WHERE registro.clave_original = '$clave_elector' AND registro.tipo_doc = '$tipoDoc'; ";
      $stmt = $DB_con->prepare($query);
      $stmt->execute();
      $folio = $stmt->get_result();
      $folioR = $folio->fetch_assoc();

      $hola = $res -> fetch_assoc();
      $aaa = array(
        "id" => $folioR["folioDoc"],
        "has" => $folioR['has'],
        "datos" => 2
      );
      $fila['has'] = $aaa['has'];
    }

    class PDF extends FPDF {

      //Pie de página
      function Footer() {
        // Ex-Fábrica San Manuel S/N, Col. Barrio Nuevo C.P.90640, San Miguel Contla, Santa Cruz Tlaxcala. 01 (246) 4650340
        $this->SetY(-20);
        $this->SetFont('Arial','I',8);
        // $this->MultiCell(180,6, utf8_decode('',0,0,'C'));
        $this->MultiCell(180,6, utf8_decode('Ex-Fábrica San Manuel S/N, Col. Barrio Nuevo C.P.90640, San Miguel Contla, Santa Cruz Tlaxcala. 01 (246) 4650340'),0,'C', 0 );
      }
   }


  $pdf = new PDF();
  $pdf->AddPage();

	$pdf->SetFont('Arial','B',11);
	$pdf-> Cell(100,80, ''.utf8_decode($fila['partido_politico']).'');

	$pdf->Image('../../../assets/img/logoite.png',130,10,-300);
	$pdf->Ln(5);
	$pdf->SetFont('Arial','B',10);
  $pdf->Text(11,42,utf8_decode('FOLIO ' .utf8_decode($aaa['id']).''));

	$pdf->SetFont('Arial','',10);
  $pdf->Text(150,40,utf8_decode('Asunto: Requerimiento'));
  $pdf->Ln(40);
  // $pdf->SetFont('Arial','B',10);
  // $pdf->Cell(100,0,utf8_decode('ASPIRANTE A CANDIDATO POR EL PARTIDO POLÍTICO ___________'));
	// $pdf->Ln(6);
	$pdf->SetFont('Arial','B',10);
  $pdf->Cell(100,0,'P R E S E N T E');

	$pdf->Ln(8);
	$pdf->SetFont('Arial','',9);
	$pdf->MultiCell(180,6, utf8_decode('De la revisión efectuada a la documentación que anexó a la solicitud de registro de la/el ciudadano/a '.$fila['nombre'].' '.$fila['apellido_paterno'].' '.$fila['apellido_materno'].' que presentó ante este Consejo General para ser registrado/a al cargo de PRESIDENCIA MUNICIPAL '.strtoupper(utf8_decode($fila['propietario_suplente'])).' en ejercicio de las atribuciones que me confieren los artículos 62 fracción I y XIX, 153 y 155 de la Ley de Instituciones y Procedimientos Electorales para el Estado de Tlaxcala, me permito comunicarle que una vez realizado el análisis de la información y documentación remitida por Usted, se identificó que se omitió el cumplimiento del (los) requisito (s) siguiente (s):'),0,'J', 0 );
  $pdf->Ln(20);
  $pdf->SetFont('Arial','',9);
  $corX = 115;

  if (utf8_decode($documentos['SNR'])  != 'true') {
   $pdf->Text(15,$corX,utf8_decode('-'));
    $pdf->Text(20,$corX,utf8_decode('Documento emitido por el SNR del INE.'),0,'C', 0);
    $corX = $corX+5;
  } else {/* */}
    if ( utf8_decode($documentos['REG']) != 'true') {
          $pdf->Text(15,$corX,utf8_decode('-'));
    $pdf->Text(20,$corX,utf8_decode('Solicitud de Registro.'),0,'C', 0);
    $corX = $corX+5;
  } else {/* */}
    if ( utf8_decode($documentos['ACT']) != 'true') {
          $pdf->Text(15,$corX,utf8_decode('-'));
    $pdf->Text(20,$corX,utf8_decode('Copia certificada del acta de nacimiento.'),0,'C', 0);
    $corX = $corX+5;
  }else {/* */}
    if ( utf8_decode($documentos['COPIA']) == 'NO') {
          $pdf->Text(15,$corX,utf8_decode('-'));
    $pdf->Text(20,$corX,utf8_decode('Copia certificada del acta de nacimiento del Padre o Madre Tlaxcalteca.'),0,'C', 0);
    $corX = $corX+5;
  } else {/* */}
    if ( utf8_decode($documentos['CRED']) != 'true') {
          $pdf->Text(15,$corX,utf8_decode('-'));
    $pdf->Text(20,$corX,utf8_decode('Credencial para votar vigente.'),0,'C', 0);
    $corX = $corX+5;
  } else {/* */}
    if ( utf8_decode($documentos['ACEPTACION']) != 'true') {
          $pdf->Text(15,$corX,utf8_decode('-'));
    $pdf->Text(20,$corX,utf8_decode('Constancia de aceptación de postulación.'),0,'C', 0);
    $corX = $corX+5;
  }else {/* */}
    if ( utf8_decode($documentos['SEPARACION']) == 'NO') {
          $pdf->Text(15,$corX,utf8_decode('-'));
    $pdf->Text(20,$corX,utf8_decode('Constancia de Separación del cargo o función pública.'),0,'C', 0);
    $corX = $corX+5;
  }else {/* */}
    if ( utf8_decode($documentos['RESIDENCIA']) != 'true') {
          $pdf->Text(15,$corX,utf8_decode('-'));
    $pdf->Text(20,$corX,utf8_decode('Constancia de Radicación.'),0,'C', 0);
    $corX = $corX+5;
  }else {/* */}
    if ( utf8_decode($documentos['NP']) != 'true') {
          $pdf->Text(15,$corX,utf8_decode('-'));
    $pdf->Text(20,$corX,utf8_decode('Carta de antecedentes no penales.'),0,'C', 0);
    $corX = $corX+5;
  }else {/* */}
    if ( utf8_decode($documentos['ESCRITO']) != 'true') {
          $pdf->Text(15,$corX,utf8_decode('-'));
    $pdf->Text(20,$corX,utf8_decode('Escrito bajo protesta de decir verdad que no se encuentra inhabilitado para ocupar un cargo público.'),0,'C', 0);
    $corX = $corX+5;
  }else {/* */}
    if ( utf8_decode($documentos['MANIFIESTO']) != 'true') {
          $pdf->Text(15,$corX,utf8_decode('-'));
    $pdf->Text(20,$corX,utf8_decode('Manifestación de partido político.'),0,'C', 0);
    $corX = $corX+5;
  }else {/* */}
    if ( utf8_decode($documentos['CAPACIDAD']) != 'true') {
    $pdf->Text(15,$corX,utf8_decode('-'));
    $pdf->Text(20,$corX,utf8_decode('Informe de capacidad económica.'),0,'C', 0);
    $corX = $corX+5;
  }else {/* */}
    if ( utf8_decode($documentos['RFC']) != 'true') {
          $pdf->Text(15,$corX,utf8_decode('-'));
    $pdf->Text(20,$corX,utf8_decode('Cédula de identificación fiscal.'),0,'C', 0);
    $corX = $corX+5;
  }else {
    /* */
  }


  if ( utf8_decode($documentos['CARTA3D3']) != 'true') {
    $pdf->Text(15,$corX,utf8_decode('-'));
    $pdf->Text(20,$corX,utf8_decode('Carta 3 de 3.'),0,'C', 0);
    $corX = $corX+5;
  }else {/* */}
  if ( utf8_decode($documentos['CARTA_REELECCION']) == 'NO') {
    $pdf->Text(15,$corX,utf8_decode('-'));
    $pdf->Text(20,$corX,utf8_decode('Carta reelección.'),0,'C', 0);
    $corX = $corX+5;
  }else {/* */}
  if ( utf8_decode($documentos['CONS_AUTORIZACION']) == 'NO') {
    $pdf->Text(15,$corX,utf8_decode('-'));
    $pdf->Text(20,$corX,utf8_decode('Constancia de autorización del órgano partidista en caso de reelección.'),0,'C', 0);
    $corX = $corX+5;
  }else {/* */}
  if ( utf8_decode($documentos['MANIFES_AUTOADCRIPCION']) == 'NO') {
    $pdf->Text(15,$corX,utf8_decode('-'));
    $pdf->Text(20,$corX,utf8_decode('Manifestación de autoadscripción indígena.'),0,'C', 0);
    $corX = $corX+5;
  }else {/* */}
  if ( utf8_decode($documentos['CONST_VINCULO_COMUNI']) == 'NO') {
    $pdf->Text(15,$corX,utf8_decode('-'));
    $pdf->Text(20,$corX,utf8_decode('Constancias que acrediten el vínculo comunitario.'),0,'C', 0);
    $corX = $corX+5;
  }else {/* */}


  $pdf->Ln(50);

  $pdf->SetFont('Arial','',9);
  $pdf->MultiCell(180,5, utf8_decode('

En tal virtud, con fundamento en el artículo 155, párrafo segundo de la Ley de Instituciones y Procedimientos Electorales para el Estado de Tlaxcala; se le requiere para que, a más tardar dentro de las 48 horas, contadas partir de la notificación de presente, subsane los requisitos omitidos.') ,0,'J', 0);
  $pdf->Ln(2);
  $pdf->SetFont('Arial','',9);
  $pdf->MultiCell(180,5, utf8_decode('Lo anterior, apercibido (a) de que, en caso de incumplimiento al presente requerimiento dentro del término señalado, aplicará lo previsto por el artículo 154 de la Ley en cita.'),0,'J', 0 );
  $pdf->Ln(2);
  $pdf->SetFont('Arial','',9);
  $pdf->MultiCell(180,5, utf8_decode('Sin otro particular, reciba un cordial saludo.') );
  $pdf->Ln(2);
  $pdf->SetFont('Arial','B',9);
  $pdf->Text(80,225,utf8_decode('A T E N T A M E N T E'));
  $pdf->Image('../../../assets/img/image.png',85,225,-200);
  $pdf->Ln(10);
  $pdf->SetFont('Arial','',9);
  $pdf->Text(15,230,utf8_decode('Ex Fábrica de San Manuel s/n San Miguel Contla, Santa Cruz Tlaxcala, Tlaxcala, a '.date('d').' de '.$meses[date('n')].' de '.date("Y").' ') ,0,'C', 0);
  $pdf->Ln(8);
  $pdf->SetFont('Arial','B',9);
  $pdf->Text(65,260,utf8_decode('XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') );
  $pdf->Text(50,265,utf8_decode('CONSEJERO/A PRESIDENTE/A DEL INSTITUTO TLAXCALTECA') );
  $pdf->Text(85,270,utf8_decode('DE ELECCIONES') );
  $pdf->SetFont('Arial','I',9);
  // echo var_dump($fila);
  $pdf->Text(10,290,utf8_decode('Clave-Unica: '.$fila['has'].' '));

  $pdf->Output();

  } else {
    $fila = array('datos' => 3);
  }

  // echo json_encode($fila);
 ?>
