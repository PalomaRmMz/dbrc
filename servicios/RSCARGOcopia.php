<?php
	require './fpdf/fpdf.php';


require_once '../controladores/conndb.php';
date_default_timezone_set('America/Mexico_city');


  $clave_elector = $_GET["name"];
  $stmt = $DB_con->prepare("SELECT
      nombre,
      apellido_paterno,
      apellido_materno,
      candidatura,
      partido_politico,
      distrito,
      fec_nacimiento,
      genero,
      clave_elector,
      distrito,
      propietario_suplente,
      curp,
      tiempo_residencia,
      sobrenombre,
      user_capturista
    FROM candidatura_diputado WHERE clave_elector = '".$clave_elector."' AND candidatura = 'MAYORÍA RELATIVA' ");
  $stmt->execute();

  if($stmt -> rowCount() < 1 ) {
    $fila = array("datos" => 1);
  } else if ($stmt -> rowCount() == 1) {
    $candidatos = $stmt -> fetch(PDO::FETCH_ASSOC);
    $fila = array(
      "nombre" => utf8_encode($candidatos["nombre"]),
      "apellido_paterno" => utf8_encode($candidatos["apellido_paterno"]),
      "apellido_materno" => utf8_encode($candidatos["apellido_materno"]),
      "candidatura" => utf8_encode($candidatos["candidatura"]),
      "partido_politico" => utf8_encode($candidatos["partido_politico"]),
      "distrito" => utf8_encode($candidatos["distrito"]),
      "fec_nacimiento" => utf8_encode($candidatos["fec_nacimiento"]),
      "genero" => utf8_encode($candidatos["genero"]),
      "clave_elector" => utf8_encode($candidatos["clave_elector"]),
      "curp" => utf8_encode($candidatos["curp"]),
      "distrito" => utf8_encode($candidatos["distrito"]),
      "propietario_suplente" => utf8_encode($candidatos["propietario_suplente"]),
      "tiempo_residencia" => utf8_encode($candidatos["tiempo_residencia"]),
      "sobrenombre" => utf8_encode($candidatos["sobrenombre"]),
      "user_capturista" => utf8_encode($candidatos["user_capturista"]),
      "datos" => 2
      );



     $clave_electores = $_GET["name"];
  // $capturista =  'amelia';
 $stmtUsus = $DB_con->prepare("
      SELECT SUBSTRING_INDEX( distrito, '-', 1 ) AS NumDistrito, SUBSTRING_INDEX( distrito, '-' , -1 ) AS NombreDistrito
FROM candidatura_diputado WHERE clave_elector = '".$clave_electores."' ");
    $stmtUsus->execute();

    $candidatosUsus = $stmtUsus -> fetch(PDO::FETCH_ASSOC);
    $filass = array(
      "NumDistrito" => utf8_encode($candidatosUsus["NumDistrito"]),
            "NombreDistrito" => utf8_encode($candidatosUsus["NombreDistrito"]),

      "datos" => 2
      );

     $str = $DB_con->prepare("SELECT * FROM registro WHERE clave_original =  '".$clave_elector."'AND tipo_doc ='RSCARGO' ORDER BY id DESC LIMIT 1 ");
     $str->execute();
      $hola = $str -> fetch(PDO::FETCH_ASSOC);
      $aaa = array(
         "id" => utf8_encode($hola["id"]),
          "has" => utf8_encode($hola["has"]),

         "datos" => 2
      );

  $clave_elector = $_GET["name"];


class PDF extends FPDF
{

//Pie de página
function Footer()
{
	// Ex-Fábrica San Manuel S/N, Col. Barrio Nuevo C.P.90640, San Miguel Contla, Santa Cruz Tlaxcala. 01 (246) 4650340

$this->SetY(-20);

$this->SetFont('Arial','I',8);

// $this->MultiCell(180,6, utf8_decode('',0,0,'C'));
$this->MultiCell(180,6, utf8_decode('Ex-Fábrica San Manuel S/N, Col. Barrio Nuevo C.P.90640, San Miguel Contla, Santa Cruz Tlaxcala. 01 (246) 4650340'),0,'R', 0 );
   }
}

//Creación del objeto de la clase heredada
 $pdf = new PDF();
//  header("Content-Type: text/html; charset=iso-8859-1 ");
  $pdf->AddPage();
  $pdf->SetFont('Arial','B',11);
	$pdf-> Cell(100,80, ''.utf8_decode($fila['nombre']).' '.utf8_decode($fila['apellido_paterno']).' '.utf8_decode($fila['apellido_materno']).'');
	$pdf->Image('../assets/img/logoite.png',130,10,-300);
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
	$pdf->MultiCell(180,6, utf8_decode('Por medio del presente escrito y en cumplimiento con los artículos 35, párrafo segundo de la Constitución Política del Estado Libre y Soberano de Tlaxcala, 152 fracción IV y 155 párrafo segundo de la Ley de Instituciones y Procedimientos Electorales para el Estado de Tlaxcala, me permito requerirle al C.'.$fila['nombre'].' '.$fila['apellido_paterno'].' '.$fila['apellido_materno'].' para ser registrado como candidato para el cargo de Diputado (a) Local con carácter de '.$fila['propietario_suplente'].' por el principio de MAYORÍA RELATIVA en el Distrito Electoral '.utf8_decode($filass['NumDistrito']).' con cabecera en '.utf8_decode($filass['NombreDistrito']).' del Estado de Tlaxcala, CONSTANCIA DE SOLICITUD DE SEPARACIÓN DEL CARGO O FUNCIÓN PÚBLICA, misma que deberá ser entregada a esta autoridad administrativa electoral, hasta antes del día dos de mayo del dos mil dieciocho, lo anterior por ser necesaria para la procedencia de su registro, dentro del Proceso Electoral Local Ordinario 2018.'),0,'J', 0 );
	$pdf->Ln(10);
	$pdf->SetFont('Arial','',12);
	$pdf->MultiCell(180,6, utf8_decode('Sin otro particular, reciba un cordial saludo.') );
	$pdf->Ln(10);
	$pdf->SetFont('Arial','B',12);
	  $pdf->Text(80,225,utf8_decode('A T E N T A M E N T E'));
  $pdf->Image('../assets/img/image.png',85,225,-200);
  $pdf->Ln(10);
  $pdf->SetFont('Arial','',10);
  $pdf->Text(15,230,utf8_decode('Ex Fábrica de San Manuel s/n San Miguel Contla, Santa Cruz Tlaxcala, Tlaxcala, a '.date('d').' de Marzo de 2018') ,0,'C', 0);
  $pdf->Ln(8);
  $pdf->SetFont('Arial','B',10);
  $pdf->Text(65,260,utf8_decode('XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') );
  $pdf->Text(45,265,utf8_decode('CONSEJERO/A PRESIDENTE/A DEL INSTITUTO TLAXCALTECA') );
  $pdf->Text(85,270,utf8_decode('DE ELECCIONES') );

	$pdf->Text(10,290,utf8_decode('Clave-Unica: '.utf8_decode($aaa['has']).' '));

$pdf->Output();



  } else {
    $fila = array('datos' => 3);
  }
  // echo json_encode($fila);
 ?>
