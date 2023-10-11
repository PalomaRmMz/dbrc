<?php
	require '../../fpdf/fpdf.php';
	require_once '../../../controladores/conndb.php';

	date_default_timezone_set('America/Mexico_city');


    $clave_elector = $_GET["name"];
	$candidatura = $_GET["candidatura"];
	
	setlocale(LC_TIME, 'spanish');

	$año = date("Y");
	$mes = strftime("%B");

  	$stmt = $DB_con->prepare("
      SELECT
      candidatura_comunidad.nombre,
      candidatura_comunidad.apellido_paterno,
      candidatura_comunidad.apellido_materno,
      tipo_eleccion.nombre as candidatura,
      partidos_politicos.nombre_partido as partido_politico,
      candidatura_comunidad.fec_nacimiento,
      candidatura_comunidad.genero,
      candidatura_comunidad.clave_elector,
      candidatura_comunidad.propietario_suplente,
      candidatura_comunidad.curp,
      candidatura_comunidad.tiempo_residencia,
      candidatura_comunidad.sobrenombre,
      candidatura_comunidad.user_capturista,
	  comunidades.nombre_comunidad
    FROM candidatura_comunidad, tipo_eleccion, partidos_politicos, comunidades
    WHERE clave_elector = '$clave_elector' AND candidatura = $candidatura
    AND candidatura_comunidad.candidatura = tipo_eleccion.id_eleccion
    AND candidatura_comunidad.partido_politico = partidos_politicos.id_partido
	AND candidatura_comunidad.id_comunidad = comunidades.id_comunidad 
    ");
	$stmt->execute();
	$res = $stmt->get_result();

	if($res ->num_rows < 1 ) {

		$fila = array("datos" => 1);
	
	} else if ($res ->num_rows == 1) {

		$candidatos = $res ->fetch_assoc();
	
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
		"propietario_suplente" => mb_strtoupper($candidatos["propietario_suplente"]),
		"tiempo_residencia" => $candidatos["tiempo_residencia"],
		"sobrenombre" => $candidatos["sobrenombre"],
		"user_capturista" => $candidatos["user_capturista"],
		"nombre_comunidad" => $candidatos["nombre_comunidad"],
		"datos" => 2
		);

		if($fila['partido_politico']=='Movimiento Ciudadano' || $fila['partido_politico']=='Morena' 
		|| $fila['partido_politico']=='Redes Sociales Progresistas' || $fila['partido_politico']=='Fuerza Social por México' 
		|| $fila['partido_politico']=='Nueva Alianza Tlaxcala' || $fila['partido_politico']=='Encuentro Social Tlaxcala'
		|| $fila['partido_politico']=='Impacto Social SI')
		{
			$item1='PARTIDO';
			$fila['partido_politico']=$item1.' '.$fila['partido_politico'];
			
		}


    	$strs = $DB_con->prepare("SELECT * FROM candidatura_documentado WHERE clave_elector =  '".$clave_elector."' AND id_tipo_registro = $candidatura");
		$strs->execute();
		$res = $strs->get_result();

		$holas = $res->fetch_assoc();
		$aaa = array(
			"const_separacion_cargo" => $holas["const_separacion_cargo"],
			"datos" => 2
		);

    	$capturista = $_GET["user"];

    	$clave_usuario = md5($capturista);
  		// $capturista =  'amelia';
 		$stmtUsu = $DB_con->prepare("SELECT nombre_capturista, app_capturista, apm_capturista FROM usuarios WHERE usuario = '".$capturista."' ");
    	$stmtUsu->execute();
		$res = $stmtUsu->get_result();
    	$candidatosUsu = $res->fetch_assoc();
    	$filas = array(
      		"nombre_capturista" => $candidatosUsu["nombre_capturista"],
      		"app_capturista" => $candidatosUsu["app_capturista"],
      		"apm_capturista" => $candidatosUsu["apm_capturista"],
      		"datos" => 2
      	);

		  $has = md5(date("H:i:s"));
		  $tipoDoc = "cvC";
		  $datos = array(
			$tipoDoc,
			$candidatos["user_capturista"],
			$candidatosUsu["nombre_capturista"],
			$candidatosUsu["app_capturista"],
			$candidatosUsu["apm_capturista"],
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
			function Header(){
				$this->SetY(8);
				$this->SetFont('Arial','I',6.5);

				$this->Cell(190,45,utf8_decode(' "'.date("Y").', Centenario de la Constitución Política del estado Libre y Soberano de Tlaxcala" '),0,'R', 0);
				$this->Image('../../../assets/img/logoite.png',130,10,-400);

				$this->Ln(3);
			}
			//Pie de página
			function Footer()
			{
			// Ex-Fábrica San Manuel S/N, Col. Barrio Nuevo C.P.90640, San Miguel Contla, Santa Cruz Tlaxcala. 01 (246) 4650340

			$this->SetY(-15);
			$this->SetFont('Arial','I',6.5);

			// $this->MultiCell(180,6, utf8_decode('',0,0,'C'));
			$this->MultiCell(180,3, utf8_decode('Ex-Fábrica San Manuel S/N, Col. Barrio Nuevo C.P.90640, San Miguel Contla Santa Cruz Tlaxcala. 01 (246) 4650340'),0,'C', 0 );
			// $tDate=date('d.m.Y');
			}
		}


		$pdf = new PDF();

		$pdf->AddPage();
		$pdf->SetFont('Arial','B',11);
		$pdf->Image('../../../assets/img/logoite.png',130,10,-400);
		$pdf->Ln(2);
		$pdf->SetFont('Arial','B',10);
		
		$pdf->Text(11,42,utf8_decode('FOLIO ' .utf8_decode($aaa['id']).''));
		$pdf->Ln(2);
		$pdf->SetFont('Arial','',6.5);
		$pdf->Text(160,37,utf8_decode('Asunto: Informe de Revisión'));
		$pdf->Ln(38);
		$pdf->SetFont('Arial','B',6.5);
		$pdf->Text(11,46,utf8_decode('INTEGRANTES DE LA COMISIÓN TEMPORAL DE REGISTRO') );
		$pdf->Text(11,49,utf8_decode('DE CANDIDATURAS Y BOLETAS ELECTORALES.') );
		$pdf->Text(11,52,utf8_decode('P R E S E N T E S') );


		$pdf->Ln(4);
		$pdf->SetFont('Arial','',7);
		$pdf->MultiCell(180,3, utf8_decode('Quien suscribe, C. '.$filas['nombre_capturista'].' '.$filas['app_capturista'].' '.$filas['apm_capturista'].', auxiliar electoral, una vez revisada la solicitud de registro de candidatura al cargo de TITULAR DE LA PRESIDENCIA DE COMUNIDAD DE '.strtoupper($fila['nombre_comunidad']).', del(la) ciudadano(a) '.$fila['nombre'].' '.$fila['apellido_paterno'].' '.$fila['apellido_materno'].', con clave de elector '.utf8_decode($fila['clave_elector']).', en carácter de '.utf8_decode($fila['propietario_suplente']).' que presenta el '.mb_strtoupper($fila['partido_politico']).' para la elección  de dicho cargo dentro del Proceso Electoral Local Extraordinario '.date("Y").' del Estado de Tlaxcala, así como la documentación que anexa para dar cumplimiento a lo que establece la ley en materia, de conformidad con los artículos 88 y 89 de la Constitución Política del Estado Libre y Soberano de Tlaxcala; 150, 151 y 152 de la Ley de Instituciones y Procedimientos Electorales para el Estado de Tlaxcala; remito a usted los resultados de la revisión en los siguientes términos:'),0,'J', 0 );
		$pdf->Ln(3);
		// $pdf->SetFont('Arial','B',7.5);
		// $pdf->Cell(13.5,3,utf8_decode('Primero:') );
		$pdf->SetFont('Arial','',7);
		$pdf->MultiCell(165,4, utf8_decode('Primero: Los documentos que se presentan para dar trámite al registro como candidato(a) son los siguientes:'),0,'J', 0 );
		$pdf->Ln(1);
		$pdf->SetFont('Arial','',7);
		$pdf->Cell(70,3,utf8_decode(' -           Documento emitido por el SNR del INE;') );
		$pdf->Ln(1);
		$pdf->Cell(70,6,utf8_decode(' -           Solicitud de registro;') );
		$pdf->Ln(1);
		$pdf->Cell(70,9,utf8_decode(' -           Credencial para votar;') );
		$pdf->Ln(1);
		$pdf->Cell(70,12,utf8_decode(' -           Copia Certificada del acta de nacimiento;') );
		$pdf->Ln(1);
		$pdf->Cell(70,15,utf8_decode(' -           Constancia de residencia;') );
		$pdf->Ln(1);
		$pdf->Cell(70,18,utf8_decode(' -           Constancia de aceptación de postulación;') );
		$pdf->Ln(1);
		$pdf->Cell(70,21,utf8_decode(' -           Constancia de separación del cargo o función pública;') );
		$pdf->Ln(1);
		$pdf->Cell(70,24,utf8_decode(' -           Escrito bajo protesta de decir verdad, que no se encuentra inhabilitado para ocupar un cargo público.') );
		$pdf->Ln(1);
		$pdf->Cell(70,27,utf8_decode(' -           Carta de no antecedentes penales.') );
		$pdf->Ln(1);
		$pdf->Cell(70,30,utf8_decode(' -           A4E Manifestación de partido político.') );
		$pdf->Ln(1);
		$pdf->Cell(70,33,utf8_decode(' -           Informe de capacidad económica.') );
		$pdf->Ln(1);
		$pdf->Cell(70,36,utf8_decode(' -           Cédula de identificación fiscal.') );

		$pdf->Ln(25);
		// $pdf->SetFont('Arial','B',7.5);
		// $pdf->Cell(13.5,3,utf8_decode('Segundo:') ,0,'J', 0);
		$pdf->SetFont('Arial','',7);
		$pdf->MultiCell(165,4, utf8_decode('Segundo: El documento emitido por el SNR del INE, cumple con lo previsto en los Acuerdos ITE-CG-64/2020 e ITE-CG 281/2021, aprobados por el Consejo General de este Instituto.'),0,'J', 0 );

		$pdf->Ln(2);
		// $pdf->SetFont('Arial','B',7.5);
		// $pdf->Cell(12,3,utf8_decode('Tercero:') ,0,'J', 0);
		$pdf->SetFont('Arial','',7);
		$pdf->MultiCell(165,3, utf8_decode('Tercero: La solicitud de registro se recibió el '.date('d').', del mes de '.$meses[date('n')].', a las '.date('H:i:s').' horas, por tanto se encuentra dentro del plazo previsto en el artículo 287 de la Ley de Instituciones y Procedimientos Electorales para el Estado de Tlaxcala y el Calendario Electoral para el Proceso Electoral Extraordinario 2021 aprobado mediante el Acuerdo ITE-CC 279/2021.'),0,'J', 0 );
		$pdf->Ln(2);
		$pdf->SetFont('Arial','',7);
		$pdf->MultiCell(165,3,utf8_decode('Asimismo, cumple con lo previsto en el artículo 151 de la Ley de Instituciones y Procedimientos Electorales para el Estado de Tlaxcala, en atención a que la solicitud de registro enuncia los siguientes datos:') ,0,'J', 0);
		$pdf->Ln(1);
		$pdf->SetFont('Arial','',7);
		$pdf->Cell(70,8,utf8_decode(' -           Nombre y Apellido.') );
		$pdf->Ln(1);
		$pdf->Cell(70,12,utf8_decode(' -           Lugar y Fecha de nacimiento, edad, domicilio, y tiempo de residencia en el mismo;') );
		$pdf->Ln(1);
		$pdf->Cell(70,16,utf8_decode(' -           Cargo para el que se postula') );
		$pdf->Ln(1);
		$pdf->Cell(70,20,utf8_decode(' -           Ocupación.') );
		$pdf->Ln(1);
		$pdf->Cell(70,24,utf8_decode(' -           Clave de la credencial para votar.') );
		$pdf->Ln(0);
		$pdf->Ln(17);
		// $pdf->SetFont('Arial','B',7);
		// $pdf->Cell(11,3,utf8_decode('Caurto:') ,0,'J', 0);
		$pdf->SetFont('Arial','',7);
		$pdf->MultiCell(180,3, utf8_decode('Cuarto: Derivado a la revisión completa del nombre y apellidos del(la) ciudadano(a) que se asienta, se concluye que se trata de la misma persona que aparece en la credencial para votar presentada, cumple con lo previsto en los Acuerdos ITE-CG 64/2020 e ITE-CG 281/2021, aprobado por el Consejo General de este Instituto.'),0,'J', 0 );
		$pdf->Ln(2);
		$pdf->SetFont('Arial','',7);
		$pdf->MultiCell(180,3, utf8_decode('Quinto: De la revisión realizada a su acta de nacimiento, además de la constancia de residencia expedida por la o el Secretario de Ayuntamiento o Presidente(a) de Comunidad, se concluye que el(la) ciudadano(a) acredita la nacionalidad mexicana y la ciudadanía tlaxcalteca en términos del artículo 10 de la Constitución Política del Estado Libre y Soberano de Tlaxcala, igualmente, acreditando en el acto, la residencia efectiva de '.$fila['tiempo_residencia'].' años en el Estado de Tlaxcala, colmado así, los extremos del requisito  establecido en el artículo 88 de la Constitución Local.'),0,'J', 0 );
		$pdf->Ln(2);
		$pdf->SetFont('Arial','',7);
		$pdf->MultiCell(180,3, utf8_decode('Sexto: De conformidad con los artículos 34 y 35 en la Constitución Política de los Estados Unidos Mexicanos; son ciudadanos de la República las personas que teniendo calidad de mexicanos hayan cumplido dieciocho años y tengan un modo honesto de vivir, mismos que cumpliendo con las calidades que establezca la ley, gozarán de la prerrogativa de ser votados. De tal manera y según consta en la solicitud de registro del ciudadano(a), por el cual se presume que cumple con los requisitos de elegibilidad previstos en los artículos señalados.'),0,'J', 0 );
		$pdf->Ln(2);
		$pdf->SetFont('Arial','',7);
		$pdf->MultiCell(180,3, utf8_decode('Séptimo: Presenta constancia de aceptación de la postulación con los requisitos previstos en el artículo 152, fracción III, de la Ley de Instituciones y Procedimientos Electorales para el Estado de Tlaxcala.'),0,'J', 0 );
		$pdf->Ln(2);
		$pdf->SetFont('Arial','',7);
		$pdf->MultiCell(180,3, utf8_decode('Octavo: En observancia del artículo 89 de la Constitución Local, se exhibe documento que acredita su separación del cargo '.utf8_decode($holas['const_separacion_cargo']).'.'),0,'J', 0 );
		$pdf->Ln(2);
		$pdf->SetFont('Arial','',7);
		$pdf->MultiCell(180,3, utf8_decode('Noveno: Si presenta constancia de no antecedentes penales, así como el escrito bajo protesta de decir la verdad que no se encuentra inhabilitado para ocupar un cargo público. En consecuencia, se presume que el(la) ciudadano(a) no se encuentra imposibilitado(a) para ocupar el cargo de Titular de Presidencia de Comunidad en términos del artículo 89 de la Constitución Política Local, 152 fracción IV de la Ley de Instituciones y Procedimientos Electorales para el Estado de Tlaxcala.'),0,'J', 0 );
		$pdf->Ln(2);
		$pdf->SetFont('Arial','',7);
		$pdf->MultiCell(180,3, utf8_decode('Decimo: De la revisión realizada a todos los documentos citados, se advierte que el(la) cuidadano(a) da cumplimiento a cada uno de los requisitos enlistados en los artículos 88 y 89 de la Constitución Política del estado Libre y Soberano de Tlaxcala.'),0,'J', 0 );
		$pdf->Ln(2);
		$pdf->SetFont('Arial','',7);
		$pdf->MultiCell(180,3, utf8_decode('En espera de su revisión y aprobación, quedo de usted.'),0,'J', 0 );



		$pdf->Ln(4);
		$pdf->SetFont('Arial','B',7);
		$pdf->Text(90,252,utf8_decode('A T E N T A M E N T E'),0,'C', 0);
		$pdf->Ln(5);
		$pdf->SetFont('Arial','',7);
		$pdf->MultiCell(180,5,utf8_decode('Ex Fábrica de San Manuel s/n San Miguel Contla, Santa Cruz Tlaxcala, Tlaxcala, a '.date('d').' de '.$meses[date('n')].' de '.date("Y").' ') ,0,'C', 0);
		$pdf->Ln(3);
		$pdf->SetFont('Arial','B',7);
		$pdf->Text(88,263,utf8_decode('Mesa de captura de datos'),0,'C', 0 );
		$pdf->Ln(7);
		$pdf->SetFont('Arial','',7);
		$pdf->MultiCell(185,5,utf8_decode('C.'.$filas['nombre_capturista'].' '.$filas['app_capturista'].' '.$filas['apm_capturista'].' ') ,0,'C', 0);
		$pdf->SetFont('Arial','I',9);

		$pdf->Text(10,290,utf8_decode('Clave-Única: '.$fila['has'].' '));
		//utf8_decode($fila['nombre'])
		$pdf->Output();
		
  	} else {

	$fila = array('datos' => 3);
	
  }
  // echo json_encode($fila);
 ?>
