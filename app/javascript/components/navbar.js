const switchColorNavbar = () => {
  const navbar = document.querySelector('.navbar-rv');
  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= navbar.offsetHeight) {
        navbar.classList.add('navbar-hover');
      } else {
        navbar.classList.remove('navbar-hover');
      }
    });
  }
};

const hideOnClikMenu = () => {
  const burger = document.querySelector(".burger");
  const background = document.querySelector(".background-mobile");
  const about = document.querySelector(".mobile-about");
  const menuItems = document.querySelectorAll(".mobile-item");

  burger.addEventListener("click", () => {
    background.classList.toggle("menu-active");
    about.classList.toggle("menu-active");
    burger.classList.toggle("menu-active");
    menuItems.forEach((item) =>{
      item.classList.toggle("menu-active");
    });
  });
};

export {switchColorNavbar, hideOnClikMenu};
