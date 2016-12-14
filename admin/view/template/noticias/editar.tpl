<?php echo $header; ?><?php echo $column_left; ?>
  <div id="content">
    <div class="page-header">
      <div class="container-fluid">
        <h1><?php echo $heading_title; ?></h1>
      </div>
    </div>
    <div class="container-fluid">
      <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">
              <i class="fa fa-list"></i>
              <?php echo $heading_title; ?>
            </h3>
        </div>
        <div class="panel-body">
          <div class="table-responsive">

          <?php if(isset($resposta)){ ?>

            <div class="alert alert-success">
              <strong>Notícia atualizada com Sucesso!</strong>
            </div>

          <?php } ?>

          <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">

            <div class="form-group">
              <label>Título</label>
              <input type="text" name="titulo" class="form-control" value="<?php echo $noticia['titulo']; ?>" required>
            </div>

            <div class="form-group">
              <label>Capa</label>
              <input type="file" name="capa" class="form-control">
            </div>

            <?php if($noticia['capa'] != null){ ?>
              <div class="form-group" id="proposta-callback">
                <div class="teste">
                  <img src="../image/<?php echo $noticia['capa']; ?>" class="img-responsive img-vertical">
                  <div id="remover-capa" class="remover"><img src="../image/delete.png" class="img-responsive"></div>
                </div>
              </div>
            <?php } ?>

            <div class="form-group">
              <label>Resumo</label>
              <textarea name="resumo" id="resumo"><?php echo $noticia['resumo']; ?></textarea>
            </div>

            <div class="form-group">
              <label>Notícia</label>
              <textarea name="noticia" id="noticia"><?php echo $noticia['noticia']; ?></textarea>
            </div>

            <div class="form-group">
              <input type="hidden" name="id_noticia" value="<?php echo $noticia['id_noticia']; ?>">
              <button type="submit" class="btn btn-primary">Cadastrar</button>
            </div>

          </form>

        </div>
      </div>
    </div>
  </div>
</div>

<script type="text/javascript">

  $('#noticia').summernote({
    height: 300
  });

  $('#resumo').summernote({
    height: 300
  });

  $("#remover-capa").click(function() {
    var txt;
    var r = confirm("Você tem certeza que deseja excluir a capa da notícia?");
    if (r == true) {

      var request = $.ajax({//post
        url: "index.php?route=noticias/home/deletaCapa&token=<?php echo $token; ?>",
        type: "POST",
        data: {"id_noticia": '<?php echo $noticia['id_noticia']; ?>'},
        dataType: "json"
      });

      request.done(function(data) {//verifica o resultado
        console.log(data);
        alert('Excluida com sucesso!');
        $( "#proposta-callback" ).remove();
      });

      request.fail(function(jqXHR, textStatus) {//caso haja erro
        alert( "Falha: " + textStatus );
      });

    } else {

    }
  });

</script>

<?php echo $footer; ?>
