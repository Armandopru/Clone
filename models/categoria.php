<?php
    class Categoria extends Conectar{
        public function get_categoria(){
            $conectar= parent::conexion();
            parent::set_names();
            $sql="SELECT * FROM `bodega`";
            $sql=$conectar->prepare($sql);
            $sql->execute();
            return $resultado=$sql->fetchALL(PDO::FETCH_ASSOC);
        }

        public function get_categoria_x_id($id_usuario){
            $conectar= parent::conexion();
            parent::set_names();
            $sql="SELECT usuario.Nombre, usuario.telefono, bodega.id_codigo, bodega.empresa, bodega.producto, bodega.precio, bodega.cantidad, bodega.fecha_vencimiento FROM `bodega` inner join `usuario` where usuario.id_usuario = bodega.fk_id_usuario AND id_usuario= ?";
            $sql=$conectar->prepare($sql);
            $sql->bindValue(1,$id_usuario);
            $sql->execute();
            return $resultado=$sql->fetchALL(PDO::FETCH_ASSOC);
    }
    public function insert_categoria($producto, $empresa, $precio, $cantidad, $fecha_vencimiento, $fk_id_usuario){
        $conectar = parent::conexion();
        parent::set_names();
        $sql = "INSERT INTO bodega (producto, empresa, precio, cantidad, fecha_vencimiento, fk_id_usuario) VALUES (?, ?, ?, ?, ?, ?)";
        $sql = $conectar->prepare($sql);
        $sql->bindValue(1, $producto);
        $sql->bindValue(2, $empresa);
        $sql->bindValue(3, $precio);
        $sql->bindValue(4, $cantidad);
        $sql->bindValue(5, $fecha_vencimiento);
        $sql->bindValue(6, $fk_id_usuario);
        $sql->execute();
        return true;
    }
    public function update_categoria($id_codigo, $producto, $empresa, $precio, $cantidad, $fecha_vencimiento) {
        $conectar = parent::conexion();
        parent::set_names();
        $sql = "UPDATE bodega SET producto=?, empresa=?, precio=?, cantidad=?, fecha_vencimiento=? WHERE id_codigo=?";
        $sql = $conectar->prepare($sql);
        $sql->bindValue(1, $producto);
        $sql->bindValue(2, $empresa);
        $sql->bindValue(3, $precio);
        $sql->bindValue(4, $cantidad);
        $sql->bindValue(5, $fecha_vencimiento);
        $sql->bindValue(6, $id_codigo);
        $sql->execute();
        return true;
    }
    public function delete_categoria($id_codigo){
        $conectar = parent::conexion();
        parent::set_names();
        $sql = "DELETE FROM bodega WHERE id_codigo=?";
        $sql = $conectar->prepare($sql);
        $sql->bindValue(1, $id_codigo);
        $sql->execute();
        return true;
    }
}
?>