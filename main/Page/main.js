  const navBar = document.querySelector("#openPhoneMenuBtn");
  const mainNav = document.querySelector(".mainNav2");
  const welcomeInfo = document.querySelector(".walcome_info");
  const page1 = document.querySelector(".page_1");

  navBar.addEventListener("click", () => {
    mainNav.style.display = "block";
    mainNav.style.transition = "transform 0.5s ease";
    mainNav.style.transform = "translateX(0)";
    page1.style.overflowX = "hidden";
  });

  // Scroll animation for welcome_info
  window.addEventListener("scroll", () => {
    const triggerPoint = page1.offsetTop;
    const scrollPos = window.scrollY;

    if (scrollPos >= triggerPoint) {
      welcomeInfo.style.transition = "transform 1s ease";
      welcomeInfo.style.transform = "translateX(0)";
    }
  });

  // Initial state for welcome_info
  window.addEventListener("DOMContentLoaded", () => {
    welcomeInfo.style.transform = "translateX(-50vw)";
  });
