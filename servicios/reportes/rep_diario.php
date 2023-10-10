<?php
	require '../fpdf/fpdf.php';

  require_once '../../controladores/conndb.php';
  // $db = new PDO('mysql:host=localhost;dbname=reg2018_bd','root','pelo2018');

/**
*
*/
class myPDF extends FPDF
{

function header(){
   if ($this->page == 1)
          {
  $this->Image('../../assets/img/logoite.png',200,10,-300);
  $this->SetFont('Arial','B',14);
  $this->Ln(10);
  $this->Cell(246,5,'INSTITUTO TLAXCALTECA DE ELECCIONES',0,0,'C');
  $this->Ln(20);
}
}
function footer(){
  $this->SetY(-15);
  $this->SetFont('Arial','',10);
  $this->Cell(0,10,'Page'.$this->PageNo( ). ' /{nb}',0,0,'C');
}
    //Cell with horizontal scaling if text is too wide
    function CellFit($w, $h=0, $txt='', $border=0, $ln=0, $align='', $fill=false, $link='', $scale=false, $force=true)
    {
        //Get string width
        $str_width=$this->GetStringWidth($txt);

        //Calculate ratio to fit cell
        if($w==0)
            $w = $this->w-$this->rMargin-$this->x;        
        $ratio = ($w-$this->cMargin*2)/$str_width;


        $fit = ($ratio < 1 || ($ratio > 1 && $force));
        if ($fit)
        {
            if ($scale)
            {
                //Calculate horizontal scaling
                $horiz_scale=$ratio*100.0;
                //Set horizontal scaling
                $this->_out(sprintf('BT %.2F Tz ET',$horiz_scale));
            }
            else
            {
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
        if ($fit)
            $this->_out('BT '.($scale ? '100 Tz' : '0 Tc').' ET');
    }
    // Cell with horizontal scaling only if necessary
    function CellFitScale($w, $h=0, $txt='', $border=0, $ln=0, $align='', $fill=false, $link='')
    {
        $this->CellFit($w,$h,$txt,$border,$ln,$align,$fill,$link,true,false);
    }
        //Cell with character spacing only if necessary
    function CellFitSpace($w, $h=0, $txt='', $border=0, $ln=0, $align='', $fill=false, $link='')
    {
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
  $this->Cell(15,10,utf8_decode('Día'),1,0,'C','true');
  $this->Cell(45,10,utf8_encode('Nombre'),1,0,'C','true');
  $this->Cell(39,10, utf8_decode('Clave Elector'),1,0,'C','true');
  $this->Cell(40,10, utf8_decode('Partido Político'),1,0,'C','true');
  $this->Cell(38,10, utf8_decode('Candidatura'),1,0,'C','true');
  $this->Cell(30,10, utf8_decode('Distrito/Municipio'),1,0,'C','true');
  $this->Cell(20,10,utf8_decode('Género'),1,0,'C','true');
  $this->Cell(20,10, utf8_decode('Estado'),1,0,'C','true');
  $this->Ln();
}
function viewTable($DB_con){

    $this->SetFont('Arial','',7);
    $fecha = $_GET["fecha"];
    $query_str = "CALL rep_diario( '$fecha' )";
    $stmt = $DB_con->prepare($query_str);
    $stmt->execute();

    $res = $stmt->get_result();

  $contador=0;
  while($data = $res->fetch_assoc()){
    // $this->SetDrawColor(0,0,255);
    // $this->SetTextColor(0,0,0);
    $this->SetFillColor( 154, 23, 211 );
        // $this->SetTextColor(85,107,47);
    $this->SetTextColor( 21, 3, 28 );
    $this->CellFitScale(10,10,$contador+1, 1,0,'C');
    $this->CellFitScale(15,10,utf8_decode($data['dia']),1,0,'C');
    $this->CellFitScale(45,10,utf8_decode($data['nombre_clv']),1,0,'C');
    $this->CellFitScale(39,10,utf8_decode($data['clv_original']),1,0,'C');
    $this->CellFitScale(40,10,utf8_decode($data['partido']),1,0,'C');
    $this->CellFitScale(38,10,utf8_decode($data['nombre_candidatura']),1,0,'C');
    $this->CellFitScale(30,10,utf8_decode($data['distrito']),1,0,'C'); 
    $this->CellFitScale(20,10,utf8_decode($data['genero']),1,0,'C');

    // $this->CellFitScale(45,10,$data->prelacion,1,1,'C');
    $this->CellFitScale(20,10,$data['estado'],1,1,'C');
     $contador++;

  }




}

}

// $partido_parametro = $_GET["partido"];
//    if ($partido_parametro == 'Candidatura Comun PRI - PVEM - PS'){
//           $partido_parametro = 'Candidatura Común PRI - PVEM - PS';

//     }else if($partido_parametro == 'Candidatura Comun PRI - PVEM - NA - PS'){
//        $partido_parametro = 'Candidatura Común PRI - PVEM - NA - PS';

//     }else if ( $partido_parametro == 'Coalicion Por Tlaxcala al Frente (PAN/PRD/Movimiento Ciudadano/PAC)'){
//        $partido_parametro = 'Coalición Por Tlaxcala al Frente (PAN/PRD/Movimiento Ciudadano/PAC)';

//    }else if( $partido_parametro == 'Coalicion Juntos Haremos Historia (MORENA/PT/PES)'){
//        $partido_parametro = 'Coalición Juntos Haremos Historia (MORENA/PT/PES)';
//     }



$pdf = new myPDF();
$pdf->AliasNbPages();
$pdf->AddPage('L','A4',0);

$pdf->headerTable();
$pdf->viewTable($DB_con);
$pdf->Output();

 ?>
