import "bootstrap";

// assets/particles.json

if (document.getElementById('particles-js')) {
  particlesJS.load('particles-js', 'https://api.jsonbin.io/b/5f116b519180616628434b4a', function() {
    console.log('callback - particles.js config loaded');
  });
};
