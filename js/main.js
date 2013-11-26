function add_edit_buttons(tableID) {
  $(tableID + ' thead tr').append('<th>Edit</th>');
  $(tableID + ' tbody tr').each(function(i, row) {
    var editButton = $('<button class="btn btn-default"><span class="glyphicon glyphicon-edit"></span></button>');
    var editForm = $('#editEmployeeForm');
    var fields = [
      'Fname',
      'Lname',
      'Minit',
      'SSN',
      'Address',
      'Sex',
      'Salary',
      'Super_ssn',
      'Dno',
      'BDate',
      'EmpDate'
    ];
    editButton.click(function() {
      editForm.find('#original_ssn').val(
        $(row).children('.SSN').text()
      );
      editForm.find('#formErrors').addClass('hidden');
      $.each(fields, function(i, field) {
        editForm.find('#' + field).val(
          $(row).children('.' + field).text()  
        );
      });
      $('#editEmployeeModal').modal('show');
    });
    $(row).append($('<td>').append(editButton));
  });
}

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
      if ($('#employeeTable')) {
        add_edit_buttons('#employeeTable');
      }
    }
  });
};

function bind_retrieval(apiUrl, formID) {
  $(formID).submit(function (event) {
    event.preventDefault();
    $.ajax({
      url: apiUrl, 
      type: "post",
      dataType: 'json',
      data: $(formID).serialize(),
      success: function(data) {
        if (data['status'] == 'ERROR') {
          $(formID + ' #formErrors')
            .removeClass('hidden')
            .html('<p><strong>Error:</strong> ' + data['message'] + '</p>');
        }
        else {
          location.reload();
        }
      }
    });
  });
}
