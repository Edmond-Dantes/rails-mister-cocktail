import Typed from 'typed.js';

function loadDynamicCardText(id_number) {
  // console.log(id_number);
  new Typed(`#dynamic-card${id_number}`, {
    typeSpeed: 50,
    loop: true,
    stringsElement: `#dynamic-card-text${id_number}`,
    showCursor: false,
  });
}

export { loadDynamicCardText };
