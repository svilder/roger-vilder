
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

const showMorePermanentCollection = () => {
  const showMore = document.getElementById("button-show-permanent");
  const hiddenExhibition =  document.querySelector("#showed-permanent-exhibitions");
  showMore.addEventListener('click',(e) => {
    hiddenExhibition.classList.toggle('swap');
  });
};

const showMoreBibliographiesCollection = () => {
  const showMore = document.getElementById("button-show-bibliographies");
  const hiddenExhibition =  document.querySelector("#showed-bibliographies-exhibitions");
  showMore.addEventListener('click',(e) => {
    hiddenExhibition.classList.toggle('swap');
  });
};
// export { showMorePersonnalCollection, showMoreCollectiveCollection, showMorePermanentCollection, showMoreBibliographiesCollection}
