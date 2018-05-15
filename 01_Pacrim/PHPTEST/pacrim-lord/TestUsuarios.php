<?php

require_once 'simpletest-master/autorun.php';
require_once 'controller/Alumno.php';

    class TestAlumno extends UnitTestCase
    {
    	var $alum;

    	function setUp() {
    		$this->alum = new Alumno();
    	}

    	function testAlum()
    	{
    		$result = $this->alum->registroAlumno("1");
        
    		$this->assertEqual('OK', $result);
    	}

    }
?>