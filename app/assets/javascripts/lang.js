$(function(){
  const searchResult = $('.result');

  function addLanguage(langID) {
    let html = `<input value="${langID}" type="hidden" name="quiz[language_id]" id="quiz_language_id">`;
    $("ul").after(html);
  }
  function addSyntax(lang) {
    var addText = `\`\`\`${lang}\n\n\`\`\``;
    return addText;
  }
  function builtHTML(data){
  let html = `
  <li class="btn btn-outline-dark" data-index="${data.id}" data-language="${data.language}">${data.language}</li>
  `;
  console.log(data);
  searchResult.append(html);
  }

  $('#lang').on('keyup',function (e) {
    e.preventDefault();
    let input = $(this).val();
    
    $.ajax({
      type: 'GET',
      url: '/quizzes/lang',
      dataType: 'json',
      data: {keyword: input},
    })
    .done(function(languages){
      searchResult.empty(); //再度検索した際に前のデータを消す処理
      if (languages.length !== 0) {
        languages.forEach(function(language) { //languagesは配列型に格納されているのでEach文で回す
          let result = language
          builtHTML(result);
          console.log(result);
        });
      } else {
        console.log('該当する商品はありません')
      }
    })
    .fail(function(textStatus,data){
      alert('非同期通信に失敗しました');
      console.log(textStatus+ "text");
      console.log(data+ "data");
    })
  });
  $(document).on('click',"li.btn", function() {
    const langId = $(this).attr('data-index');
    const lang = $(this).attr('data-language');
    console.log('click');
    console.log(lang);
    addLanguage(langId);
    $("textarea").val(addSyntax(lang));
    $(this).removeClass("btn-outline-dark");
    $(this).addClass("btn-dark");
  });
  $(document).on('click','#question-reset', function() {
    $("#question_textarea").val("");
  })
  $(document).on('click','#answer-reset', function() {
    $("#markdown_editor_textarea").val("");
  })
  $(document).on('click','#all-reset', function() {
    $("textarea").val("");
    $("input[type=text]").val("");
    $("li").remove();
  })
})