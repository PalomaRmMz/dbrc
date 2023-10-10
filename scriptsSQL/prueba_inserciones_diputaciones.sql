use reg2018_bd;
CALL addDiputacion( 'ABRAHAM','TREJO','DEAS','FEMENINO','1','1','AMCRLC61121529H500','AACL611215HTLMRC15','2342','2343243249328','IDMEX2131231231','1231','2','2003-01-29','29','21','','Incompleto','omar89','Propietario','00','false','false','NO APLICA','NO APLICA','false','false','false','false','false','false','false','false','false','2','Registro','ABRAHAM TREJO DEAS','10.12.2020','10:48:54am','true');
CALL candidaturaRenuncia( '1','omar89','Renuncia','ABRAHAM TREJO ASDASD','AMCRLC61121529H500','NO HAY','INAHBILITACION','11.12.2020','09:35:09am','21');

INSERT INTO historial values(null, 'omar89', 'Sustitución', 'ABRAHAMWDASDAS TREJOASD ASDASD', 'MNTRAN84061929M700', 'ABRAHAMWDASDAS TREJOASD ASDASD', 'CCCCAN66041229H500',
      'COCA660412HTLCCN04', 'RENUNCIA', '11.12.2020', '02:04:08pm', '2', '16', '', '');


call getInfoCandidato('AMCRLC61121529H500');
