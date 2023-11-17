<?php
    header('Content-Type: application/json') ;

    require_once("../config/Conexion.php");
    require_once("../models/categoria.php");
    $categoria = new Categoria();

    $body = json_decode(file_get_contents("php://input"), true);

switch($_GET["op"]){
    case "GetAll":
        $datos=$categoria->get_categoria();
        echo json_encode($datos);
    break;

    case "GetId":
        $datos=$categoria->get_categoria_x_id($body["id_usuario"]);
        echo json_encode($datos);
    break;
    case "Insert":
        $datos=$categoria->insert_Categoria($body["producto"],$body["empresa"],$body["precio"],$body["cantidad"],$body["fecha_vencimiento"],$body["fk_id_usuario"]);
        echo json_encode($datos);
    break;
    case "Update":
        $datos = $categoria->update_categoria($body["id_codigo"], $body["producto"], $body["empresa"], $body["precio"], $body["cantidad"], $body["fecha_vencimiento"]);
        echo json_encode($datos);
    break;
    case "Delete":
            $datos = $categoria->delete_categoria($body["id_codigo"]);
            echo json_encode($datos);
    break;

}
?>