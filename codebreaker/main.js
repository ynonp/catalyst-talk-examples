(function() {

  var template  = document.querySelector('#message-line');
  var container = document.querySelector('.container');
  var ENCRYPT_URL = '/codebreaker/encrypt';
  var DECIPHER_URL    = '/codebreaker/decipher';

  document.querySelector('button').addEventListener('click', function() {
    var beforeWhat = container.lastChild;
    var newElement = document.createElement('div');
    newElement.innerHTML = template.innerHTML;

    container.insertBefore(newElement, beforeWhat);
  });

  container.addEventListener('input', function(e) {
    var xhr = new XMLHttpRequest();
    var msg = e.target.value;

    var result_box = e.target.parentElement.parentElement.querySelectorAll('input')[1];

    xhr.open('POST', ENCRYPT_URL);
    xhr.setRequestHeader('Content-Type', 'application/json');


    xhr.onload = function(e) {
      var res = JSON.parse(xhr.response);
      result_box.value = res.cipher;
      console.dir(xhr.response);
    };

    xhr.send(JSON.stringify({ message: msg}));
    console.log("sent");
  });

  container.addEventListener('click', function(e) {
    console.dir(e);
    if ( ! e.target.classList.contains('break') ) {
      return;
    }

    console.log("decipher");
    var row = e.target.parentElement.parentElement;

    var target = row.querySelector('.encrypted').value;
    var messages = [].map.call(container.querySelectorAll('.encrypted'), function(el) {
      return el.value;
    });

    var result_box = row.querySelector('.encrypted');

    decipher(target, messages, result_box);
  });

  var decipher = function(target, messages, result_box) {
    var xhr = new XMLHttpRequest();
    var msg = {
      target: target,
      messages: messages
    };

    xhr.open('POST', DECIPHER_URL);
    xhr.setRequestHeader('Content-Type', 'application/json');

    xhr.onload = function(e) {
      result_box.value = JSON.parse(xhr.response).result;
    };

    xhr.send(JSON.stringify(msg));
    console.log('<<<');
  };

}());
