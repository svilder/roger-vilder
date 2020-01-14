
const showMorePersonnalCollection = () => {
  const showMore = document.getElementById("button-show-personnal");
  const hiddenExhibition =  document.querySelector("#showed-personnal-exhibitions");
  showMore.addEventListener('click',(e) => {
    hiddenExhibition.classList.toggle('swap');
  });
};


const showMoreCollectiveCollection = () => {
  const showMore = document.getElementById("button-show-collective");
  const hiddenExhibition =  document.querySelector("#showed-collective-exhibitions");
  showMore.addEventListener('click',(e) => {
    hiddenExhibition.classList.toggle('swap');
  });
};

export { showMorePersonnalCollection, showMoreCollectiveCollection }
