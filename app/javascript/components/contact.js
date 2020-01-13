
const showMorePersonnalCollection = () => {
  const showMore = document.getElementById("button-show-personnal");
  const hiddenExhibition =  document.querySelector("#hidden-personnal-exhibitions");
  showMore.addEventListener('click',(e) => {
    hiddenExhibition.classList.toggle('exhibitions-hidden');
  });
};

export { showMorePersonnalCollection }
