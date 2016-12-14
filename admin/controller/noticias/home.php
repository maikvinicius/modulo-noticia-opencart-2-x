<?php
class ControllerNoticiasHome extends Controller {

	public function index() {

		$this->document->setTitle('Notícias');
		$this->load->model('noticias/home');

		$noticias = $this->model_noticias_home->getNoticias();

		foreach ($noticias as $noticia) {
			$data['noticias'][] = array(
				'id_noticia'					=> $noticia['id_noticia'],
				'titulo'						=> $noticia['titulo'],
				'status'					=> $noticia['status'],
				'data_postada'						=> date("d/m/Y", strtotime($noticia['data_postada'])),
				'link'						=> $this->url->link('noticias/home/editar', 'token=' . $this->session->data['token']. '&id=' .$noticia['id_noticia'], 'SSL')
			);
		}

		$data['token'] = $this->session->data['token'];
		$data['heading_title'] = 'Notícias';
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('noticias/home.tpl', $data));

	}

	public function cadastro() {

		$this->document->setTitle('Cadastro de Notícias');
		$this->load->model('noticias/home');

		$data['action'] = $this->url->link('noticias/home/cadastro', 'token=' . $this->session->data['token'], 'SSL');

		if ($this->request->server['REQUEST_METHOD'] == 'POST') {

			$this->model_noticias_home->setNoticia($this->request->post, $this->request->files);

			$data['resposta'] = 'ok';

		}

		$data['token'] = $this->session->data['token'];
		$data['heading_title'] = 'Notícias';
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('noticias/cadastro.tpl', $data));

	}

	public function editar() {

		$this->document->setTitle('Cadastro de Notícias');
		$this->load->model('noticias/home');

		if ($this->request->server['REQUEST_METHOD'] == 'POST') {

			$this->model_noticias_home->updateNoticia($this->request->post, $this->request->files);

			$data['resposta'] = 'ok';

		}

		$data['noticia'] = $this->model_noticias_home->getNoticia($this->request->get['id']);

		$data['action'] = $this->url->link('noticias/home/editar', 'token=' . $this->session->data['token']. '&id=' .$this->request->get['id'], 'SSL');


		$data['token'] = $this->session->data['token'];
		$data['heading_title'] = 'Notícias';
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('noticias/editar.tpl', $data));

	}

	public function deletaCapa($json){

		$this->load->model('noticias/home');

		$id_noticia = $this->request->post['id_noticia'];

		$this->model_noticias_home->deleteCapa($id_noticia);

		$json = array(
			'sucesso' => 'ok'
		);

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));

	}

	public function habilitar(){

		$this->load->model('noticias/home');

		$this->model_noticias_home->habilitar($this->request->post['id_noticia']);

		$json = array(
			'sucesso' => 'ok'
		);

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));

	}

	public function desabilitar(){

		$this->load->model('noticias/home');

		$this->model_noticias_home->desabilitar($this->request->post['id_noticia']);

		$json = array(
			'sucesso' => 'ok'
		);

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));

	}

}
