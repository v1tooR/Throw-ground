$(document).ready(function(){
    // Adicionar movimento suave a todos os componentes
    $("a").on('click', function(event) {

        // Verificar se this.hash tem valor
        if (this.hash !== "") {
        // Evento padrão do JQuery
        event.preventDefault();

        // Guardar hash
        var hash = this.hash;

        // jQuery animate()
        $('html, body').animate({
            scrollTop: $(hash).offset().top
        }, 800, function(){

            // Adicionar # ao acessar a tag
            window.location.hash = hash;
        });
        }
    });
});

var slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("dot");
  if (n > slides.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";  
  }
  for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " active";
}