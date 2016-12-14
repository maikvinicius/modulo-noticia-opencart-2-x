<?php echo $header; ?>

<div class="container">
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
	</div>
</div>

	<div class="bread-cases">
		<div class="container">
		    <ul class="breadcrumb">
					<div class="font-cases">Notícias</div>
		      <?php foreach ($breadcrumbs as $breadcrumb) { ?>
		        <li class="teste"><a href="<?php echo $breadcrumb['href']; ?>" class="a-breadcrumb"><?php echo $breadcrumb['text']; ?></a></li>
		      <?php } ?>
		    </ul>
		</div>
	</div>

	<div class="container">
	  <div class="row">

    	<div class="col-xs-12 col-sm-9 col-md-9 col-lg-9 case-border">

        <?php if(!isset($error) && count($noticia) != 0){ ?>

          <div class="titulo-noticia-aberta">
            <?php echo $noticia['titulo']; ?>
          </div>

          <div class="data-noticia-aberta">
            Por: Solaretech | <?php echo date("d/m/Y", strtotime($noticia['data_postada'])); ?>
          </div>

      		<!-- <div class="img-case">
        			<img src="image/<?php echo $noticia['capa']; ?>" class="img-responsive" width="100%">
      		</div> -->

      		<div class="descricao-case">

      			<div class="descricao-dentro-noticia">

              <?php echo html_entity_decode($noticia['noticia']); ?>

            </div>

      		</div>

      <?php }else { ?>

        <h1>Notícia não encontrada!</h1>

      <?php } ?>

  	</div>

    <div class="hidden-xs col-sm-3 col-md-3 col-lg-3 case-border">

      <h1 style="font-size: 18px;text-transform: uppercase;">Últimas Notícias</h1>

      <?php if(isset($ultimas_noticias)) { ?>

        <?php foreach ($ultimas_noticias as $ultima_noticia) { ?>

          <a href="<?php echo $ultima_noticia['link']; ?>">
            <div style="margin-bottom: 20px;">
              <div><img src="image/<?php echo $ultima_noticia['capa']; ?>" class="img-responsive" width="100%"></div>
              <div style="display: block;font-size: 24px;padding-top: 10px;"><?php echo $ultima_noticia['titulo']; ?></div>
              <div style="display: block;font-size: 18px;padding-top: 5px;"><?php echo html_entity_decode($ultima_noticia['resumo']); ?></div>
              <!-- <div><?php echo date("d/m/Y", strtotime($ultima_noticia['data_postada'])); ?></div> -->
            </div>
          </a>

        <?php } ?>

      <?php } ?>

    </div>


      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>

<?php echo $footer; ?>
