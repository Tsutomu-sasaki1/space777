if (document.URL.match( /new/ ) || document.URL.match( /edit/ )) {
  document.addEventListener('DOMContentLoaded', () => {
    const ImageList = document.getElementById('image-list');
    
    //選択した画像を表示する関数
    const createImageHTML = (blob) => {
        //画像を表示するためのdiv要素を生成
      const imageElement = document.createElement('div');
      imageElement.setAttribute('class', "image-element");
      let imageElementNum = document.querySelectorAll(".image-element");

        //表示する画像を生成
      const blobImage = document.createElement('img');
      blobImage.setAttribute('src', blob);

       //ファイル選択ボタンを生成
      const inputHTML = document.createElement('input');
      inputHTML.setAttribute('id', `post_image_${imageElementNum}`);
      inputHTML.setAttribute('name', 'post[images][]');
      inputHTML.setAttribute('type', 'file');

      const deleteHTML = document.createElement('delete');


      //生成したHTMLの要素をブラウザに表示させる
      imageElement.appendChild(deleteHTML);
      imageElement.appendChild(blobImage);
      imageElement.appendChild(inputHTML);
      ImageList.appendChild(imageElement);
      
      inputHTML.addEventListener('change',(e) => {
         file = e.target.files[0];
         blob = window.URL.createObjectURL(file);
        
        createImageHTML(blob);
      });
    };

    document.getElementById('item-image').addEventListener('change',(e) => {
      let file = e.target.files[0];
      let blob = window.URL.createObjectURL(file);
    
      createImageHTML(blob);
    });
  });
}