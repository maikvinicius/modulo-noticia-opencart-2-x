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

      <?php if(isset($noticias)){ ?>

        <?php $I = 0; ?>

        <?php foreach ($noticias as $noticia) { ?>

          <a href="<?php echo $noticia['link']; ?>">
          	<div class="col-xs-12 col-sm-3 col-md-3 col-lg-3 case-border">

          		<div class="img-case">
            			<img src="image/<?php echo $noticia['capa']; ?>" class="img-responsive" style="min-height: 193.75px;">
          		</div>

          		<div class="descricao-case">

          			<div class="titulo-noticia">
          				<?php echo $noticia['titulo']; ?>
          			</div>

          			<div class="descricao-dentro-noticia">
                  <?php echo html_entity_decode($noticia['resumo']); ?>
          			</div>

          		</div>

          	</div>
          </a>

          <?php

            if($I == 4) {

              $I = 0;

              echo "<div style='clear:both'></div>";

            }

            $I++;

          ?>

        <?php } ?>

      <?php }else{ ?>

        <h1>Nenhuma notícia cadastrada!</h1>

      <?php } ?>


      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>

<?php echo $footer; ?>
