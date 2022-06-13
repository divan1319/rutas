<?php
	
	require ('conexion.php');
	class Buses extends Conexion{

		protected $conex;

		public function __construct(){
			parent::__construct();
		}

		public function BUS(){
			$bus =  $this->conex->query( "SELECT * FROM buses");
			$buses = [];
        	$i = 0;
        	while ($fila = $bus->fetch_assoc()) {
        		$buses[$i] = $fila;
        		$i++;
        	}

        	return json_encode($buses);
		}
	}