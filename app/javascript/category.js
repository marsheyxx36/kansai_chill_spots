$(function(){
    function appendOption(category){
      var html = `<option value="${category.id}">${category.name}</option>`;
      return html;
    }
    function appendChildrenBox(insertHTML){
      var childSelectHtml = "";
      childSelectHtml = `<div class="category__child" id="children_wrapper">
                          <select id="child__category" name="post[area_id]" class="serect_field">
                            <option value="">---</option>
                            ${insertHTML}
                          </select>
                        </div>`;
      $('.append__category').append(childSelectHtml);
    }

    $('#post_area_id').on('change',function(){
      var parentId = document.getElementById('post_area_id').value;
      if (parentId != ""){
        console.log(parentId)
        $.ajax({
          url: '/posts/get_category_children',
          type: 'GET',
          data: { parent_id: parentId },
          dataType: 'json'
        })
        .done(function(children){
          $('#children_wrapper').remove();
          $('#grandchildren_wrapper').remove();
          var insertHTML = '';
          children.forEach(function(child){
            insertHTML += appendOption(child);
          });
          appendChildrenBox(insertHTML);
        })
        .fail(function(){
          window.alert('カテゴリー取得に失敗しました');
        })
      }else{
        $('#children_wrapper').remove();
        $('#grandchildren_wrapper').remove();
      }
    });
  });
  