/* IE9+ Closest + Matches Polyfill */
if (!Element.prototype.matches) {
  Element.prototype.matches =
    Element.prototype.msMatchesSelector ||
    Element.prototype.webkitMatchesSelector;
}

if (!Element.prototype.closest) {
  Element.prototype.closest = function(s) {
    var el = this;

    do {
      if (el.matches(s)) return el;
      el = el.parentElement || el.parentNode;
    } while (el !== null && el.nodeType === 1);
    return null;
  };
}

/* Focus and blur methods for Floating Labels */
document.addEventListener(
  "focus",
  function(e) {
    if (e.target.closest(".mdwc-input-text--outlined") && !e.target.closest(".mdwc-input-text--outlined").classList.contains('mdwc-input-text--disabled')) {
      var container = e.target.closest(".mdwc-input-text--outlined"),
        notch = container.querySelector(".mdwc-notched-outline__notch"),
        label = notch.querySelector(".mdwc-floating-label"),
        transformedWidth;

      if (!notch.classList.contains("mdwc-notched-outline__notch--notched")) {
        label.style.transform = "scale(0.75, 0.75)";
        label.style.transition = "none";
        transformedWidth = label.getBoundingClientRect().width + 10;
        label.style.removeProperty("transform");
        label.style.removeProperty("transition");
        notch.style.width = transformedWidth + "px";  
      }

      container.classList.add("mdwc-input-text--focused");
      notch.classList.add("mdwc-notched-outline__notch--notched");
    }
  },
  true
);

document.addEventListener(
  "blur",
  function(e) {
    if (
      e.target.matches(".mdwc-input-text__input") &&
      e.target.closest(".mdwc-input-text--outlined")
    ) {
      var container = e.target.closest(".mdwc-input-text--outlined"),
        notch = container.querySelector(".mdwc-notched-outline__notch");

      container.classList.remove("mdwc-input-text--focused");
      if (!e.target.value) {
        notch.classList.remove("mdwc-notched-outline__notch--notched");
        notch.style.removeProperty("width");
      }
    }
  },
  true
);

/* Toggle Input disable */
document.querySelector('._toggleDisable').addEventListener('click', function(e){
  var inputContainers = document.querySelectorAll('.mdwc-input-text'),
      i = 0;
  for(; i < inputContainers.length; i++) {
    var elem = inputContainers[i],
        input = elem.querySelector('.mdwc-input-text__input');
    elem.classList.toggle('mdwc-input-text--disabled');
    input.disabled = !input.disabled; 
  }
}, false);
