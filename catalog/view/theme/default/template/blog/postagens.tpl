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

  <div class="breadcrumb_fundo">
    <div class="container">
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
          <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>

  <style>

    .margin10topbot{
      margin-top: 40px;
      margin-bottom: 10px;
    }

    .titulo-noticia{
      margin-top: 10px;
      margin-bottom: 10px;
      font-weight: 400;
      color: rgb(72, 70, 70);
      font-size: 25px;
      line-height: 30px;
    }

    .resumo-noticia{
      text-align: justify;
    }

    a:hover{
      color: rgb(94, 94, 94);
    }

    .block-noticia{
      margin-bottom: 20px;
      -webkit-transition: .3s ease;
      -moz-transition: .3s ease;
      -o-transition: .3s ease;
      transition: all linear .3s;
    }

    .block-noticia:hover{
      -webkit-transform: scale(1.03);
      -webkit-transition: .3s ease;
      -moz-transition: .3s ease;
      -moz-transform: scale(1.03);
      -o-transition: .3s ease;
      -o-transform: scale(1.03);
      transition: all linear .3s;
    }

  </style>

	<div class="container">
	  <div class="row margin10topbot">

      <?php if(isset($noticias)){ ?>

        <?php $I = 0; ?>

        <?php foreach ($noticias as $noticia) { ?>

          <?php $I++; ?>

          <a href="<?php echo $noticia['link']; ?>">
          	<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4 block-noticia">

          		<div class="img-case">
            			<img src="image/<?php echo $noticia['capa']; ?>" class="img-responsive" style="min-height: 193.75px;">
          		</div>

          			<div class="titulo-noticia">
          				<?php echo $noticia['titulo']; ?>
          			</div>

          			<div class="resumo-noticia">
                  <?php echo html_entity_decode($noticia['resumo']); ?>
          			</div>

          	</div>
          </a>

          <?php

            if($I == 3) {

              $I = 0;

              echo "<div style='clear:both'></div>";

            }

          ?>

        <?php } ?>

      <?php }else{ ?>

        <h1>Nenhuma notícia cadastrada!</h1>

      <?php } ?>


      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>

<?php echo $footer; ?>
