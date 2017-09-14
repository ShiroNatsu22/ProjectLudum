
    $(document).ready(function() {

        initializeLibraries();
    } );


  function initializeLibraries(){

    $('.table-list').DataTable( {
        dom: 'Bfrtp',
        responsive: true
    } );
    // Initialize tooltip component
    $(function () {
        $('[data-toggle="tooltip"]').tooltip()
    });

    // Initialize popover component
    $(function () {
        $('[data-toggle="popover"]').popover()
    });



    $('select').select2();
  }
