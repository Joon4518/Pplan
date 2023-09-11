$(document).ready(function() {
  // Open the detail sidebar when the button is clicked
  $("a[href='#']").on("click", function() {
    $("#detailSidebar").addClass("active");
  });

  // Close the detail sidebar when the close button is clicked
  $("#closeDetailSidebar").on("click", function() {
    $("#detailSidebar").removeClass("active");
  });
});