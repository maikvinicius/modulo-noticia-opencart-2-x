<?php
class ControllerNoticiasNoticias extends Controller {
	private $error = array();

	public function index() {
		$this->load->model('noticias/noticias');

		$noticias = $this->model_noticias_noticias->getNoticias();

		foreach ($noticias as $noticia) {
			$data['noticias'][] = array(
				'id_noticia'						=> $noticia['id_noticia'],
				'titulo'								=> $noticia['titulo'],
				'capa'									=> $noticia['capa'],
				'resumo'								=> $noticia['resumo'],
				'link'									=> $this->url->link('noticias/noticias/view', '&id=' .$noticia['id_noticia'])
			);
		}

		$this->document->setTitle('Noticias');

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		$data['breadcrumbs'][] = array(
			'text' => 'Notícias',
			'href' => $this->url->link('noticias/noticias')
		);

		$data['heading_title'] = 'Notícias';

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/noticias/noticias.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/noticias/noticias.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/noticias/noticias.tpl', $data));
		}
	}

	public function view() {
		$this->load->model('noticias/noticias');

		$id = (int) $this->request->get['id'];

		if($id != 0){
			$data['noticia'] = $this->model_noticias_noticias->getNoticia($id);
		}else{
			$data['error'] = true;
		}

		$noticias = $this->model_noticias_noticias->getLastNoticias();

		foreach ($noticias as $noticia) {
			$data['ultimas_noticias'][] = array(
				'id_noticia'						=> $noticia['id_noticia'],
				'titulo'								=> $noticia['titulo'],
				'capa'									=> $noticia['capa'],
				'resumo'								=> $noticia['resumo'],
				'link'									=> $this->url->link('noticias/noticias/view', '&id=' .$noticia['id_noticia'])
			);
		}

		$this->document->setTitle('Noticias');

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		$data['breadcrumbs'][] = array(
			'text' => 'Notícias',
			'href' => $this->url->link('noticias/noticias')
		);

		$data['heading_title'] = 'Notícias';
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/noticias/noticia.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/noticias/noticia.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/noticias/noticia.tpl', $data));
		}
	}

}
