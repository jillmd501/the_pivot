$(document).ready(function() {
  var $statuses = $(".status")

  $("#order_filter_status").on("change", function () {
    var currentStatus = this.value;
    $statuses.each(function (_, status) {
      $status = $(status);
      if ($status.data("status") === currentStatus) {
        $status.show();
      } else {
        $status.hide();
      }
    });
  });
});
