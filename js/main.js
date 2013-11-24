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
