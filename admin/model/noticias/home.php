<?php
class ModelNoticiasHome extends Model {

  public function getNoticias(){
    $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "noticia ORDER BY id_noticia DESC");

    return $query->rows;
  }

  public function getNoticia($data){
    $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "noticia WHERE id_noticia='".(int) $data."'");

    return $query->row;
  }

  public function deleteCapa($data){
    $this->db->query("UPDATE " . DB_PREFIX . "noticia SET capa = null WHERE id_noticia='".(int) $data."'");
  }

  public function updateNoticia($data, $files) {

    if($files['capa']['error'] != 4){

      $file = array();
      $file = $files['capa'];

      $I = 0;

     if(isset($file['name']) && $file['error'] != 4){

       /*img_proposta*/
       $nome_arquivo = $file['name'];
       $tamanho_arquivo =$file['size'];
       $arquivo_temporario =$file['tmp_name'];
       $ext = strrchr($nome_arquivo,'.');
       $img="noticias/img".date("dmYHms").$I.$ext;

       //Criando um array com as estensões permitidas
       $EstPermitidas = array(".gif",".jpg",".png",".tif",".JPG",".jpge",".JPGE",".PNG");

       if($tamanho_arquivo>0){
         if(in_array($ext,$EstPermitidas)){
             if(move_uploaded_file($arquivo_temporario, DIR_IMAGE."$img"))
             {
               $I++;

               $this->db->query("UPDATE " . DB_PREFIX . "noticia SET titulo='".$data['titulo']."', capa='".$img."', resumo='".$data['resumo']."', noticia='".$data['noticia']."' WHERE id_noticia='".$data['id_noticia']."'");

             }
         }else{
           $this->error['imagem'] = 'Ext logo';
         }
       }

     }else{
       $img = null;
     }

   }else{

     $this->db->query("UPDATE " . DB_PREFIX . "noticia SET titulo='".$data['titulo']."', resumo='".$data['resumo']."', noticia='".$data['noticia']."' WHERE id_noticia='".$data['id_noticia']."'");

   }

    //return $I;//$query->rows;
  }

	public function setNoticia($data, $files) {

      $file = array();
      $file = $files['capa'];

      $I = 0;

     if(isset($file['name']) && $file['error'] != 4){

       /*img_proposta*/
       $nome_arquivo = $file['name'];
       $tamanho_arquivo =$file['size'];
       $arquivo_temporario =$file['tmp_name'];
       $ext = strrchr($nome_arquivo,'.');
       $img="noticias/img".date("dmYHms").$I.$ext;

       //Criando um array com as estensões permitidas
       $EstPermitidas = array(".gif",".jpg",".png",".tif",".JPG",".jpge",".JPGE",".PNG");

       if($tamanho_arquivo>0){
         if(in_array($ext,$EstPermitidas)){
             if(move_uploaded_file($arquivo_temporario, DIR_IMAGE."$img"))
             {
               $I++;

               $this->db->query("INSERT INTO " . DB_PREFIX . "noticia (titulo, capa, resumo, noticia) VALUES ('".$data['titulo']."', '".$img."', '".$data['resumo']."', '".$data['noticia']."')");

             }
         }else{
           $this->error['imagem'] = 'Ext logo';
         }
       }

     }else{
       $img = null;
     }

    //return $I;//$query->rows;
  }

  public function habilitar($data) {
    $this->db->query("UPDATE " . DB_PREFIX . "noticia SET status='1' WHERE id_noticia='".(int)$data."'");
  }

  public function desabilitar($data) {
    $this->db->query("UPDATE " . DB_PREFIX . "noticia SET status='0' WHERE id_noticia='".(int)$data."'");
  }

}
