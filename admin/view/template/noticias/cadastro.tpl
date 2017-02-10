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
              <strong>Notícia cadastrada com Sucesso!</strong>
            </div>

          <?php } ?>

          <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">

            <div class="form-group">
              <label>Título</label>
              <input type="text" name="titulo" class="form-control" maxlength="52" required>
            </div>

            <div class="form-group">
              <label>Capa</label>
              <input type="file" name="capa" class="form-control" required>
              <div style="margin-top:10px;">
                Tamanho exato: 360 x 202 em JPG
              </div>
            </div>

            <div class="form-group">
              <label>Resumo</label>
              <textarea name="resumo" maxlength="189" class="form-control"></textarea>
            </div>

            <div class="form-group">
              <label>Conteúdo</label>
              <textarea name="noticia" id="noticia"></textarea>
            </div>

            <div class="form-group">
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

</script>

<?php echo $footer; ?>
