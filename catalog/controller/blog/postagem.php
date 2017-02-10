<?php
class ControllerBlogPostagem extends Controller {
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
				'link'									=> $this->url->link('blog/postagem/view', '&id=' .$noticia['id_noticia'])
			);
		}

		$this->document->setTitle('Blog');

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		$data['breadcrumbs'][] = array(
			'text' => 'Blog',
			'href' => $this->url->link('blog/postagem')
		);

		$data['heading_title'] = 'Notícias';

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/blog/postagens.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/blog/postagens.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/blog/postagens.tpl', $data));
		}
	}

	public function view() {
		$this->load->model('noticias/noticias');

		$data['logado'] = ($this->customer->isLogged()) ? true : false;

		$id = (isset($this->request->get['id'])) ? (int) $this->request->get['id'] : 0;

		if($id != 0){
			$data['noticia'] = $this->model_noticias_noticias->getNoticia($id);
			$data['comentarios'] = $this->model_noticias_noticias->getComentarioNoticia($id);
		}else{
			$data['error'] = true;
			$data['noticia'] = array();
			$data['comentarios'] = array();
		}

		$noticias = $this->model_noticias_noticias->getLastNoticias();

		foreach ($noticias as $noticia) {
			$data['ultimas_noticias'][] = array(
				'id_noticia'						=> $noticia['id_noticia'],
				'titulo'								=> $noticia['titulo'],
				'capa'									=> $noticia['capa'],
				'resumo'								=> $noticia['resumo'],
				'link'									=> $this->url->link('blog/postagem/view', '&id=' .$noticia['id_noticia'])
			);
		}

		$this->document->setTitle('Blog');

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		$data['breadcrumbs'][] = array(
			'text' => 'Blog',
			'href' => $this->url->link('blog/postagem')
		);

		if (count($data['noticia']) > 0) {

			$data['breadcrumbs'][] = array(
				'text' => $data['noticia']['titulo'],
				'href' => $this->url->link('blog/postagem/view', 'id='.$data['noticia']['id_noticia'])
			);

		}

		$data['heading_title'] = 'Notícias';
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/blog/postagem.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/blog/postagem.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/blog/postagem.tpl', $data));
		}
	}

	public function comentario() {

		$this->load->model('noticias/noticias');

		if ($this->request->server['REQUEST_METHOD'] == 'POST') {

			$dados = array();

			$dados['nome'] = addslashes($this->request->post['nome']);
			$dados['comentario'] = addslashes($this->request->post['comentario']);
			$dados['noticia'] = $this->request->post['noticia'];
			$dados['usuario'] = $this->session->data['customer_id'];

			$this->model_noticias_noticias->setComentario($dados);

			$json = array(
				'sucesso' => 'ok'
			);

			$this->response->addHeader('Content-Type: application/json');
			$this->response->setOutput(json_encode($json));

		}

	}

}
