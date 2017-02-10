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

          <table id="images" class="table table-striped table-bordered table-hover">
            <thead>
              <tr>
                <td class="text-left">Nome</td>
                <td class="text-left">Cometário</td>
                <td class="text-left">Data</td>
                <td class="text-left">Status</td>
              </tr>
            </thead>
            <tbody>
              <?php if(isset($comentarios)) { ?>

                <?php foreach ($comentarios as $comentario) { ?>

                  <tr>
                    <td><?php echo $comentario['nome']; ?></td>
                    <td><?php echo $comentario['comentario']; ?></td>
                    <td><?php echo date("d/m/Y", strtotime($comentario['data_cadastro'])); ?></td>
                    <td><div id="div_btn<?php echo $comentario['id_comentario']; ?>"><?php echo ($comentario['status'] == 0) ? '<button class="btn btn-danger" onclick="habilitar('.$comentario['id_comentario'].');">Desabilitado</button>' : '<button class="btn btn-success" onclick="desabilitar('.$comentario['id_comentario'].')">Habilitado</button>'; ?></div></td>
                  </tr>

                <?php } ?>

              <?php } ?>

            </tbody>
          </table>

        </div>
      </div>
    </div>
  </div>
</div>

<script type="text/javascript">

function habilitar(id){

   var request = $.ajax({//post
     url: "index.php?route=noticias/home/habilitarComentario&token=<?php echo $token; ?>",
     type: "POST",
     data: {"id_comentario": id},
     dataType: "html"
   });

   request.done(function(data) {//verifica o resultado
     console.log(data);
     $('#div_btn'+id).children().remove();
     $('#div_btn'+id).html('<button class="btn btn-success" onclick="desabilitar('+id+')" id="btn_habilitado">Habilitado</button>');
     alert('Habilitado!');
   });

   request.fail(function(jqXHR, textStatus) {//caso haja erro
     alert( "Falha: " + textStatus );
   });

}

function desabilitar(id){

   var request = $.ajax({//post
     url: "index.php?route=noticias/home/desabilitarComentario&token=<?php echo $token; ?>",
     type: "POST",
     data: {"id_comentario": id},
     dataType: "json"
   });

   request.done(function(data) {//verifica o resultado
     console.log(data);
     $('#div_btn'+id).children().remove();
     $('#div_btn'+id).html('<button class="btn btn-danger" onclick="habilitar('+id+')" id="btn_desabilitado">Desabilitado</button>');
     alert('Desabilitado!');
   });

   request.fail(function(jqXHR, textStatus) {//caso haja erro
     alert( "Falha: " + textStatus );
   });

}

</script>

<?php echo $footer; ?>
