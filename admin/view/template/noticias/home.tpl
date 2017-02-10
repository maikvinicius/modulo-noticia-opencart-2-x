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
                <td class="text-left">Título</td>
                <td class="text-left">Data Postada</td>
                <td class="text-left">Status</td>
                <td></td>
              </tr>
            </thead>
            <tbody>
              <?php if(isset($noticias)) { ?>

                <?php foreach ($noticias as $noticia) { ?>

                <tr id="noticia<?php echo $noticia['id_noticia']; ?>">
                  <td><?php echo $noticia['titulo']; ?></td>
                  <td><?php echo $noticia['data_postada']; ?></td>
                  <td><div id="div_btn<?php echo $noticia['id_noticia']; ?>"><?php echo ($noticia['status'] == 0) ? '<button class="btn btn-danger" onclick="habilitar('.$noticia['id_noticia'].');">Desabilitado</button>' : '<button class="btn btn-success" onclick="desabilitar('.$noticia['id_noticia'].')">Habilitado</button>'; ?></div></td>
                  <td>
                    <a href="<?php echo $noticia['link']; ?>" data-toggle="tooltip" title="" class="btn btn-primary" data-original-title="Editar">
                      <i class="fa fa-pencil"></i>
                    </a>
                    <a data-toggle="tooltip" title="" class="btn btn-danger" data-original-title="Deletar" onclick="deletar(<?php echo $noticia['id_noticia']; ?>)">
                      <i class="fa fa-trash-o"></i>
                    </a>
                    <a href="index.php?route=noticias/home/comentarios&id=<?php echo $noticia['id_noticia']; ?>&token=<?php echo $token;?>" data-toggle="tooltip" title="" class="btn btn-warning" data-original-title="Comentários">
                      <i class="fa fa-comment-o"></i>
                    </a>
                  </td>
                </tr>

                <?php } ?>

              <?php } ?>

            </tbody>
          </table>

          <a href="index.php?route=noticias/home/cadastro&token=<?php echo $token; ?>" data-toggle="tooltip" title="" class="btn btn-primary" data-original-title="Nova Notícia" style="margin-bottom: 12px;">
            <i class="fa fa-plus"></i>
          </a>

        </div>
      </div>
    </div>
  </div>
</div>

<script type="text/javascript">

function habilitar(id){

   var request = $.ajax({//post
     url: "index.php?route=noticias/home/habilitar&token=<?php echo $token; ?>",
     type: "POST",
     data: {"id_noticia": id},
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
     url: "index.php?route=noticias/home/desabilitar&token=<?php echo $token; ?>",
     type: "POST",
     data: {"id_noticia": id},
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

function deletar(id){

  var txt;
  var r = confirm("Você realmente deseja excluir esta Notícia?");
  if (r == true) {

    var request = $.ajax({//post
      url: "index.php?route=noticias/home/deletarnoticia&token=<?php echo $token; ?>",
      type: "POST",
      data: {"id_noticia": id},
      dataType: "json"
    });

    request.done(function(data) {//verifica o resultado
      console.log(data);
      $("#noticia"+id).remove();
      alert('Notícia excluida com Sucesso!');
    });

    request.fail(function(jqXHR, textStatus) {//caso haja erro
      alert( "Falha: " + textStatus );
    });

  } else {

  }

}

</script>

<?php echo $footer; ?>
