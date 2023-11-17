<?php
class Conectar{
    protected $dbh;
    protected function Conexion(){
        try{
            $conectar = $this->dbh = new PDO("mysql:local=localhost;dbname=bodega","root","");
            return $conectar;
        } catch (Exception $e) {
        print "Error ED! :". $e->getMessage() . "<br/>";
        die();
        }
    }
    public function set_names(){
        return $this->dbh->query("SET NAMES 'utf8'");
}
}
?>