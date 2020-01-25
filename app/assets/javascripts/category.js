$(document).on('turbolinks:load', function() {
  function appendOption(category) {
    let html = `<option value="${category.id}" data-category="${category.id}">${category.name}</option>`;
    return html
  }
  function appendChild(insertHTML) {
    let childSelectHtml = '';
    childSelectHtml = `<div id='child-box'>
                        <select class='form' name='product[category_id]' id='child_category'>
                          <option value='---' data-category='---' class='form'>---</option>
                            ${insertHTML}
                        </select>
                      </div>`;
    $('.category').append(childSelectHtml);
  }
  function appendGrandchild(insertHTML) {
    let grandchildSelectHtml = '';
    grandchildSelectHtml = `<div id='grandchild-box'>
                              <select class='form' name='product[category_id]' id='grandchild_category'>
                                <option value='---' data-category='---'>---</option>
                                  ${insertHTML}
                              </select>
                            </div>`;
    $('.category').append(grandchildSelectHtml);
  }
  
  $('#parent_category').on('change', function () {
    let parentCategory = document.getElementById('parent_category').value
    if (parentCategory !== "") {
      $.ajax({
        url: '/products/category_children',
        type: 'GET',
        data: { name: parentCategory },
        dataType: 'json'
      })
        .done(function (children) {
          $('#child-box').remove();
          $('#grandchild-box').remove();
          var insertHTML = '';
          children.forEach(function (child) {
            insertHTML += appendOption(child);
          });
          appendChild(insertHTML);
        })
        .fail(function () {
          alert('error');
        })
    } else {
      $('#child-box').remove();
      $('#grandchild-box').remove();
    }
  });

  $('.category').on('change', '#child_category', function () {
    let childId = $('#child_category option:selected').data('category');
    if (childId != "") {
      $.ajax({
        url: '/products/category_grandchildren',
        type: 'GET',
        data: { child_id: childId },
        dataType: 'json'
      })
        .done(function (grandchildren) {
          if (grandchildren.length != 0) {
            $('#grandchild-box').remove();
            var insertHTML = '';
            grandchildren.forEach(function (grandchild) {
              insertHTML += appendOption(grandchild);
            });
            appendGrandchild(insertHTML);
          }
        })
        .fail(function () {
          alert('error');
        })
    } else {
      $('#grandchild-box').remove();
    }
  });
})