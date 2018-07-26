$(document).ready(function(){
  if ($("#views-admin-dashboard-index").length) {
      $('#myModalXoa').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget) // Button that triggered the modal
        var msp = button.data('masp')
        var mass = button.data('mass')
        var modal = $(this)
        //alert(msp)
        modal.find('.modal-title').text('Do you want delete "' + msp + '" ?')
        $("#btn-delete").attr("href","/admin/products/"+mass)
      });
  }
  if ($("#views-admin-categories-index").length) {
      $('#myModalXoa').on('show.bs.modal', function (event) {
      var button = $(event.relatedTarget) // Button that triggered the modal
      var msp = button.data('masp')
      var mass = button.data('mass')
      var modal = $(this)
      //alert(msp)
      modal.find('.modal-title').text('Do you want delete "' + msp + '" ?')
      $("#btn-delete").attr("href","/admin/categories/"+mass)
      });
  }
})