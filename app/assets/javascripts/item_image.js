$(document).on("turbolinks:load", function() {
  let dropzone = $(".dropzone-area");
  let dropzone2 = $(".dropzone-area2");
  let images = [];
  let inputs = [];
  let input_area = $(".input_area");
  let preview = $("#preview");
  let preview2 = $("#preview2");
  let defaultInput = [];
  let i = 0;

  function appendPreview(index) {
    let previewHtml = $(`<div class="img_view" data-image="${index}"><img>
                          <div class="btn_wrapper">
                            <div class="btn delete">削除
                            </div>
                          </div>
                        </div>`);
    return previewHtml;
  }

  $(document).on("change", 'input[type= "file"].upload-image', function() {
    let file = $(this).prop("files")[0];
    let reader = new FileReader();
    inputs.push($(this));
    let img = appendPreview(i);
    reader.onload = function(e) {
      img.find("img").attr({
        src: e.target.result
      });
    };
    reader.readAsDataURL(file);
    images.push(img);

    if (images.length >= 5) {
      dropzone2.css({
        display: "block"
      });
      dropzone.css({
        display: "none"
      });
      preview.children().remove();
      preview2.children().remove();
      $.each(images, function(index, image) {
        if (index < 5) {
          preview.append(image);
        } else {
          preview2.append(image);
        }
      });
      dropzone2.css({
        width: `calc(100% - (124px * ${images.length - 5}))`
      });
    } else {
      preview.children().remove();
      preview2.children().remove();
      $.each(images, function(index, image) {
        if (index < 5) {
          preview.append(image);
        } else {
          preview2.append(image);
        }
      });
      dropzone.css({
        width: `calc(100% - (124px * ${images.length}))`
      });
    }
    if (images.length == 10) {
      dropzone2.css({
        display: "none"
      });
      dropzone.css({
        display: "none"
      });
      return;
    }
    i += 1;
    let new_image = $(
      `<input multiple= "multiple" name="images[image][]" class="upload-image" data-image= ${i} type="file" id="upload-image">`
    );
    input_area.prepend(new_image);
  });

  $(document).on("click", ".delete", function() {
    let target_image = $(this)
      .parent()
      .parent();
    $.each(images, function(index, image) {
      if (image.attr("data-image") == target_image.data("image")) {
        images_index = index;
      }
    });
    $.each(inputs, function(index) {
      if ($(this).data("image") == target_image.data("image")) {
        inputs_index = index;
        $(this).remove();
        target_image.remove();
        images.splice(images_index, 1);
        inputs.splice(inputs_index, 1);
      }
    });
    $.each(defaultInput, function(input) {
      if (input == target_image.data("id")) {
        target_image.remove();
        defaultInput.splice(
          $.inArray(target_image.data("id"), defaultInput),
          1
        );
        images.splice(images_index, 1);
      }
    });

    if (inputs.length == 0) {
      input_area.children().remove();
      i += 1;
      let new_image = $(
        `<input multiple= "multiple" name="images[image][]" class="upload-image" data-image= ${i} type="file" id="upload-image">`
      );
      input_area.prepend(new_image);
    }

    if (images.length >= 5) {
      dropzone.css({
        display: "none"
      });
      dropzone2.css({
        display: "block"
      });
      preview.children().remove();
      preview2.children().remove();
      $.each(images, function(index, image) {
        if (index < 5) {
          preview.append(image);
        } else {
          preview2.append(image);
        }
      });
      dropzone2.css({
        width: `calc(100% - (124px * ${images.length - 5}))`
      });
      if (images.length == 9) {
        dropzone2
          .find("i")
          .replaceWith(
            '<p class="input-area-text">ここをクリックしてください</p>'
          );
      }
    } else {
      dropzone.css({
        display: "block"
      });
      dropzone2.css({
        display: "none"
      });
      preview.children().remove();
      $.each(images, function(index, image) {
        if (index < 5) {
          preview.append(image);
        } else {
          preview2.append(image);
        }
      });
      dropzone.css({
        width: `calc(100% - (124px * ${images.length}))`
      });
      if (images.length == 4) {
        dropzone
          .find("i")
          .replaceWith(
            '<p class="input-area-text">ここをクリックしてください</p>'
          );
          dropzone2.css({
            display: "none"
          });
      }
    }
  });
});
