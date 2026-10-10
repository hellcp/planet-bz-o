let dropdowns = document.querySelectorAll(".dropdown");

for (let i = 0; i < dropdowns.length; i++) {
  let dropdown_toggles = dropdowns[i].querySelectorAll(".dropdown-toggle");
  for (let j = 0; j < dropdown_toggles.length; j++) {
    dropdown_toggles[j].addEventListener("click", revealDropdown);
  }
}

function revealDropdown(e) {
  e.preventDefault();
  e.stopPropagation();
  let dropdown_button = e.target;
  let dropdown = dropdown_button.closest('.dropdown');
  var hidden = !dropdown.classList.contains('show');
  for (let i = 0; i < dropdowns.length; i++) {
    dropdowns[i].classList.remove('show');
  }
  dropdown.classList.toggle('show', hidden);
}

let navbar = document.getElementById("navbar");
navbar.classList.remove("show");
let navbar_button = document.getElementById("navbar-button");

navbar_button.addEventListener("click", revealNavmenu);

function revealNavmenu(e) {
  e.preventDefault();
  e.stopPropagation();
  navbar.classList.toggle('show');
}
