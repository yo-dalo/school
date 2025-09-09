$(document).ready(function() {
  function add(from_id, url, runfunction, editor_id="") {
    $(from_id).submit(function(e) {
      e.preventDefault();
      var formData = new FormData(this);

    function add_edter(editor_id="",formData) {
        // Tab to edit
        if (editor_id !== '') {
          var objEditor = CKEDITOR.instances[editor_id];
          var sessionID = objEditor.getData();
          formData.append('editor', sessionID);
        }

      }

    add_edter(editor_id,formData)

      // var send_data = { formData: formData, who_add: who_add }
      $.ajax({
        url: url, // Replace with your PHP script URL
        type: 'POST',
        data: formData,
        contentType: false,
        processData: false,
        success: function(response) {
          rs = response;

          function clearForm(from_id) {
            var form = document.querySelector(from_id);
            form.reset();
            const modalDismissButtons = form.querySelectorAll('img');
            modalDismissButtons.forEach(button => button.src = '');
          }
          clearForm(from_id);

          function closeModal(from_id) {
            var form = document.querySelector(from_id);
            const modalDismissButtons = form.querySelectorAll('[data-bs-dismiss="modal"]');
            modalDismissButtons.forEach(button => button.click());
          }


          closeModal(from_id)
          // Assuming you want to fill the clicked element with the response
          //  $(get_all_produc:t_cat).html(response);

          if (typeof runfunction === 'function') {
            runfunction(); // Invoke the function passed as a parameter
          }





          // Handle the server response here
        }
      });
    });
  };
  function show(partner_div_id, url, runfunction) {
    $.ajax({
      type: "GET",
      url: url,
      //data: data,
      success: function(response) {
        rs = response;
        // Assuming you want to fill the clicked element with the response
        $(partner_div_id).html(response);

        if (typeof runfunction === 'function') {
          runfunction(); // Invoke the function passed as a parameter
        }

        // alert(response);
      },
      error: function(err) {
        console.error("Error:", err);
      }
    });

  }
  function delete_(delete_button, url, who, runfunction) {

    $(document).on('click', delete_button, function() {
      var idToDelete = $(this).data('id'); // Use $(this) to reference the clicked element
      var cl =$(this);
      var data = {
        id: idToDelete,
        who: who,
      };

      $.ajax({
        type: "POST",
        url: url,
        data: data,
        dataType: 'json',
        success: function(response) {
          rs = response;

          // Assuming you want to fill the clicked element with the response
          if (typeof runfunction === 'function') {
            runfunction(response); // Pass the response to the callback function
          }
        },
        error: function(err) {
          console.error("Error:", err);
        }
      });
    });
  }
  function _0_1(button, url, who, runfunction) {
    $(document).on('click', button, function() {
      var idToDelete = $(this).data('id'); // Use $(this) to reference the clicked element
      var data = {
        id: idToDelete,
        who: who,
      };

      $.ajax({
        type: "POST",
        url: url,
        data: data,
        //  dataType: 'json',
        success: function(response) {
          rs = response;

          // Assuming you want to fill the clicked element with the response
          if (typeof runfunction === 'function') {
            runfunction(response); // Pass the response to the callback function
          }
        },
        error: function(err) {
          console.error("Error:", err);
        }
      });
    });
  }
  function edit(from_id, url, runfunction,editor_id='') {

    $(from_id).submit(function(e) {
      e.preventDefault();
      var formData = new FormData(this);
         function add_edter(editor_id="",formData) {
        // Tab to edit
        if (editor_id !== '') {
          var objEditor = CKEDITOR.instances[editor_id];
          var sessionID = objEditor.getData();
          formData.append('editor', sessionID);
        }

      }

    add_edter(editor_id,formData)

      // var send_data = { formData: formData, who_add: who_add }
      $.ajax({
        url: url, // Replace with your PHP script URL
        type: 'POST',
        data: formData,
        contentType: false,
        processData: false,
        success: function(response) {
          rs = response;

          function clearForm(from_id) {
            var form = document.querySelector(from_id);
            form.reset();
            const modalDismissButtons = form.querySelectorAll('img');
            modalDismissButtons.forEach(button => button.src = '');
          }
          clearForm(from_id);

          function closeModal(from_id) {
            var form = document.querySelector(from_id);
            const modalDismissButtons = form.querySelectorAll('[data-bs-dismiss="modal"]');
            modalDismissButtons.forEach(button => button.click());
          }


          closeModal(from_id)
          // Assuming you want to fill the clicked element with the response
          //  $(get_all_produc:t_cat).html(response);

          if (typeof runfunction === 'function') {
            runfunction(); // Invoke the function passed as a parameter
          }





          // Handle the server response here
        }
      });
    });
  };
  function show_edit(edit_btn, partner_div_id, url, runfunction) {
    $(document).on('click', edit_btn, function() {
      var idToEdit = $(this).data('id'); // Use $(this) to reference the clicked element
      var data = {
        id: idToEdit,
      };

      $.ajax({
        type: "POST",
        url: url,
        data: data,
        success: function(response) {
          rs = response;

          $(partner_div_id).html(response); // Fill the specified div with the response

          // Assuming you want to fill the specified div with the response
          if (typeof runfunction === 'function') {
            runfunction(response); // Pass the response to the callback function
          } else {}
        },
        error: function(err) {
          console.error("Error:", err);
        }
      });
    });
  }



add("#addmission_form_id","./php/admission.php",(rs)=>{
  alert(rs)
},)















})



 
