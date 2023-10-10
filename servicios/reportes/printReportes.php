<?php
	require '../fpdf/fpdf.php';

  require_once '../../controladores/conndb.php';
  $db = new PDO('mysql:host=localhost;dbname=reg2018_bd','root','');



  // $db = new PDO('mysql:host=localhost;dbname=reg2018_bd','root','pelo2018');

  class myPDF extends FPDF{

    public $tipo_eleccion = "TODOS";
    public $candidatura = "TODOS";
    public $distrito = "TODOS";
    public $partido = "TODOS";
    public $estado = "TODOS";
    public $genero = "TODOS";

    function getTipoElecion(){
      return $this->tipo_eleccion;
    }



    function header(){
      if ($this->page == 1){
        $this->Image('../../assets/img/logoite.png',200,10,-300);
        $this->SetFont('Arial','B',14);
        $this->Ln(10);
        $this->Cell(246,5,'INSTITUTO TLAXCALTECA DE ELECCIONES',0,0,'C');
        $this->Ln(50);
      }
    } 

    function footer(){
      $this->SetY(-15);
      $this->SetFont('Arial','',10);
      $this->Cell(0,10,'Page'.$this->PageNo( ). ' /{nb}',0,0,'C');
    }
      
    //Cell with horizontal scaling if text is too wide
    function CellFit($w, $h=0, $txt='', $border=0, $ln=0, $align='', $fill=false, $link='', $scale=false, $force=true){
          
      //Get string width
      $str_width=$this->GetStringWidth($txt);
      //Calculate ratio to fit cell
      
      if($w==0)
        $w = $this->w-$this->rMargin-$this->x;
      $ratio = ($w-$this->cMargin*2)/$str_width;

      $fit = ($ratio < 1 || ($ratio > 1 && $force));
      if ($fit) {
        if ($scale) {
          //Calculate horizontal scaling
          $horiz_scale=$ratio*100.0;
          //Set horizontal scaling
          $this->_out(sprintf('BT %.2F Tz ET',$horiz_scale));
        } else {
          //Calculate character spacing in points
          $char_space=($w-$this->cMargin*2-$str_width)/max($this->MBGetStringLength($txt)-1,1)*$this->k;
          //Set character spacing
          $this->_out(sprintf('BT %.2F Tc ET',$char_space));
        }
        //Override user alignment (since text will fill up cell)
        $align='';
      }

      //Pass on to Cell method
      $this->Cell($w,$h,$txt,$border,$ln,$align,$fill,$link);

      //Reset character spacing/horizontal scaling
      if ($fit){
        $this->_out('BT '.($scale ? '100 Tz' : '0 Tc').' ET');
      }
    }
    
    // Cell with horizontal scaling only if necessary
    function CellFitScale($w, $h=0, $txt='', $border=0, $ln=0, $align='', $fill=false, $link='') {
      $this->CellFit($w,$h,$txt,$border,$ln,$align,$fill,$link,true,false);
    }

    //Cell with character spacing only if necessary
    function CellFitSpace($w, $h=0, $txt='', $border=0, $ln=0, $align='', $fill=false, $link='') {
      $this->CellFit($w,$h,$txt,$border,$ln,$align,$fill,$link,false,false);
    }
    

    function headerTable(){
      $this->SetFillColor( 144, 5, 125 );
      // $this->SetTextColor(85,107,47);
      $this->SetTextColor( 241, 233, 244 );  // Establece el color del texto (en este caso es blanco)
      // $this->SetFillColor(100,100, 100);
      // $this->SetFillColor(150,25,0);
      // $this->SetDrawColor(0,0,255);
      // $this->SetTextColor(0,255,0);
      $this->SetFont('Arial','B',8);
      $this->Cell(10,10,utf8_encode('No.'),1,0,'C','true');
      $this->Cell(56,10,utf8_encode('Nombre'),1,0,'C','true');
      $this->Cell(39,10, utf8_decode('Tipo Elección'),1,0,'C','true');
      $this->Cell(19,10, utf8_decode('Candidatura'),1,0,'C','true');
      $this->Cell(34,10, utf8_decode('Clave Elector'),1,0,'C','true');
      $this->Cell(17,10, utf8_decode('Estado'),1,0,'C','true');
      $this->Cell(35,10, utf8_decode('Distrito'),1,0,'C','true');
      $this->Cell(20,10,utf8_decode('Género'),1,0,'C','true');
      $this->Cell(45,10, utf8_decode('Partido Pólitico'),1,0,'C','true');
      $this->Ln();
    }
    

    function getNames(){
      $this->tipo_eleccion = $_GET['tipo_eleccion'];
      $this->origen = $_GET['distrito'];
      $this->partido = $_GET['partido'];
      $this->candidatura = $_GET['tipo_candidatura'];
      $this->estado = $_GET['estado'];
      $this->genero = $_GET['genero'];
      $this->municipio = $_GET['municipio'];
    }


    function consulta($DB_con){

      $tipo_eleccionP = $_GET['tipo_eleccion'];
      $origenP = $_GET['distrito'];
      $partidoP = $_GET['partido'];
      $tipo_candidaturaP = $_GET['tipo_candidatura'];
      $estadoP = $_GET['estado'];
      $generoP = $_GET['genero'];
      $municipioP = $_GET['municipio'];


      $query_str = "CALL getInfoReportes( '$tipo_eleccionP', '$origenP', '$partidoP', '$tipo_candidaturaP', '$estadoP', '$generoP', '$municipioP')";
      $stmt = $DB_con -> prepare($query_str);
      $stmt -> execute();
      $res = $stmt->get_result();


      while($data = $stmt->fetch_assoc()){      
        $datos []= $data;
      }
      $this->tipo_eleccion = $this->tipo_eleccion != 'Todos' ? $datos[0]->nombre_candidatura : $this->tipo_eleccion;
      $this->origen = $this->origen != 'Todos' ? $datos[0]->nombre_distrito : $this->origen;
      $this->partido = $this->partido != 'Todos' ? $datos[0]->nombre_partido_politico : $this->partido;
      $this->candidatura = $this->candidatura != 'Todos' ? $datos[0]->propietario_suplente : $this->candidatura;
      $this->estado = $this->estado != 'Todos' ? $datos[0]->estado : $this->estado;
      $this->genero = $this->genero != 'Todos' ? $datos[0]->genero : $this->genero;
      $this->municipio = $this->municipio != 'Todos' ? $datos[0]->nombre_candidatura : $this->municipio;
      

      return $datos;
    
    }


    function viewTable($stmt){
      $this->SetFont('Arial','',7);
      $contador=0;

      foreach( $stmt as $data ){
        // $this->SetDrawColor(0,0,255);
        // $this->SetTextColor(0,0,0);
        $this->SetFillColor( 154, 23, 211 );
        // $this->SetTextColor(85,107,47);
        $this->SetTextColor( 21, 3, 28 );
        $this->CellFitScale(10,10,$contador+1, 1,0,'C');
        $this->CellFitScale(56,10,utf8_decode($data->nombre.' '.$data->apellido_paterno.' '.$data->apellido_materno),1,0,'C');
        $this->CellFitScale(39,10, utf8_decode($data->nombre_candidatura),1,0,'C');
        $this->CellFitScale(19,10,$data->propietario_suplente,1,0,'C');
        $this->CellFitScale(34,10,$data->clave_elector,1,0,'C');
        $this->CellFitScale(17,10, utf8_decode($data->estado),1,0,'C');
        $this->CellFitScale(35,10, utf8_decode($data->nombre_distrito) ,1,0,'C');
        $this->CellFitScale(20,10,$data->genero,1,0,'C');
        $this->CellFitScale(45,10,utf8_decode($data->nombre_partido_politico),1,1,'C');
        $contador++;
      }

    }
  }

  

  
  

  
  $pdf = new myPDF();  
  $pdf->getNames();  
  $consulta = $pdf->consulta($DB_con);

  
  $pdf->AliasNbPages();
  $pdf->AddPage('L','A4',0);
  $pdf->SetFont('Arial','B',15);
  $pdf->Text(100,45,utf8_decode('Parámetros de Búsqueda'));
  $pdf->SetFont('Arial','',12);
  $pdf->Text(10,55,utf8_decode('Partido Pólitico/Coalición/Independiente:'));
  $pdf->SetFont('Arial','B',12);
  $pdf->Text(90,55,utf8_decode(''.$pdf->partido.''));
  $pdf->SetFont('Arial','',12);
  $pdf->Text(10,62,utf8_decode('Distrito:'));
  $pdf->SetFont('Arial','B',12);
  $pdf->Text(27,62,utf8_decode(''.$pdf->origen.''));
  $pdf->SetFont('Arial','',12);
  $pdf->Text(90,62,utf8_decode('Tipo de Elección:'));
  $pdf->SetFont('Arial','B',12);
  $pdf->Text(126,62,utf8_decode(''. $pdf->tipo_eleccion .''));
  $pdf->SetFont('Arial','',12);
  $pdf->Text(205,62,utf8_decode('Tipo de Candidatura: '));
  $pdf->SetFont('Arial','B',12);
  $pdf->Text(248,62,utf8_decode(''.$pdf->candidatura.''));
  $pdf->SetFont('Arial','',12);
  $pdf->Text(10,69,utf8_decode('Estado: '));
  $pdf->SetFont('Arial','B',12);
  $pdf->Text(27,69,utf8_decode(''.$pdf->estado.''));
  $pdf->SetFont('Arial','',12);
  $pdf->Text(90,69,utf8_decode('Género:'));
  $pdf->SetFont('Arial','B',12);
  $pdf->Text(108,69,utf8_decode(''.$pdf->genero.''));  
  
  $pdf->headerTable();
  $pdf->viewTable($consulta);
  $pdf->Ln(3);
  $pdf->Output();
 ?>
