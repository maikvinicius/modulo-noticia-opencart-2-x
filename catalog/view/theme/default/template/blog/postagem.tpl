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

	<div class="container">
	  <div class="row">

    	<div class="col-xs-12 col-sm-9 col-md-9 col-lg-9 case-border">

        <?php if(!isset($error) && count($noticia) != 0){ ?>

          <style media="screen">
            .title-noticia{
              margin-top: 20px;
              font-size: 20px;
              font-weight: 600;
            }
            .data-noticia{
              margin-top: 2px;
              margin-bottom: 20px;
            }
          </style>

          <div class="title-noticia">
            <?php echo $noticia['titulo']; ?>
          </div>

          <div class="data-noticia">
            Por: Pizza Nostra | <?php echo date("d/m/Y", strtotime($noticia['data_postada'])); ?>
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

      <h1 style="font-size: 18px;text-transform: uppercase;">Últimas Postagens</h1>

      <style>
        a:hover{
          color: #000;
        }
        .last-noticia{
          -webkit-transition: .3s ease;
          -moz-transition: .3s ease;
          -o-transition: .3s ease;
          transition: all linear .3s;
        }
        .last-noticia:hover{
          -webkit-transform: scale(1.03);
          -webkit-transition: .3s ease;
          -moz-transition: .3s ease;
          -moz-transform: scale(1.03);
          -o-transition: .3s ease;
          -o-transform: scale(1.03);
          transition: all linear .3s;
        }
      </style>

      <?php if(isset($ultimas_noticias)) { ?>

        <?php foreach ($ultimas_noticias as $ultima_noticia) { ?>

          <a href="<?php echo $ultima_noticia['link']; ?>">
            <div class="last-noticia" style="margin-bottom: 20px;">
              <div><img src="image/<?php echo $ultima_noticia['capa']; ?>" class="img-responsive" width="100%"></div>
              <div style="display: block;font-size: 24px;padding-top: 10px;"><?php echo $ultima_noticia['titulo']; ?></div>
              <!-- <div style="display: block;font-size: 18px;padding-top: 5px;"><?php echo html_entity_decode($ultima_noticia['resumo']); ?></div> -->
              <!-- <div><?php echo date("d/m/Y", strtotime($ultima_noticia['data_postada'])); ?></div> -->
            </div>
          </a>

        <?php } ?>

      <?php } ?>

    </div>

    <div style="clear:both;"></div>

    <style>
      .margin10topbot{
        margin-top: 10px;
        margin-bottom: 10px;
      }
      .title-comentario{
        font-size: 20px;
        font-weight: 600;
      }
      .data-comentario{
        font-size: 14px;
      }
      .comentario{
        margin-top: 10px;
        font-size: 14px;
      }
      .border-comentario{
        border: 1px solid #333;
        border-radius: 20px;
        padding: 20px;
      }
      #at4-share{
        display: none;
      }
      .title-comentarios{
        font-size: 20px;
        font-weight: 600;
        font-style: italic;
      }
    </style>

    <div class="col-xs-12 col-sm-9 margin10topbot" align="center">
      <!-- Go to www.addthis.com/dashboard to customize your tools --> <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-57ebffbe57ed55f4"></script>
      <!-- Go to www.addthis.com/dashboard to customize your tools --> <div class="addthis_inline_share_toolbox"></div>
    </div>

    <div style="clear:both;"></div>

    <div class="col-xs-12 margin10topbot title-comentarios">
      Comentários
    </div>

    <?php if(count($comentarios) > 0){ ?>

      <?php foreach ($comentarios as $comentario) { ?>

        <div class="col-xs-12 col-sm-9 margin10topbot border-comentario">
          <div class="title-comentario">
            <?php echo $comentario['nome']; ?>
          </div>
          <div class="data-comentario">
            <?php echo date("d/m/Y" , strtotime($comentario['data_cadastro'])); ?>
          </div>
          <div class="comentario">
            <?php echo $comentario['comentario']; ?>
          </div>
        </div>

        <div style="clear:both;"></div>

      <?php } ?>

    <?php }else{ ?>

      <div class="col-xs-12 margin10topbot">
        Nenhum comentário disponível!
      </div>

    <?php } ?>

    <?php if($logado){ ?>

      <div class="col-xs-12 col-sm-9 margin10topbot">

        <div class="form-group">
          <label>Nome</label>
          <input type="text" id="nome" style="width:100%;" class="form-control" placeholder="Digite seu nome">
        </div>

        <div class="form-group margin10topbot">
          <label>Comentário</label>
          <textarea name="comentario" id="comentario" style="width:100%;" rows="5" class="form-control" placeholder="Digite seu comentário"></textarea>
        </div>

        <div class="form-group margin10topbot">
          <button type="button" class="btn btn-primary" name="button" onclick="comentario()">Enviar</button>
        </div>

      </div>

    <?php } ?>

    <div style="clear:both;"></div>

    <?php if(isset($_GET['id'])){ ?>

      <script type="text/javascript">

        function comentario(){

          var nome = $("#nome").val();
          var comentario = $("#comentario").val();

          if(nome != ""){
            if(comentario != ""){

            var request = $.ajax({//post
              url: "index.php?route=blog/postagem/comentario",
              type: "POST",
              data: {"nome": nome, "comentario": comentario, "noticia": "<?php echo $_GET['id']; ?>"},
              dataType: "json"
            });

            request.done(function(data) {//verifica o resultado
              console.log(data);
              $("#nome").val("");
              $("#comentario").val("");
              alert('Comentário enviado com sucesso! Ele será analisado antes de aparecer nesta publicação!');
            });

            request.fail(function(jqXHR, textStatus) {//caso haja erro
              alert( "Falha: " + textStatus );
            });

          } else{
            document.getElementById("mensagem").focus();
            alert("É necessário digitar o comentário!");
          }

        } else{
          document.getElementById("nome").focus();
          alert("É necessário digitar o nome!");
        }

        }

      </script>

    <?php } ?>


      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>

<?php echo $footer; ?>
