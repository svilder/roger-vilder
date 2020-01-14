
const showMorePersonnalCollection = () => {
  const showMore = document.getElementById("button-show-personnal");
  const hiddenExhibition =  document.querySelector(".exhibitions-showed");
  showMore.addEventListener('click',(e) => {
    hiddenExhibition.classList.toggle('swap');
  });
};

export { showMorePersonnalCollection }
