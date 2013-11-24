function get_new_works_on() {
  $.ajax({
    url: '/api/get_new_works_on',
    type: 'post',
    dataType: 'json',
    success: function (data) {
      var table = $('#worksOnTable');
      $.each(data, function(i, works_on) {
        var row = new Array(), j = 0;
        row[j++] = '<tr>';
        row[j++] = '<td class="Essn">' + works_on['Essn'] + '</td>'; 
        row[j++] = '<td class="Pno">' + works_on['Pno'] + '</td>'; 
        row[j++] = '<td class="Hours">' + works_on['Hours'] + '</td>'; 
        row[j++] = '</tr>';
        table.append(row.join(''));
      });
    }
  });
};

function get_works_on() {
  $.ajax({
    url: '/api/get_works_on',
    type: 'post',
    dataType: 'json',
    success: function (data) {
      var table = $('#worksOnTable');
      $.each(data, function(i, works_on) {
        var row = new Array(), j = 0;
        row[j++] = '<tr>';
        row[j++] = '<td class="Essn">' + works_on['Essn'] + '</td>'; 
        row[j++] = '<td class="Pno">' + works_on['Pno'] + '</td>'; 
        row[j++] = '<td class="Hours">' + works_on['Hours'] + '</td>'; 
        row[j++] = '</tr>';
        table.append(row.join(''));
      });
    }
  });
};

function get_projects() {
  $.ajax({
    url: '/api/get_projects',
    type: 'post',
    dataType: 'json',
    success: function (data) {
      var table = $('#projectTable');
      $.each(data, function(i, project) {
        var row = new Array(), j = 0;
        row[j++] = '<tr>';
        row[j++] = '<td class="Pname">' + project['Pname'] + '</td>'; 
        row[j++] = '<td class="Pnumber">' + project['Pnumber'] + '</td>'; 
        row[j++] = '<td class="Plocation">' + project['Plocation'] + '</td>'; 
        row[j++] = '<td class="Dnum">' + project['Dnum'] + '</td>'; 
        row[j++] = '<td class="AmtSpent">' + project['AmtSpent'] + '</td>'; 
        row[j++] = '<td class="AmtMade">' + project['AmtMade'] + '</td>'; 
        row[j++] = '</tr>';
        table.append(row.join(''));
      });
    }
  });
};

function get_department_locations() {
  $.ajax({
    url: '/api/get_department_locations',
    type: 'post',
    dataType: 'json',
    success: function (data) {
      var table = $('#departmentLocationTable');
      $.each(data, function(i, department_location) {
        var row = new Array(), j = 0;
        row[j++] = '<tr>';
        row[j++] = '<td class="Dnumber">' + department_location['Dnumber'] + '</td>'; 
        row[j++] = '<td class="Dlocation">' + department_location['Dlocation'] + '</td>'; 
        row[j++] = '</tr>';
        table.append(row.join(''));
      });
    }
  });
};

function get_new_dependents() {
  $.ajax({
    url: '/api/get_new_dependents',
    type: 'post',
    dataType: 'json',
    success: function (data) {
      var table = $('#dependentTable');
      $.each(data, function(i, dependent) {
        var row = new Array(), j = 0;
        row[j++] = '<tr>';
        row[j++] = '<td class="Essn">' + dependent['Essn'] + '</td>'; 
        row[j++] = '<td class="Dependent_name">' + dependent['Dependent_name'] + '</td>'; 
        row[j++] = '<td class="Sex">' + dependent['Sex'] + '</td>'; 
        row[j++] = '<td class="Bdate">' + dependent['Bdate'] + '</td>'; 
        row[j++] = '<td class="Relationship">' + dependent['Relationship'] + '</td>'; 
        row[j++] = '</tr>';
        table.append(row.join(''));
      });
    }
  });
};

function get_dependents() {
  $.ajax({
    url: '/api/get_dependents',
    type: 'post',
    dataType: 'json',
    success: function (data) {
      var table = $('#dependentTable');
      $.each(data, function(i, dependent) {
        var row = new Array(), j = 0;
        row[j++] = '<tr>';
        row[j++] = '<td class="Essn">' + dependent['Essn'] + '</td>'; 
        row[j++] = '<td class="Dependent_name">' + dependent['Dependent_name'] + '</td>'; 
        row[j++] = '<td class="Sex">' + dependent['Sex'] + '</td>'; 
        row[j++] = '<td class="Bdate">' + dependent['Bdate'] + '</td>'; 
        row[j++] = '<td class="Relationship">' + dependent['Relationship'] + '</td>'; 
        row[j++] = '</tr>';
        table.append(row.join(''));
      });
    }
  });
};

function get_departments() {
  $.ajax({
    url: '/api/get_departments',
    type: 'post',
    dataType: 'json',
    success: function (data) {
      var table = $('#departmentTable');
      $.each(data, function(i, department) {
        var row = new Array(), j = 0;
        row[j++] = '<tr>';
        row[j++] = '<td class="Dname">' + department['Dname'] + '</td>'; 
        row[j++] = '<td class="Dnumber">' + department['Dnumber'] + '</td>'; 
        row[j++] = '<td class="Mgr_ssn">' + department['Mgr_ssn'] + '</td>'; 
        row[j++] = '</tr>';
        table.append(row.join(''));
      });
    }
  });
};

function get_new_employees() {
  $.ajax({
    url: '/api/get_new_employees',
    type: 'post',
    dataType: 'json',
    success: function (data) {
      var table = $('#employeeTable');
      $.each(data, function(i, employee) {
        var row = new Array(), j = 0;
        row[j++] = '<tr>';
        row[j++] = '<td class="Fname">' + employee['Fname'] + '</td>'; 
        row[j++] = '<td class="Minit">' + employee['Minit'] + '</td>'; 
        row[j++] = '<td class="Lname">' + employee['Lname'] + '</td>'; 
        row[j++] = '<td class="SSN">' + employee['SSN'] + '</td>'; 
        row[j++] = '<td class="Address">' + employee['Address'] + '</td>'; 
        row[j++] = '<td class="Sex">' + employee['Sex'] + '</td>'; 
        row[j++] = '<td class="Salary">' + employee['Salary'] + '</td>'; 
        row[j++] = '<td class="Super_ssn">' + employee['Super_ssn'] + '</td>'; 
        row[j++] = '<td class="Dno">' + employee['Dno'] + '</td>'; 
        row[j++] = '<td class="BDate">' + employee['BDate'] + '</td>'; 
        row[j++] = '<td class="EmpDate">' + employee['EmpDate'] + '</td>'; 
        row[j++] = '</tr>';
        table.append(row.join(''));
      });
    }
  });
};

function get_employees() {
  $.ajax({
    url: '/api/get_employees',
    type: 'post',
    dataType: 'json',
    success: function (data) {
      var table = $('#employeeTable');
      $.each(data, function(i, employee) {
        var row = new Array(), j = 0;
        row[j++] = '<tr>';
        row[j++] = '<td class="Fname">' + employee['Fname'] + '</td>'; 
        row[j++] = '<td class="Minit">' + employee['Minit'] + '</td>'; 
        row[j++] = '<td class="Lname">' + employee['Lname'] + '</td>'; 
        row[j++] = '<td class="SSN">' + employee['SSN'] + '</td>'; 
        row[j++] = '<td class="Address">' + employee['Address'] + '</td>'; 
        row[j++] = '<td class="Sex">' + employee['Sex'] + '</td>'; 
        row[j++] = '<td class="Salary">' + employee['Salary'] + '</td>'; 
        row[j++] = '<td class="Super_ssn">' + employee['Super_ssn'] + '</td>'; 
        row[j++] = '<td class="Dno">' + employee['Dno'] + '</td>'; 
        row[j++] = '<td class="BDate">' + employee['BDate'] + '</td>'; 
        row[j++] = '<td class="EmpDate">' + employee['EmpDate'] + '</td>'; 
        row[j++] = '</tr>';
        table.append(row.join(''));
      });
    }
  });
};
