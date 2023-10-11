<?php
	require './fpdf/fpdf.php';

  require_once '../controladores/conndb.php';
  // $db = new PDO('mysql:host=localhost;dbname=reg2018_bd','root','pelo2018');

/**
*
*/
class myPDF extends FPDF
{

function header(){
   if ($this->page == 1)
          {
  $this->Image('../assets/img/logoite.png',200,10,-300);
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
  $this->Cell(30,10, utf8_decode('Distrito'),1,0,'C','true');
  $this->Cell(20,10,utf8_decode('Género'),1,0,'C','true');
  $this->Cell(20,10, utf8_decode('Estado'),1,0,'C','true');
  $this->Ln();
}
function viewTable($DB_con){
  $this->SetFont('Arial','',7);


 $fecha = $_GET["fecha"];
  $query_str = "
  SELECT 
  h.dia,
  h.nombre_clv,
  h.clv_original,
  combinaciones.nombre as nombre_partido, 
  tipo_eleccion.nombre as nombre_candidatura, 
  distrito.nombre as nombre_distrito, 
  c.genero, c.estado, 
  c.prelacion 
  FROM historial h, candidatura_diputado c, combinaciones, distrito, tipo_eleccion
  WHERE dia='".$fecha."' AND tipo ='registro' AND c.distrito = distrito.id_distrito AND c.partido_politico = combinaciones.id_combinaciones 
  AND h.clv_original = c.clave_elector AND c.candidatura = tipo_eleccion.id_eleccion
  ORDER BY c.distrito ASC;";



      $stmt = $DB_con->query($query_str);


  $contador=0;
  while($data = $stmt->fetch(PDO::FETCH_OBJ)){
// $this->SetDrawColor(0,0,255);
//         $this->SetTextColor(0,0,0);
      $this->SetFillColor( 154, 23, 211 );
        // $this->SetTextColor(85,107,47);
         $this->SetTextColor( 21, 3, 28 );
    $this->CellFitScale(10,10,$contador+1, 1,0,'C');
    $this->CellFitScale(15,10,$data->dia,1,0,'C');
    $this->CellFitScale(45,10,$data->nombre_clv,1,0,'C');
    $this->CellFitScale(39,10,$data->clv_original,1,0,'C');
    $this->CellFitScale(40,10,$data->nombre_partido,1,0,'C');
    $this->CellFitScale(38,10,$data->nombre_candidatura,1,0,'C');
    $this->CellFitScale(30,10,$data->nombre_distrito,1,0,'C');
    $this->CellFitScale(20,10,$data->genero,1,0,'C');

    // $this->CellFitScale(45,10,$data->prelacion,1,1,'C');
     $this->CellFitScale(20,10,$data->estado,1,1,'C');
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
