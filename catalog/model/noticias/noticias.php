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

}
