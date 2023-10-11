<?php
	require '../../fpdf/fpdf.php';


require_once '../../../controladores/conndb.php';
date_default_timezone_set('America/Mexico_city');

  $clave_elector = $_GET["name"];
  $candidatura = $_GET["candidatura"];

  $stmt = $DB_con->prepare("
  SELECT
  candidatura_diputado.nombre,
  candidatura_diputado.apellido_paterno,
  candidatura_diputado.apellido_materno,
  tipo_eleccion.nombre as candidatura,
  partidos_politicos.nombre_partido as partido_politico,
  distrito.nombre as distrito,
  candidatura_diputado.fec_nacimiento,
  candidatura_diputado.genero,
  candidatura_diputado.clave_elector,
  candidatura_diputado.propietario_suplente,
  candidatura_diputado.curp,
  candidatura_diputado.tiempo_residencia,
  candidatura_diputado.sobrenombre,
  candidatura_diputado.user_capturista
  FROM candidatura_diputado, partidos_politicos, tipo_eleccion, distrito
  WHERE clave_elector = '$clave_elector' AND candidatura = $candidatura
  AND partidos_politicos.id_partido = candidatura_diputado.partido_politico
  AND tipo_eleccion.id_eleccion = candidatura_diputado.candidatura
  AND distrito.id_distrito = candidatura_diputado.distrito ");
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
      "distrito" => $candidatos["distrito"],
      "fec_nacimiento" => $candidatos["fec_nacimiento"],
      "genero" => $candidatos["genero"],
      "clave_elector" => $candidatos["clave_elector"],
      "curp" => $candidatos["curp"],
      "distrito" => $candidatos["distrito"],
      "propietario_suplente" => $candidatos["propietario_suplente"],
      "tiempo_residencia" => $candidatos["tiempo_residencia"],
      "sobrenombre" => $candidatos["sobrenombre"],
      "user_capturista" => $candidatos["user_capturista"],
      "datos" => 2
    );


    $clave_electores = $_GET["name"];
    // $capturista =  'amelia';
    $stmtUsus = $DB_con->prepare("
    SELECT SUBSTRING_INDEX( distrito, '-', 1 ) AS NumDistrito, SUBSTRING_INDEX( distrito, '-' , -1 ) AS NombreDistrito
    FROM candidatura_diputado WHERE clave_elector = '".$clave_electores."' ");
    $stmtUsus->execute();
    $res = $stmtUsus->get_result();

    $candidatosUsus = $res->fetch_assoc();
    $filass = array(
      "NumDistrito" => $candidatosUsus["NumDistrito"],
      "NombreDistrito" => $candidatosUsus["NombreDistrito"],
      "datos" => 2
    );


    $has = sha1(date("h:i:sa"));
    $tipoDoc = "RSCARGOPLURI";
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

class PDF extends FPDF
{

//Pie de página
function Footer()
{
  // Ex-Fábrica San Manuel S/N, Col. Barrio Nuevo C.P.90640, San Miguel Contla, Santa Cruz Tlaxcala. 01 (246) 4650340

$this->SetY(-20);

$this->SetFont('Arial','I',8);

// $this->MultiCell(180,6, utf8_decode('',0,0,'C'));
$this->MultiCell(180,6, utf8_decode('Ex-Fábrica San Manuel S/N, Col. Barrio Nuevo C.P.90640, San Miguel Contla, Santa Cruz Tlaxcala. 01 (246) 4650340'),0,'C', 0 );
   }
}
//Creación del objeto de la clase heredada
 $pdf = new PDF();
//  header("Content-Type: text/html; charset=iso-8859-1 ");
  $pdf->AddPage();
    $pdf->SetFont('Arial','B',11);
  $pdf-> Cell(100,80, ''.utf8_decode($fila['partido_politico']).'');
  $pdf->Image('../../../assets/img/logoite.png',130,10,-300);
  $pdf->Ln(6);
  $pdf->SetFont('Arial','B',10);
  $pdf->Text(11,42,utf8_decode('FOLIO ' .utf8_decode($aaa['id']).''));
  $pdf->Ln(5);
  $pdf->SetFont('Arial','',10);
    $pdf->Text(150,40,utf8_decode('Asunto: Requerimiento'));
    $pdf->Ln(35);
  $pdf->SetFont('Arial','B',10);
    $pdf->Cell(100,0,'PRESENTE');
  $pdf->Ln(10);
  $pdf->SetFont('Arial','',12);

	$pdf->MultiCell(180,6, utf8_decode('Por medio del presente escrito y en cumplimiento con los artículos 35, párrafo segundo de la Constitución Política del Estado Libre y Soberano de Tlaxcala, 152 fracción IV y 155 párrafo segundo de la Ley de Instituciones y Procedimientos Electorales para el Estado de Tlaxcala, me permito requerirle a la/el ciudadano/a '.$fila['nombre'].' '.$fila['apellido_paterno'].' '.$fila['apellido_materno'].' para ser registrado/a como candidato/a al cargo de DIPUTACIÓN LOCAL POR EL PRINCIPIO DE REPRESENTACIÓN PROPORCIONAL CON CARÁCTER DE '.strtoupper($fila['propietario_suplente']).', CONSTANCIA DE SOLICITUD DE SEPARACIÓN DEL CARGO O FUNCIÓN PÚBLICA, misma que deberá ser entregada a esta autoridad administrativa electoral, hasta antes del día dos de mayo del dos mil dieciocho, lo anterior por ser necesaria para la procedencia de su registro, dentro del Proceso Electoral Local Ordinario 2020-'.date("Y").' .'),0,'J', 0 );
	$pdf->Ln(10);
	$pdf->SetFont('Arial','',12);
	$pdf->MultiCell(180,6, utf8_decode('Sin otro particular, reciba un cordial saludo.') );
	$pdf->Ln(10);
	$pdf->SetFont('Arial','B',12);
  $pdf->Text(80,225,utf8_decode('A T E N T A M E N T E'));
  $pdf->Image('../../../assets/img/image.png',85,225,-200);
  $pdf->Ln(10);
  $pdf->SetFont('Arial','',10);
  $pdf->Text(15,230,utf8_decode('Ex Fábrica de San Manuel s/n San Miguel Contla, Santa Cruz Tlaxcala, Tlaxcala, a '.date('d').' de '.$meses[date('n')].' de '.date("Y").' ') ,0,'C', 0);
  $pdf->Ln(8);
  $pdf->SetFont('Arial','B',10);
  $pdf->Text(65,260,utf8_decode('XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') );
  $pdf->Text(45,265,utf8_decode('CONSEJERO/A PRESIDENTE/A DEL INSTITUTO TLAXCALTECA') );
  $pdf->Text(85,270,utf8_decode('DE ELECCIONES') );
  $pdf->SetFont('Arial','I',9);

	 $pdf->Text(10,290,utf8_decode('Clave-Unica: '.$fila['has'].' '));

$pdf->Output();



  } else {
    $fila = array('datos' => 3);
  }
  // echo json_encode($fila);
 ?>
