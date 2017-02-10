<?php
class ModelNoticiasNoticias extends Model {

	public function getNoticias() {
		$query = $this->db->query("SELECT * FROM ". DB_PREFIX ."noticia WHERE status='1' ORDER BY id_noticia DESC");

		return $query->rows;
	}

	public function getLastNoticias() {
		$query = $this->db->query("SELECT * FROM ". DB_PREFIX ."noticia WHERE status='1' ORDER BY id_noticia DESC LIMIT 3");

		return $query->rows;
	}

	public function getNoticia($data) {
		$query = $this->db->query("SELECT * FROM ". DB_PREFIX ."noticia WHERE status='1' AND id_noticia='".(int) $data."'");

		return $query->row;
	}

	public function getComentarioNoticia($data) {
		$query = $this->db->query("SELECT * FROM ". DB_PREFIX ."comentarios WHERE noticia='".$data."' AND status='1' ORDER BY id_comentario DESC");

		return $query->rows;
	}

	public function setComentario($data) {
		$this->db->query("INSERT INTO ". DB_PREFIX ."comentarios (nome, comentario, noticia, usuario, status) VALUES ('".$data['nome']."', '".$data['comentario']."', '".$data['noticia']."', '".$data['usuario']."', '0')");
	}

}
