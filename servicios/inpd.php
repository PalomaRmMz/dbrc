<?php
	require './fpdf/fpdf.php';

require_once '../controladores/conndb.php';


	// $clave= $_POST['clave_elector'];
	$stmt = $DB_con->prepare("SELECT * FROM candidatura_diputado where clave_elector =  'ABCD123'");
	// $regresaClave = mysql_query($buscaClave);
	$stmt->execute();




	 if ($stmt->rowCount() < 1 ) {
    $fila = array("datos"=>1);
    $respuesta = $fila;
  } else if ($stmt->rowCount() == 1) {
    for ($i=0; $i < $stmt->rowCount() ; $i++) {
      $usuarios = $stmt->fetch(PDO::FETCH_ASSOC);
      $fila = array("nombre"=>utf8_encode($usuarios["nombre"]),
      	"apellido_paterno"=>utf8_encode($usuarios["apellido_paterno"]),
      	"apellido_materno"=>utf8_encode($usuarios["apellido_materno"]),
         "partido_politico"=>utf8_encode($usuarios["partido_politico"]),
      	"distrito"=>utf8_encode($usuarios["distrito"]),
         "propietario_suplente"=>utf8_encode($usuarios["propietario_suplente"]),


         "datos"=>2);

         $respuesta = $fila;
    }
  } else {
    $fila = array('datos' => 3);
    $respuesta = $fila;
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
$pdf=new PDF();
// $pdf->AddPage();
$pdf->SetFont('Times','',12);
//Aquí escribimos lo que deseamos mostrar
// $pdf->Output();

	// $pdf = new FPDF();
//	header("Content-Type: text/html; charset=iso-8859-1 ");
	$pdf->AddPage();
	$pdf->SetFont('Arial','B',11);
	$pdf-> Cell(100,80, 'C.'.utf8_decode($fila['nombre']).' '.utf8_decode($fila['apellido_paterno']).' '.utf8_decode($fila['apellido_materno']).'');
	$pdf->Image('../assets/img/logoite.png',130,10,-300);
	$pdf->Ln(5);
	$pdf->SetFont('Arial','',10);
    $pdf->Text(150,40,utf8_decode('Asunto: Requerimiento'));
    $pdf->Ln(40);
	$pdf->SetFont('Arial','B',10);
    $pdf->Cell(100,0,utf8_decode('ASPIRANTE A CANDIDATO INDEPENDIENTE'));
	$pdf->Ln(6);
	$pdf->SetFont('Arial','',10);
    $pdf->Cell(100,0,'P R E S E N T E');

	$pdf->Ln(8);
	$pdf->SetFont('Arial','',11);
	$pdf->MultiCell(180,6, utf8_decode('De la revisión efectuada a la documentación que anexo a la solicitud de registro el C.'.utf8_decode($fila['nombre']).' '.utf8_decode($fila['apellido_paterno']).' '.utf8_decode($fila['apellido_materno']).' que presentó ante este Consejo General para ser registrado como candidato al cargo de Diputado ' .utf8_decode($fila['propietario_suplente']).' por el Distrito Electoral ' .utf8_decode($fila['distrito']).' el Estado de Tlaxcala en ejercicio de las atribuciones que me confieren los artículos 62 fracción I y XIX, y 153 de la Ley de Instituciones y Procedimientos Electorales para el Estado de Tlaxcala, me permito comunicarle que una vez realizado el análisis de la información y documentación remitida por Usted, se identificó que se omitió el cumplimiento del (los) requisito (s) siguiente (s):'),0,'J', 0 );

	$pdf->Ln(20);
	$pdf->SetFont('Arial','',11);
	$pdf->MultiCell(180,6, utf8_decode('En tal virtud, con fundamento en el articulo 155, párrafo segundo de la Ley de Instituciones y Procedimientos Electorales para el Estado de Tlaxcala; se le requiere para que a más tardar dentro de las 48 horas, contadas partir de la notificación de presente, subsane los requisitos omitidos.') ,0,'J', 0);
	$pdf->Ln(8);
	$pdf->SetFont('Arial','',11);
	$pdf->MultiCell(180,6, utf8_decode('Lo anterior, apercibido (a) de que, en caso de incumplimiento al presente requerimiento dentro del término señalado, aplicará lo previsto por el artículo 154 de la Ley en cita.'),0,'J', 0 );
		$pdf->Ln(8);
	$pdf->SetFont('Arial','',11);
	$pdf->MultiCell(180,6, utf8_decode('Sin otro particular, reciba un coordial saludo.') );
	$pdf->Ln(8);
	$pdf->SetFont('Arial','B',11);
	$pdf->Text(80,200,utf8_decode('A T E N T A M E N T E'),0,'C', 0);
	$pdf->Ln(10);
	$pdf->SetFont('Arial','',11);
	$pdf->MultiCell(180,6,utf8_decode('Ex Fábrica de San Manuel s/n San Miguel Contla, Santa Cruz Tlaxcala, Tlaxcala, a ___________ de Marzo de 2018') ,0,'C', 0);
	$pdf->Ln(8);
	$pdf->SetFont('Arial','B',11);
	$pdf->Text(65,240,utf8_decode('XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') );
	$pdf->Text(45,245,utf8_decode('CONSEJERO/A PRESIDENTE/A DEL INSTITUTO TLAXCALTECA') );
	$pdf->Text(85,250,utf8_decode('DE ELECCIONES') );

	$pdf->Output();

?>
