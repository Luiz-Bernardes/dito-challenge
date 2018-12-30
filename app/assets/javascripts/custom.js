$(document).ready(function() {
  $(".datatables").dataTable({
    "language": {
        "lengthMenu": "Mostrar _MENU_ registros por página",
        "zeroRecords": "Nenhum registro encontrado",
        "info": "Mostrando página _PAGE_ de _PAGES_",
        "infoEmpty": "Sem registros disponíveis",
        "search": "Pesquisar",
        "infoFiltered": "(Filtrado de _MAX_ registros totais)",
        "loadingRecords": "Carregando...",
        "processing": "Processando...",
        "paginate": {
            "next": "Próximo",
            "previous": "Anterior",
            "first": "Primeiro",
            "last": "Último"
        }
    }
  });
});