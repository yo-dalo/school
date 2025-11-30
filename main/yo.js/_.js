//use jQuery cdn  


function addState(path) {
  let stateObj = { id: "100" };
  window.history.pushState(stateObj,
    "Page", path);
}

function ajax(url) {
  const httpRequest = new XMLHttpRequest();
  httpRequest.onreadystatechange = writeContent;
  httpRequest.open('POST', url);

  httpRequest.send();

  function writeContent() {
    if (httpRequest.readyState === 4) {
      if (httpRequest.status == 200) {
        const response = httpRequest.responseText;
        document.querySelector("body").innerHTML = response;
      } else {
        alert('There was a problem with the request.');
      }
    } else {
      // response not ready yet
    }

  }
}


$(document).ready(function() {
  $(document).on('click', "a", function(e) {
    e.preventDefault();
    var _url = this.pathname;
    if (this.search != '') {

      _url = _url + this.search;
    }


    addState(_url)
    console.log(_url);
    setTimeout(() => {
      ajax(_url)

    }, 100)

    //  alert(_url)


  })
})


window.addEventListener("popstate", () => {

  var _url = window.location.pathname;

  if (window.location.search != '') {
    _url = _url + window.location.search;
  }


  ajax(_url);
});