function populate_table(apiUrl, tableID) {
  $.ajax({
    url: apiUrl,
    type: 'post',
    dataType: 'json',
    success: function (data) {
      var table = $(tableID);
      $.each(data, function(i, record) {
        var row = new Array(), j = 0;
        row[j++] = '<tr>';
        $.each(record, function(key, value) {
          row[j++] = '<td class="' + key + '">' + value + '</td>';
        });
        row[j++] = '</tr>';
        table.append(row.join(''));
      });
    }
  });
};

$('#createEmployeeForm').submit(function (event) {
  event.preventDefault();
  $.ajax({
    url: "/api/create_employee.php",
    type: "post",
    dataType: 'json',
    data: $('#createEmployeeForm').serialize(),
    success: function(data) {
      if (data['status'] == 'ERROR') {
        $('#formErrors')
          .removeClass('hidden')
          .html('<p><strong>Error:</strong> ' + data['message'] + '</p>');
      }
      else {
        location.reload();
      }
    }
  });
});
