const switchColorNavbar = () => {
  const navbar = document.querySelector('.navbar-rv');
  console.log(navbar);
  if (navbar) {
    window.addEventListener('scroll', () => {
      console.log(window.innerHeight);
      if (window.scrollY >= navbar.offsetHeight) {
        navbar.classList.add('navbar-hover');
      } else {
        navbar.classList.remove('navbar-hover');
      }
    });
  }
}
 const navbar = document.querySelector('.navbar-rv');
export {switchColorNavbar};
